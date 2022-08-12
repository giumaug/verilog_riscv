`ifndef BRANCH_UNIT        
`define BRANCH_UNIT
`include "constants.vh"
`include "utils.vh"
`endif

module branch_unit(input[31:0] i_pc,
                   input[6:0] i_opcode,
                   input[2:0] i_func_3,
                   input[6:0] i_func_7,
			       input[11:0] i_imm_12_i,
                   input[19:0] i_imm_20,
				   input[11:0] i_imm_12_b,
                   input[31:0] i_rs_1,
                   input[31:0] i_rs_2,
			       output reg b_taken,
                   output reg[31:0] b_pc);
     
    wire[20:0] tmp_1 = {i_imm_20, 1'b0};
    wire[31:0] tmp_2 = `SIGN_EXTEND(tmp_1, 21, 32);
    wire[31:0] tmp_3 = `SIGN_EXTEND(i_imm_12_i, 12, 32);
    wire[31:0] tmp_4 = `ABS(tmp_2, 32);
    wire[12:0] tmp_5 = {i_imm_12_b, 1'b0};
    wire[31:0] tmp_6 = `SIGN_EXTEND(tmp_5, 13, 32);
	always @(*) begin
		case (i_opcode)
			`LUI: begin
				//no needed
			end
			`JAL: begin
				//Note: if imm is two complement negative number, the positive value is zeroExtend( ~ (imm - 1))
				//if (i_imm_20[19] == 0) b_pc = i_pc + {{11{i_imm_20[19]}}, {i_imm_20, 1'b0}};
				//else b_pc =  i_pc - ( ~ ({{11{i_imm_20[19]}}, {i_imm_20, 1'b0}} - 1));
				if (i_imm_20[19] == 0) b_pc = i_pc + `ABS(tmp_2, 32);
				else b_pc =  i_pc - `ABS(tmp_2, 32);
				b_taken = 1;
				$display("instruction JAL");
			   end
			`JALR: begin
				//if (i_imm_12_i[11] == 0) b_pc = (i_rs_1 + {{20{i_imm_12_i[11]}}, i_imm_12_i}) & 4094;
				//else b_pc = (i_rs_1 - ( ~ ({{20{i_imm_12_i[11]}}, i_imm_12_i} - 1))) & 4094;
				if (i_imm_12_i[11] == 0) b_pc = (i_rs_1 + tmp_3) & 4094;
				else b_pc = (i_rs_1 - tmp_4) & 4094;
				b_taken = 1;
				$display("instruction JALR---");
				$display("b_pc = %0h", b_pc);
				$display("b_taken = %0h", b_taken);
				$display("i_imm_12_i = %0h", i_imm_12_i);
				$display("i_rs_1 = %0h", i_rs_1);
			end
			`BRANCH: begin
				//if (i_imm_12_b[11] == 0) b_pc = i_pc + {{19{i_imm_12_b[11]}}, {i_imm_12_b, 1'b0}};
				//else b_pc =  i_pc - ( ~ ({{19{i_imm_12_b[11]}}, {i_imm_12_b, 1'b0}} - 1));
				if (i_imm_12_b[11] == 0) b_pc = i_pc + `ABS(tmp_6, 32);
				else b_pc = i_pc - `ABS(tmp_6, 32);
				case (i_func_3)
					`BEQ: begin
				   		if (i_rs_1 == i_rs_2) b_taken = 1;
				       	else b_taken = 0;
				       	$display("instruction BEQ");
				   	end
                  	`BNE: begin
                   		if (i_rs_1 != i_rs_2) b_taken = 1;
                      	else b_taken = 0;
                  		$display("instruction BNE");
                	end
                  	`BLT: begin
						if (`SIGNED(i_rs_1) < `SIGNED(i_rs_2)) b_taken = 1;
						else b_taken = 0;
						$display("instruction BLT---");
						$display("i_rs_1 = %0h", i_rs_1);
						$display("i_rs_2 = %0h", i_rs_2);
					end
					`BLTU: begin
						if (`ABS(i_rs_1, 32) < `ABS(i_rs_2, 32)) b_taken = 1;
					   	else b_taken = 0;
						$display("instruction BLTU");	
					end
					`BGE: begin
						if (`SIGNED(i_rs_1) > `SIGNED(i_rs_2)) b_taken = 1;
						else b_taken = 0;
						$display("instruction BGE");
					end
					`BGEU: begin
						if (`ABS(i_rs_1, 32) > `ABS(i_rs_2, 32)) b_taken = 1;
						else b_taken = 0;
						$display("instruction BGE");
					end
				endcase
			end
			default: begin
				b_taken = 0;
				b_pc = 0;
			end 
		endcase
	end
endmodule
