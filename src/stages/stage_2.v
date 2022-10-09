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
               output reg[4:0] rd_num,
               output reg[31:0] alu_op_1;
               output reg[31:0] alu_op_2;
               output reg[3:0] alu_op
               output reg[2:0] mem_op,
               output reg[2:0] alu_mem_op);
               
               //output reg[31:0] rs_1,
               //output reg[31:0] rs_2,
               //output reg[4:0] rd_num,
			   //output reg[6:0] opcode,
               //output reg[6:0] func_7,
               //output reg[2:0] func_3,
               //output reg[11:0] imm_12_i,
               //output reg[19:0] imm_20,
               //output reg[11:0] imm_12_b,
               //output reg[19:0] imm_20_i,
               //output reg[11:0] imm_12_s);
                                                  
    wire[6:0] opcode = i_inst[6:0];
    wire[2:0] func_3 = i_inst[14:12];
    wire[6:0] func_7 = i_inst[31:25];
    wire[11:0] imm_12_i = i_inst[31:20];
    wire[19:0] imm_20 = {i_inst[31], i_inst[19:12], i_inst[20], i_inst[30:21]};
    wire[11:0] imm_12_b = {i_inst[31], i_inst[7], i_inst[30:25], i_inst[11:8]};
    wire[19:0] imm_20_i = {i_inst[31:12]};
    wire[11:0] imm_12_s = {i_inst[31:25], i_inst[11:7]}; 
	
	wire[4:0] i_reg_num_1 = i_inst[19:15];
	wire[4:0] i_reg_num_2 = i_inst[24:20];
	wire[4:0] rd_num = i_inst[11:7];
	wire[31:0] pc = i_pc;
	wire[31:0] rs_1;
	wire[31:0] rs_2;
	wire[31:0] b_pc;
	wire b_taken;
	wire stall;
	
	wire[31:0] add_op_1;
	wire[31:0] add_op_2;
	
	wire[31:0] imm_20_i_s_ext = SIGN_EXTEND(imm_20_i, 20, 32);
	wire[31:0] imm_12_i_s_ext = SIGN_EXTEND(imm_12_i, 12, 32);
	wire[31:0] imm_12_b_s_ext = SIGN_EXTEND(imm_12_b, 12, 32);
	wire[31:0] lui_auipc = {i_imm_20_i, 12'b0};
	
	always @(*) begin
		case (opcode)
			`OPIMM: begin
				alu_mem_op = `ALU_OP;
				case (i_func_3)
					`ADDI: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						alu_op = `ALU_ADD;
					end
					`SLTI: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						alu_op = `ALU_SLT;
					end
					`SLTIU: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						alu_op = `ALU_SLTU;
					end
					`ANDI: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						alu_op = `ALU_AND;
					end
					`ORI: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						alu_op = `ALU_OR;
					end
					`XORI: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						alu_op = `ALU_XOR;
					end
					`SLLI: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						alu_op = `ALU_SLL;
					end
					`SRLISRAI: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `IMM_12_I_S_EXT;
						if (i_func_7 == `SRLI) alu_op = `ALU_SRL;
						else if (i_func_7 == `SRAI) alu_op = `ALU_SRA;
					end
				endcase
			end
			`OP: begin
				alu_mem_op = `ALU_OP;
				case (i_func_3)
					`ADDSUB: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						if (i_func_7 == `ADD) alu_op = `ALU_ADD;
						else begin if (i_func_7 == `SUB) alu_op = `ALU_SUB;  
					end
					`SLT: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						alu_op = `ALU_SLT;
					end
					`SLTU: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						alu_op = `ALU_SLTU;
					end
					`AND: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						alu_op = `ALU_AND;
					end
					`OR: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						alu_op = `ALU_OR;
					end
					`XOR: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						alu_op = `ALU_XOR;
					end
					`SLL: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						alu_op = `ALU_SLL;
					end
					`SRLSRA: begin
						alu_op_1 = `RS_1;
						alu_op_2 = `RS_2;
						if (i_func_7 == `SRL) alu_op = `ALU_SRL;
						else if (i_func_7 == `SRA) alu_op = `ALU_SRA;
					end
				endcase
			end
			`JAL: begin
				adder_0_op_1 = pc;
				adder_0_op_2 = imm_20_i_s_ext; 
				b_taken = 1;// check underscore
				alu_op_1 = `PC;
				alu_op_2 = `IMM_4;
				alu_op = `ALU_ADD;
			end
			`JALR: begin
				adder_0_op_1 = i_rs_1;
				adder_0_op_2 = _imm_12_i_s_ext  & 0xfffffffe;
				b_taken = 1;
				alu_op_1 = `PC;
				alu_op_1 = `IMM_4;
				alu_op = `ALU_ADD;
			end
			`LUI: begin
				alu_mem_op = `ALU_OP;
				alu_op_1 = `LUI_AUIPC;
			    alu_op_2 = `IMM_0;
			    alu_op = `ALU_ADD;
			end
			`AUIPC: begin
				alu_mem_op = `ALU_OP;
				alu_op_1 = `LUI_AUIPC;
			    alu_op_2 = `PC
			    alu_op = `ALU_ADD;
			end
			`LOAD: begin
			    alu_mem_op = `MEM_OP;
				alu_op_1 = `RS_1;
				alu_op_2 = `IMM_12_I_S_EXT
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
						op_mem = `WRITE_8_U
					end
					`LHU: begin
						op_mem = `WRITE_U
					end
				endcase
			end
			`STORE: begin
			    alu_mem_op = `MEM_OP;
				alu_op_1 = `RS_1;
			    alu_op_2 = `IMM_12_I_S_EXT;
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
			
			comparator
			https://eevibes.com/digital-logic-design/how-to-design-a-4-bit-magnitude-comparator-circuit/
			comparator by sub
			https://www.edaboard.com/threads/how-to-compare-two-data-in-2s-complement-form.40814/
			
			`BRANCH: begin
				if (i_imm_12_b[11] == 0) b_pc = i_pc + `ABS(tmp_6, 32);
				else b_pc = i_pc - `ABS(tmp_6, 32);
				
				b_pc = i_pc + imm_12_b_s_ext;
				
				case (i_func_3)
					`BEQ: begin
				   		if (i_rs_1 == i_rs_2) b_taken = 1;
				       	else b_taken = 0;
				   	end
                  	`BNE: begin
                   		if (i_rs_1 != i_rs_2) b_taken = 1;
                      	else b_taken = 0;
                	end
                  	`BLT: begin
						if (`SIGNED(i_rs_1) < `SIGNED(i_rs_2)) b_taken = 1;
						else b_taken = 0;
					end
					`BLTU: begin
						if (`ABS(i_rs_1, 32) < `ABS(i_rs_2, 32)) b_taken = 1;
					   	else b_taken = 0;
					end
					`BGE: begin
						if (`SIGNED(i_rs_1) > `SIGNED(i_rs_2)) b_taken = 1;
						else b_taken = 0;
					end
					`BGEU: begin
						if (`ABS(i_rs_1, 32) > `ABS(i_rs_2, 32)) b_taken = 1;
						else b_taken = 0;
					end
				endcase
			end
			
			
			default: begin
				alu_mem_op = `ALU_OP;
				op_mem = `READ_32;
				alu_op_1 = `IMM_0;
			    alu_op_2 = `IMM_0;
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
	
	adder adder_0(.i_in_1(adder_0_op_1),
		          .i_in_2(adder_0_op_2),
	              .out(b_pc));

	
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
