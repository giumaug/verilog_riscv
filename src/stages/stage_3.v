`ifndef STAGE_2           
`define STAGE_2
`include "constants.vh"
`include "controllers/branch_unit.v"
`include "memory/register_file.v"
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
			   output[31:0] rs_1,
               output[31:0] rs_2,
               output[4:0] rd_num,
               output[31:0] alu_out,
               output[6:0] opcode,
               output[2:0] func_3,
               output reg op_type);

	always @(*) begin
		case (opcode)
			`OPIMM: begin
				op_type = 0;
				case (i_func_3)
					`ADDI: begin
						$display("instruction ADDI")
						alu_out = i_rs_1 + i_imm_12_i;
					end
					`SLTI: begin
						$display("instruction SLTI")
						if ($signed(i_rs_1) < $signed(i_imm_12_i)) alu_out = 1;
						else alu_out = 0;
					end
					`SLTIU: begin
						$display("instruction SLTIU")
						if (!signedCompare(i_rs_1, i_imm_12_i)) alu_out = 1;
						else alu_out = 0; 
					end
					`ANDI: begin
						$display("instruction ANDI")
						alu_out = i_rs_1 & i_imm_12_i;
					end
					`ORI: begin
						$display("instruction ORI")
						alu_out = i_rs_1 | i_imm_12_i;
					end
					`XORI: begin
						$display("instruction XORI")
						alu_out = i_rs_1 ^ i_imm_12_i;
					end
					`SLLI: begin
						$display("instruction SLLI")
						alu_out = i_rs_1 << shiftImm;
					end
					`SRLISRAI: begin
						$display("instruction SRLISRAI")
						if (i_func_7 == `SRLI)	alu_out = i_rs_1 >> shiftImm;
						else if (i_func_7 == `SRAI) alu_out = (i_rs_1 >> shiftImm) | {idEx.rRs1()[31:31], 31'b0};
					end
				endcase
			end
			`OP: begin
				op_type = 0;
				case (i_func3)
					`ADDSUB: begin
						$display("instruction ADDSUB")
						if (i_func_7 == `ADD) alu_out = i_rs_1 + i_rs_2;
						else if (i_func_7 == `SUB) alu_out = i_rs_1 - i_rs_2;
					end
					`SLT: begin
						$display("instruction SLT")
						if (i_rs_1 < i_rs_2) alu_out = 1;
						else alu_out = 0;
					end
					`SLTU: begin
						$display("instruction SLTU")
						if (!signedCompare(i_rs_1, i_rs_2)) alu_out = 1;
						else alu_out = 0;
					end
					`AND: begin
						$display("instruction AND")
						alu_out = i_rs_1 & i_rs_2;
					end
					`OR: begin
						$display("instruction OR")
						alu_out = i_rs_1 | i_rs_2;
					end
					`XOR: begin
						$display("instruction XOR")
						alu_out = i_rs_1 ^ i_rs_2;
					end
					`SLL: begin
						$display("instruction SLL")
						alu_out = rs1 << shiftReg;
					end
					`SRLSRA: begin
						$display("instruction SRLSRA")
						if (i_func_7 == `SRL) alu_out = i_rs_1 >> shiftReg;
						else if (i_func_7 == `SRA) alu_out = (i_rs_1 >> shiftReg) | {idEx.rRs1()[31:31], 31'b0};
					end
				endcase
			end
			`JAL: begin
				$display("instruction JAL")
				op_type = 0;
				alu_out = i_pc + 4;
			end
			`JALR: begin
				$display("instruction JALR")
				op_type = 0;
				alu_out = i_pc + 4;
			end
			`LUI: begin
				$display("instruction LUI")
				op_type = 0;
				alu_out = {i_imm_20_i, 12'b0};
			end
			`AUIPC: begin
				$display("instruction AUIPC")
				op_type = 0;
				alu_out = {i_imm_20_i, 12'b0} + pc;
			end
			`LOAD: begin
				$display("instruction LOAD")
				op_type = 1;
				alu_out = i_rs_1 + i_imm_12_i;
			end
			`STORE: begin
				$display("instruction STORE")
				op_type = 1;
				alu_out = i_rs_1 + i_imm_12_s;
			end		
		endcase
	end
endmodule

