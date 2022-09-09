`ifndef STAGE_2           
`define STAGE_2
`include "constants.vh"
`include "controllers/branch_unit.v"
`include "controllers/data_hazard_unit.v"
`include "memory/register_file.v"
`endif

module stage_2(input i_rst,
               input i_reg_op,
			   input[31:0] i_w_rd,
               input[4:0] i_w_rd_num,
			   input[31:0] i_inst,
			   input[31:0] i_pc,
			   input[4:0] i_id_ex_rd_num,
	           input[4:0] i_ex_mem_rd_num,
	           output reg stall,
			   output reg b_taken,
               output reg[31:0] b_pc,
               output reg[31:0] pc,
               output reg[31:0] rs_1,
               output reg[31:0] rs_2,
               output reg[4:0] rd_num,
			   output reg[6:0] opcode,
               output reg[6:0] func_7,
               output reg[2:0] func_3,
               output reg[11:0] imm_12_i,
               output reg[19:0] imm_20,
               output reg[11:0] imm_12_b,
               output reg[19:0] imm_20_i,
               output reg[11:0] imm_12_s);
                                                  
    wire[6:0] _opcode = i_inst[6:0];
    wire[2:0] _func_3 = i_inst[14:12];
    wire[6:0] _func_7 = i_inst[31:25];
    wire[11:0] _imm_12_i = i_inst[31:20];
    wire[19:0] _imm_20 = {i_inst[31], i_inst[19:12], i_inst[20], i_inst[30:21]};
    wire[11:0] _imm_12_b = {i_inst[31], i_inst[7], i_inst[30:25], i_inst[11:8]};
    wire[19:0] _imm_20_i = {i_inst[31:12]};
    wire[11:0] _imm_12_s = {i_inst[31:25], i_inst[11:7]}; 
	
	wire[4:0] i_reg_num_1 = i_inst[19:15];
	wire[4:0] i_reg_num_2 = i_inst[24:20];
	wire[4:0] _rd_num = i_inst[11:7];
	wire[31:0] _pc = i_pc;
	wire[31:0] _rs_1;
	wire[31:0] _rs_2;
	wire[31:0] _b_pc;
	wire _b_taken;
	wire _stall;
	
	
	always @(*) begin
		case (opcode)
			`OPIMM: begin
				op_type = 0;
				case (i_func_3)
					`ADDI: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_SRL;
					end
					`SLTI: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_SLT;
					end
					`SLTIU: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_SLT;
					end
					`ANDI: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_AND;
					end
					`ORI: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
					end
					`XORI: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_OR;
					end
					`SLLI: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_SLL;
					end
					`SRLISRAI: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_2;
						if (i_func_7 == `SRLI) alu_op = `ALU_SRLI;
						else if (i_func_7 == `SRAI) alu_op = `ALU_SRAI;
					end
				endcase
			end
			`OP: begin
				op_type = 0;
				case (i_func_3)
					`ADDSUB: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						if (i_func_7 == `ADD) alu_op = `ALU_ADD;
						else begin if (i_func_7 == `SUB) alu_op = `ALU_SUB;  
					end
					`SLT: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_SLT;
					end
					`SLTU: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_SLTU;
					end
					`AND: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_AND;
					end
					`OR: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_OR;
					end
					`XOR: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_XOR;
					end
					`SLL: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_3;
						alu_op = `ALU_SLL;
					end
					`SRLSRA: begin
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_3;
						if (i_func_7 == `SRL) alu_op = `ALU_SRL;
						else if (i_func_7 == `SRA) alu_op = `ALU_SRA;
					end
				endcase
			end
			`JAL: begin
			    //Note: if imm is two complement negative number, the positive value is zeroExtend( ~ (imm - 1))
				if (_imm_20[19] == 0) _b_pc = _pc + `ABS(tmp_2, 32);
				else _b_pc = _pc - `ABS(tmp_2, 32);
				_b_taken = 1;
			end
			`JALR: begin
			    if (_imm_12_i[11] == 0) _b_pc = (i_rs_1 + tmp_3) & 4094;
				else _b_pc = (i_rs_1 - tmp_4) & 4094;
				_b_taken = 1;-----------------------------qui mettere a fattore comune add
			end
			`LUI: begin
				op_type = 0;
				alu_op_1 = {i_imm_20_i, 12'b0};
			    alu_op_2 = 32'd0;
			    alu_op = `ALU_ADD;
			end
			`AUIPC: begin
				op_type = 0;
				alu_op_1 = {i_imm_20_i, 12'b0};
			    alu_op_2 = i_pc;
			    alu_op = `ALU_ADD;
			end
			`LOAD: begin
			    op_type = 1;
				alu_op_1 = i_rs_1;
				alu_op_2 = tmp_1;
				alu_op = `ALU_ADD;
				case (i_func_3)
					`LB: begin
						op_mem = `READ_8_S;
					end
					`LH: begin
						op_mem = `READ_16_S;
					end
					`LW: begin
						op_mem = `READ_32;
					end
					`LBU: begin
						op_mem = WRITE_8_U
					end
					`LHU: begin
						op_mem = WRITE_U
					end
				endcase
			end
			`STORE: begin
			    op_type = 1;
				alu_op_1 = i_rs_1;
			    alu_op_2 = tmp_1;
			    alu_op = `ALU_ADD;
			    case (i_func_3)
					`SB: begin
					    op_mem = `WRITE_8;	
					end
					`SH: begin
			            op_mem = `WRITE_16;
					end
					`SW: begin
					    op_mem = `WRITE_32;	
					end
				endcase
			end
			default: begin
				op_type = 0;
				op_mem = 0;
				alu_op_1 = 32'd0;
			    alu_op_2 = 32'd0;
			    alu_op = `ALU_ADD;
			end	
		endcase
	end
	
	
	
	
	
	always @(*) begin
		if (_stall == 0) begin
			rd_num = _rd_num;
			opcode = _opcode;
			func_7 = _func_7;
			func_3 = _func_3; 
			imm_12_i = _imm_12_i;
			imm_20 = _imm_20;
			imm_12_b = _imm_12_b;
			imm_20_i = _imm_20_i;
			imm_12_s = _imm_12_s;
			pc = i_pc;
			rs_1 = _rs_1;
	        rs_2 = _rs_2;
	        b_pc = _b_pc;
	        b_taken = _b_taken;	        
		end
		else begin
			rd_num = 0;
			opcode = 0; 
			func_7 = 0;
			func_3 = 0;
			imm_12_i = 0;
			imm_20 = 0;
			imm_12_b = 0;
			imm_20_i = 0;
			imm_12_s = 0;
			pc = 0;
			rs_1 = 0;
	        rs_2 = 0;
	        b_pc = 0;
	        b_taken = 0;
		end
		stall = _stall;
	end
	
	branch_unit branch_unit_0(.i_pc(i_pc),
							  .i_opcode(_opcode),
                              .i_func_3(_func_3),
                              .i_func_7(_func_7),
			                  .i_imm_12_i(_imm_12_i),
                              .i_imm_20(_imm_20),
                              .i_imm_12_b(_imm_12_b),
                              .i_rs_1(_rs_1),
                              .i_rs_2(_rs_2),
			                  .b_taken(_b_taken),
                              .b_pc(_b_pc));

	register_file register_file_0(.i_rst(i_rst),
	                              .i_reg_num_1(i_reg_num_1),
                                  .i_reg_num_2(i_reg_num_2),
                                  .i_w_reg_num(i_w_rd_num),
                                  .i_w_val(i_w_rd),
                                  .i_op(i_reg_op),
								  .rs_1(_rs_1),
					              .rs_2(_rs_2));
					              
	data_hazard_unit data_hazard_unit_0(.i_opcode(_opcode),
	                                    .i_reg_num_1(i_reg_num_1),
	                                    .i_reg_num_2(i_reg_num_2),
	                                    .i_id_ex_rd_num(i_id_ex_rd_num),
	                                    .i_ex_mem_rd_num(i_ex_mem_rd_num),
	                                    .stall(_stall));					              
endmodule
