module branch_unit(input rst,
               input clk,
			   input b_taken,
               input[31:0] b_pc,
			   output[31:0] inst_addr,
			   output reg[31:0] pc_out);

	always@(posedge clk) begin
		reg_file_op <= 1;

		if (stall == 0) begin
			case (opcode)
				`LUI: begin
					id_ex_imm_20 <= imm_20_i(word);
				end
				`JAL: begin
					//Note: if imm is two complement negative number, the positive value is zeroExtend( ~ (imm - 1))
					if (imm_20[0] == 0) b_pc <= if_id_pc + {imm20, 1'b0};
					else b_pc <=  if_id_pc - ( ~ ({imm20, 1'b0} - 1));
					b_taken <= 1;
					$display("instruction JAL");
			    end
				`JALR: begin
					if (imm_12[11] == 0) b_pc <= (reg_1 + imm_12_i(word)) & 4094;
					else b_pc <= (reg_1 - ( ~ (imm_12_i(word) - 1))) & 4094;
					b_taken <= 1;
					$display("instruction JALR");
				end
				`BRANCH: begin
				    case (func_3)
				        `BEQ: begin
				            if (reg_1 == reg_2) b_taken <= 1;
				            else b_taken <= 0;
				            $display("instruction BEQ")
				        end
                        `BNE: begin
                             if (reg_1 != reg_2) b_taken <= 1;
                             else b_taken <= 0;
                             $display("instruction BNE");
                        end
                        `BLT: begin
						    if (reg_1 < reg_2) b_taken <= 1;
							else b_taken <= 0;
							$display("instruction BLT");	
						end
						`BLTU: begin
						    if (abs(reg_1) < abs(reg_2)) b_taken <= 1;
					        else _bTaken <= 0;
							$display("instruction BLTU");	
						end
						`BGE: begin
							if (reg_1 > reg_2) b_taken <= 1;
							else b_taken <= 0;
							$display("instruction BGE");
						end
						`BGEU: begin
							if (abs(reg_1) > abs(reg_2)) b_taken <= 1;
							else b_taken <= 0;
							$display("instruction BGE");
						end
					endcase
				end

endmodule
