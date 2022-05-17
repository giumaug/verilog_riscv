module branch_unit(input[31:0] pc,
                   input[6:0] opcode,
                   input[2:0] func_3,
                   input[6:0] func_7,
			       input[11:0] imm_12_i,
                   input[19:0] imm_20,
				   input[11:0] imm_12_b,
                   input[31:0] rs_1,
                   input[31:0] rs_2,
			       output reg b_taken,
                   output reg[31:0] b_pc);
                   
	always @(*) begin
		case (opcode)
			`LUI: begin
				//no needed
			end
			`JAL: begin
				//Note: if imm is two complement negative number, the positive value is zeroExtend( ~ (imm - 1))
				if (imm_20[19] == 0) b_pc = pc + {{11{imm_20[19]}}, {imm_20, 1'b0}};
				else b_pc =  pc - ( ~ ({{11{imm_20[19]}}, {imm_20, 1'b0}} - 1));
				b_taken = 1;
				$display("instruction JAL");
			   end
			`JALR: begin
				if (imm_12_i[11] == 0) b_pc = (rs_1 + {{20{imm_12_i[11]}}, imm_12_i}) & 4094;
				else b_pc = (rs_1 - ( ~ ({{20{imm_12_i[11]}}, imm_12_i} - 1))) & 4094;
				b_taken = 1;
				$display("instruction JALR");
			end
			`BRANCH: begin
				if (imm_12_b[11] == 0) b_pc = pc + {{19{imm_12_b[11]}}, {imm_12_b, 1'b0}};
				else b_pc =  pc - ( ~ ({{19{imm_12_b[11]}}, {imm_12_b, 1'b0}} - 1));				
				case (func_3)
					`BEQ: begin
				   		if (rs_1 == rs_2) b_taken = 1;
				       	else b_taken = 0;
				       	$display("instruction BEQ");
				   	end
                  	`BNE: begin
                   		if (rs_1 != rs_2) b_taken = 1;
                      	else b_taken = 0;
                  		$display("instruction BNE");
                	end
                  	`BLT: begin
						if (rs_1 < rs_2) b_taken = 1;
						else b_taken = 0;
						$display("instruction BLT");	
					end
					`BLTU: begin
						if (abs(rs_1) < abs(rs_2)) b_taken = 1;
					   	else b_taken = 0;
						$display("instruction BLTU");	
					end
					`BGE: begin
						if (rs_1 > rs_2) b_taken = 1;
						else b_taken = 0;
						$display("instruction BGE");
					end
					`BGEU: begin
						if (abs(rs_1) > abs(rs_2)) b_taken = 1;
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

	function [31:0] abs(input[31:0] a);
    	begin
			abs = (a[31] == 0) ? a : ( ~ (a - 1));
    	end
	endfunction
endmodule

`define ABS(VAL, LEN) (VAL[LEN - 1] == 0) ? VAL : ( ~ (VAL - 1))
`define SIGN_EXTEND(VAL, CUR_LEN, NEW_LEN) {{(NEW_LEN - CUR_LEN){VAL[CUR_LEN - 1]}}, VAL}
`define ZERO_EXTEND(VAL, CUR_LEN, NEW_LEN) {(NEW_LEN - CUR_LEN)'b0, VAL}

{{16{in[15]}},in}

