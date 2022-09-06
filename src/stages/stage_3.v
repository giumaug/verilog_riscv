`ifndef STAGE_3      
`define STAGE_3
`include "constants.vh"
`include "utils.vh"
`include "components/alu.v"
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
               output[31:0] rs_2,
               output[4:0] rd_num,
               output reg[31:0] alu_out,
               output[6:0] opcode,
               output[2:0] func_3,
               output reg op_type);
               
    assign rs_2 = i_rs_2;
    assign rd_num = i_rd_num;
    assign opcode = i_opcode;
    assign func_3 = i_func_3;
    
    wire[31:0] alu_op_1;
    wire[31:0] alu_op_2;
    wire[3:0] alu_op;
               
	always @(*) begin
		case (opcode)
			`OPIMM: begin
				op_type = 0;
				case (i_func_3)
					`ADDI: begin
					    //alu_out = i_rs_1 + tmp_1;
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_SRL;
					end
					`SLTI: begin
						//if (`SIGNED(i_rs_1) < `SIGNED(tmp_1)) alu_out = 1;
						//else alu_out = 0;
						alu_op_1 = `SIGNED(i_rs_1);
						alu_op_2 = `SIGNED(tmp_1);
						alu_op = `ALU_SLT;
					end
					`SLTIU: begin
						//if (`ABS(i_rs_1, 32) < `ABS(tmp_1, 32)) alu_out = 1;
						//else alu_out = 0;
						alu_op_1 = `ABS(i_rs_1, 32);
						alu_op_2 = `ABS(tmp_1, 32);
						alu_op = `ALU_SLT;
					end
					`ANDI: begin
						//alu_out = i_rs_1 & tmp_1;
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_AND;
					end
					`ORI: begin
						//alu_out = i_rs_1 | tmp_1;
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
					end
					`XORI: begin
						//alu_out = i_rs_1 ^ tmp_1;
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_OR;
					end
					`SLLI: begin
						//alu_out = i_rs_1 << tmp_2;
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_1;
						alu_op = `ALU_SLL;
					end
					`SRLISRAI: begin
						//if (i_func_7 == `SRLI)	alu_out = i_rs_1 >> tmp_2;
						//else if (i_func_7 == `SRAI) alu_out = (i_rs_1 >> tmp_2) | {i_rs_1[31:31], 31'b0};
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
						//if (i_func_7 == `ADD) alu_out = i_rs_1 + i_rs_2;
						//else if (i_func_7 == `SUB) alu_out = i_rs_1 - i_rs_2;
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						if (i_func_7 == `ADD) alu_op = `ALU_ADD;
						else begin if (i_func_7 == `SUB) alu_op = `ALU_SUB;
						    
					end
					`SLT: begin
						//if (`SIGNED(i_rs_1) < `SIGNED(i_rs_2)) alu_out = 1;
						//else alu_out = 0;
						alu_op_1 = `SIGNED(i_rs_1);
						alu_op_2 = `SIGNED(i_rs_2);
						alu_op = `ALU_SLT;
					end
					`SLTU: begin
						//if (`ABS(i_rs_1, 32) < `ABS(i_rs_2, 32)) alu_out = 1;
						//else alu_out = 0;
						alu_op_1 = `ABS(i_rs_1, 32);
						alu_op_2 = `ABS(i_rs_2, 32);
						alu_op = `ALU_SLT;
					end
					`AND: begin
						//alu_out = i_rs_1 & i_rs_2;
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_AND;
					end
					`OR: begin
						//alu_out = i_rs_1 | i_rs_2;
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_OR;
					end
					`XOR: begin
						//alu_out = i_rs_1 ^ i_rs_2;
						alu_op_1 = i_rs_1;
						alu_op_2 = i_rs_2;
						alu_op = `ALU_XOR;
					end
					`SLL: begin
						//alu_out = i_rs_1 << tmp_3;
					end
					`SRLSRA: begin
						//if (i_func_7 == `SRL) alu_out = i_rs_1 >> tmp_3;
						//else if (i_func_7 == `SRA) alu_out = (i_rs_1 >> tmp_3) | {i_rs_1[31:31], 31'b0};
						alu_op_1 = i_rs_1;
						alu_op_2 = tmp_3;
						if (i_func_7 == `SRL) alu_op = `ALU_SRL;
						else if (i_func_7 == `SRA) alu_op = `ALU_SRA;
					end
				endcase
			end
			`JAL: begin
				//op_type = 0;
				//alu_out = i_pc + 4;
				op_type = 0;
				alu_op_1 = i_pc;
			    alu_op_2 = 4;
			    alu_op = `ALU_ADD;
			end
			`JALR: begin
				//op_type = 0;
				//alu_out = i_pc + 4;
				op_type = 0;
				alu_op_1 = i_pc;
			    alu_op_2 = 32'd4;
			    alu_op = `ALU_ADD;
			end
			`LUI: begin
				//op_type = 0;
				//alu_out = {i_imm_20_i, 12'b0};
				op_type = 0;
				alu_op_1 = {i_imm_20_i, 12'b0};
			    alu_op_2 = 32'd0;
			    alu_op = `ALU_ADD;
				
			end
			`AUIPC: begin
				//op_type = 0;
				//alu_out = {i_imm_20_i, 12'b0} + i_pc;
				op_type = 0;
				alu_op_1 = {i_imm_20_i, 12'b0};
			    alu_op_2 = i_pc;
			    alu_op = `ALU_ADD;
			end
			`LOAD: begin
				//op_type = 1;
				//alu_out = i_rs_1 + tmp_1;
				op_type = 1;
				alu_op_1 = i_rs_1;
			    alu_op_2 = tmp_1;
			    alu_op = `ALU_ADD;
			end
			`STORE: begin
				//op_type = 1;
				//alu_out = i_rs_1 + tmp_4;
				op_type = 1;
				alu_op_1 = i_rs_1;
			    alu_op_2 = tmp_1;
			    alu_op = `ALU_ADD;
			end
			default: begin
				//op_type = 0;
				//alu_out = 0;
				op_type = 0;
				alu_op_1 = 32'd0;
			    alu_op_2 = 32'd0;
			    alu_op = `ALU_ADD;
			end	
		endcase
	end
	
	alu alu_0(.i_op_1(alu_op_1),
	          .i_op_2(alu_op_2),
	          .i_op_type(alu_op),
	          .out(alu_out));
endmodule

