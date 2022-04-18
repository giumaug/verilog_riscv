module branch_unit(input[6:0] opcode,
                   input[2:0] func_3,
                   input[6:0] func_7,
			       input[11:0] imm_12_i
                   input[19:0] imm_20,
                   input[31:0] reg_1,
                   input[31:0] reg_2,
			       output b_taken,
                   output[31:0] b_pc);

	always@(posedge clk) begin
		case (opcode)
			`JAL: begin
				//Note: if imm is two complement negative number, the positive value is zeroExtend( ~ (imm - 1))
				if (imm_20[0] == 0) b_pc <= if_id_pc + {imm20, 1'b0};
				else b_pc <=  if_id_pc - ( ~ ({imm20, 1'b0} - 1));
				b_taken <= 1;
				$display("instruction JAL");
			   end
			`JALR: begin
				if (imm_12_i[11] == 0) b_pc <= (reg_1 + imm_12_i(word)) & 4094;
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
		endcase
	end

	function abs(input[31:0] a)
    begin
		abs = (a[31] == 0) ? a : abs = ( ~ (a - 1));
    end
endmodule
