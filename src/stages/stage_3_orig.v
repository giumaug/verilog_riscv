`ifndef STAGE_3      
`define STAGE_3
`include "constants.vh"
`include "utils.vh"
`endif

module stage_3(input[31:0] i_pc,
			   input[31:0] i_rs_1,
			   input[31:0] i_rs_2,
			   input[4:0] i_rd_num,
			   input[11:0] i_imm_12_i,
               input[19:0] i_imm_20,
               input[11:0] i_imm_12_b,
               input[19:0] i_imm_20_i,
			   input[11:0] i_imm_12_s,
			   input[6:0] i_opcode,
			   input[2:0] i_func_3,
			   input[6:0] i_func_7,
			   //output[31:0] rs_1,
               output[31:0] rs_2,
               output[4:0] rd_num,
               output reg[31:0] alu_out,
               output[6:0] opcode,
               output[2:0] func_3,
               output reg op_type);
               
	//assign rs_1 = rs_1;
    assign rs_2 = i_rs_2;
    assign rd_num = i_rd_num;
    assign opcode = i_opcode;
    assign func_3 = i_func_3;
               
	wire[31:0] tmp_1 = `SIGN_EXTEND(i_imm_12_i, 12, 32);
	wire[4:0] tmp_2 = i_imm_12_i[4:0];
	wire[4:0] tmp_3 = i_rs_2[4:0];
	wire[31:0] tmp_4 = `SIGN_EXTEND(i_imm_12_s, 12, 32);
	always @(*) begin
		case (opcode)
			`OPIMM: begin
				op_type = 0;
				case (i_func_3)
					`ADDI: begin
						alu_out = i_rs_1 + tmp_1;
					end
					`SLTI: begin
						if (`SIGNED(i_rs_1) < `SIGNED(tmp_1)) alu_out = 1;
						else alu_out = 0;
					end
					`SLTIU: begin
						if (`ABS(i_rs_1, 32) < `ABS(tmp_1, 32)) alu_out = 1;
						else alu_out = 0; 
					end
					`ANDI: begin
						alu_out = i_rs_1 & tmp_1;
					end
					`ORI: begin
						alu_out = i_rs_1 | tmp_1;
					end
					`XORI: begin
						alu_out = i_rs_1 ^ tmp_1;
					end
					`SLLI: begin
						alu_out = i_rs_1 << tmp_2;
					end
					`SRLISRAI: begin
						if (i_func_7 == `SRLI)	alu_out = i_rs_1 >> tmp_2;
						else if (i_func_7 == `SRAI) alu_out = (i_rs_1 >> tmp_2) | {i_rs_1[31:31], 31'b0};
					end
				endcase
			end
			`OP: begin
				op_type = 0;
				case (i_func_3)
					`ADDSUB: begin
						if (i_func_7 == `ADD) alu_out = i_rs_1 + i_rs_2;
						else if (i_func_7 == `SUB) alu_out = i_rs_1 - i_rs_2;
					end
					`SLT: begin
						if (`SIGNED(i_rs_1) < `SIGNED(i_rs_2)) alu_out = 1;
						else alu_out = 0;
					end
					`SLTU: begin
						if (`ABS(i_rs_1, 32) < `ABS(i_rs_2, 32)) alu_out = 1;
						else alu_out = 0;
					end
					`AND: begin
						alu_out = i_rs_1 & i_rs_2;
					end
					`OR: begin
						alu_out = i_rs_1 | i_rs_2;
					end
					`XOR: begin
						alu_out = i_rs_1 ^ i_rs_2;
					end
					`SLL: begin
						alu_out = i_rs_1 << tmp_3;
					end
					`SRLSRA: begin
						if (i_func_7 == `SRL) alu_out = i_rs_1 >> tmp_3;
						else if (i_func_7 == `SRA) alu_out = (i_rs_1 >> tmp_3) | {i_rs_1[31:31], 31'b0};
					end
				endcase
			end
			`JAL: begin
				op_type = 0;
				alu_out = i_pc + 4;
			end
			`JALR: begin
				op_type = 0;
				alu_out = i_pc + 4;
			end
			`LUI: begin
				op_type = 0;
				alu_out = {i_imm_20_i, 12'b0};
			end
			`AUIPC: begin
				op_type = 0;
				alu_out = {i_imm_20_i, 12'b0} + i_pc;
			end
			`LOAD: begin
				op_type = 1;
				alu_out = i_rs_1 + tmp_1;
			end
			`STORE: begin
				op_type = 1;
				alu_out = i_rs_1 + tmp_4;
			end
			default: begin
				op_type = 0;
				alu_out = 0;
			end	
		endcase
	end
endmodule

