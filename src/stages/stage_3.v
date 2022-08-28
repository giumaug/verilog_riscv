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
	
	wire[31:0] addi_op_1 = i_rs_1;
	wire[31:0] addi_op_2 = tmp_1;
	wire[31:0] addi_alu_out;
	
	wire[31:0] slti_op_1 = `SIGNED(i_rs_1);
	wire[31:0] slti_op_2 = `SIGNED(tmp_1);
	wire[31:0] slti_alu_out;
	
	wire[31:0] sltiu_op_1 = `ABS(i_rs_1, 32);
	wire[31:0] sltiu_op_2 = `ABS(tmp_1, 32);
	wire[31:0] sltiu_alu_out;
	
	wire[31:0] ori_op_1 = i_rs_1;
	wire[31:0] ori_op_2 = tmp_1;
	wire[31:0] ori_alu_out;
	
	wire[31:0] xori_op_1 = i_rs_1;
	wire[31:0] xori_op_2 = tmp_1;
	wire[31:0] xori_alu_out;
	
	wire[31:0] slli_op_1 = i_rs_1;
	wire[31:0] slli_op_2 = tmp_2;
	wire[31:0] slli_alu_out;
	
	wire[31:0] srli_srai_op_1 = i_rs_1;
	wire[31:0] srli_srai_op_2 = tmp_2;
	wire[31:0] srli_alu_out;
	
	wire[31:0] add_sub_op_1 = i_rs_1;
	wire[31:0] add_sub_op_2 = i_rs_2;
	wire[31:0] add_sub_alu_out;
	
	wire[31:0] slt_op_1 = `SIGNED(i_rs_1);
	wire[31:0] slt_op_2 = `SIGNED(i_rs_2);
	wire[31:0] slt_alu_out;
	
	wire[31:0] sltu_op_1 = `ABS(i_rs_1, 32);
	wire[31:0] sltu_op_2 = `ABS(i_rs_2, 32);
	wire[31:0] sltu_alu_out;
	
	wire[31:0] and_op_1 = i_rs_1;
	wire[31:0] and_op_2 = i_rs_2;
	wire[31:0] and_alu_out;
	
	wire[31:0] or_op_1 = i_rs_1;
	wire[31:0] or_op_2 = i_rs_2;
	wire[31:0] or_alu_out;
	
	wire[31:0] xor_op_1 = i_rs_1;
	wire[31:0] xor_op_2 = i_rs_2;
	wire[31:0] xor_alu_out;
	
	wire[31:0] sll_op_1 = i_rs_1;
	wire[31:0] sll_op_2 = tmp_3;
	wire[31:0] sll_alu_out;
	
	wire[31:0] srl_sra_op_1 = i_rs_1;
	wire[31:0] srl_sra_op_2 = tmp_3;
	wire[31:0] srl_alu_out;
	
	wire[31:0] jal_op_1 = i_pc;
	wire[31:0] jal_op_2 = 4;
	wire[31:0] jal_alu_out;
	
	wire[31:0] jalr_op_1 = i_pc;
	wire[31:0] jalr_op_2 = 4;
	wire[31:0] jalr_alu_out;
	
	wire[31:0] lui_op_1 = i_imm_20_i;
	wire[31:0] lui_op_2 = 12'b0;
	wire[31:0] lui_alu_out;
	
	wire[31:0] auipc_op_1 = {i_imm_20_i, 12'b0};
	wire[31:0] auipc_op_2 = i_pc;
	wire[31:0] auipc_alu_out;
	
	wire[31:0] load_op_1 = i_rs_1;
	wire[31:0] load_op_2 = tmp_1;
	wire[31:0] load_alu_out;
	
	wire[31:0] store_op_1 = i_rs_1;
	wire[31:0] store_op_2 = tmp_4;
	wire[31:0] store_alu_out;
	
	always @(*) begin
		case (opcode)
			`OPIMM: begin
				op_type = 0;
				case (i_func_3)
					`ADDI: begin
						//alu_out = i_rs_1 + tmp_1;
						alu_out = addi_alu_out;-----------qui!!!!!!!!!!!!!!!!!!!!!!!!!!!
					end
					`SLTI: begin
						//if (`SIGNED(i_rs_1) < `SIGNED(tmp_1)) alu_out = 1;
						//else alu_out = 0;
					end
					`SLTIU: begin
						//if (`ABS(i_rs_1, 32) < `ABS(tmp_1, 32)) alu_out = 1;
						//else alu_out = 0; 
					end
					`ANDI: begin
						//alu_out = i_rs_1 & tmp_1;
					end
					`ORI: begin
						//alu_out = i_rs_1 | tmp_1;
					end
					`XORI: begin
						//alu_out = i_rs_1 ^ tmp_1;
					end
					`SLLI: begin
						//alu_out = i_rs_1 << tmp_2;
					end
					`SRLISRAI: begin
						//if (i_func_7 == `SRLI)	alu_out = i_rs_1 >> tmp_2;
						//else if (i_func_7 == `SRAI) alu_out = (i_rs_1 >> tmp_2) | {i_rs_1[31:31], 31'b0};
					end
				endcase
			end
			`OP: begin
				op_type = 0;
				case (i_func_3)
					`ADDSUB: begin
						//if (i_func_7 == `ADD) alu_out = i_rs_1 + i_rs_2;
						//else if (i_func_7 == `SUB) alu_out = i_rs_1 - i_rs_2;
					end
					`SLT: begin
						//if (`SIGNED(i_rs_1) < `SIGNED(i_rs_2)) alu_out = 1;
						//else alu_out = 0;
					end
					`SLTU: begin
						//if (`ABS(i_rs_1, 32) < `ABS(i_rs_2, 32)) alu_out = 1;
						//else alu_out = 0;
					end
					`AND: begin
						//alu_out = i_rs_1 & i_rs_2;
					end
					`OR: begin
						//alu_out = i_rs_1 | i_rs_2;
					end
					`XOR: begin
						//alu_out = i_rs_1 ^ i_rs_2;
					end
					`SLL: begin
						//alu_out = i_rs_1 << tmp_3;
					end
					`SRLSRA: begin
						//if (i_func_7 == `SRL) alu_out = i_rs_1 >> tmp_3;
						//else if (i_func_7 == `SRA) alu_out = (i_rs_1 >> tmp_3) | {i_rs_1[31:31], 31'b0};
					end
				endcase
			end
			`JAL: begin
				//op_type = 0;
				//alu_out = i_pc + 4;
			end
			`JALR: begin
				//op_type = 0;
				//alu_out = i_pc + 4;
			end
			`LUI: begin
				//op_type = 0;
				//alu_out = {i_imm_20_i, 12'b0};
			end
			`AUIPC: begin
				//op_type = 0;
				//alu_out = {i_imm_20_i, 12'b0} + i_pc;
			end
			`LOAD: begin
				//op_type = 1;
				//alu_out = i_rs_1 + tmp_1;
			end
			`STORE: begin
				//op_type = 1;
				//alu_out = i_rs_1 + tmp_4;
			end
			default: begin
				//op_type = 0;
				//alu_out = 0;
			end	
		endcase
	end
endmodule

