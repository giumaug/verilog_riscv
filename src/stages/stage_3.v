`ifndef STAGE_3      
`define STAGE_3
`include "constants.vh"
`include "utils.vh"
`endif

module stage_3(input[31:0] i_counter,
			   input[31:0] i_pc,
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
	    $strobe("---begin execute---");
	    $strobe("i_counter = %0h", i_counter);
		case (opcode)
			`OPIMM: begin
				op_type = 0;
				case (i_func_3)
					`ADDI: begin
						$strobe("instruction ADDI");
						//alu_out = i_rs_1 + {{20{i_imm_12_i[11]}}, i_imm_12_i};
						alu_out = i_rs_1 + tmp_1;
					end
					`SLTI: begin
						$strobe("instruction SLTI");
						if (`SIGNED(i_rs_1) < `SIGNED(tmp_1)) alu_out = 1;
						else alu_out = 0;
					end
					`SLTIU: begin
						$strobe("instruction SLTIU");
						if (`ABS(i_rs_1, 32) < `ABS(tmp_1, 32)) alu_out = 1;
						else alu_out = 0; 
					end
					`ANDI: begin
						$strobe("instruction ANDI");
						alu_out = i_rs_1 & tmp_1;
					end
					`ORI: begin
						$strobe("instruction ORI");
						alu_out = i_rs_1 | tmp_1;
					end
					`XORI: begin
						$strobe("instruction XORI");
						alu_out = i_rs_1 ^ tmp_1;
					end
					`SLLI: begin
						$strobe("instruction SLLI");
						alu_out = i_rs_1 << tmp_2;
					end
					`SRLISRAI: begin
						$strobe("instruction SRLISRAI");
						if (i_func_7 == `SRLI)	alu_out = i_rs_1 >> tmp_2;
						else if (i_func_7 == `SRAI) alu_out = (i_rs_1 >> tmp_2) | {i_rs_1[31:31], 31'b0};
					end
				endcase
			end
			`OP: begin
				op_type = 0;
				case (i_func_3)
					`ADDSUB: begin
						$strobe("instruction ADDSUB");
						if (i_func_7 == `ADD) alu_out = i_rs_1 + i_rs_2;
						else if (i_func_7 == `SUB) alu_out = i_rs_1 - i_rs_2;
					end
					`SLT: begin
						$strobe("instruction SLT");
						if (`SIGNED(i_rs_1) < `SIGNED(i_rs_2)) alu_out = 1;
						else alu_out = 0;
					end
					`SLTU: begin
						$strobe("instruction SLTU");
						if (`ABS(i_rs_1, 32) < `ABS(i_rs_2, 32)) alu_out = 1;
						else alu_out = 0;
					end
					`AND: begin
						$strobe("instruction AND");
						alu_out = i_rs_1 & i_rs_2;
					end
					`OR: begin
						$strobe("instruction OR");
						alu_out = i_rs_1 | i_rs_2;
					end
					`XOR: begin
						$strobe("instruction XOR");
						alu_out = i_rs_1 ^ i_rs_2;
					end
					`SLL: begin
						$strobe("instruction SLL");
						alu_out = i_rs_1 << tmp_3;
					end
					`SRLSRA: begin
						$strobe("instruction SRLSRA");
						if (i_func_7 == `SRL) alu_out = i_rs_1 >> tmp_3;
						else if (i_func_7 == `SRA) alu_out = (i_rs_1 >> tmp_3) | {i_rs_1[31:31], 31'b0};
					end
				endcase
			end
			`JAL: begin
				$strobe("instruction JAL");
				op_type = 0;
				alu_out = i_pc + 4;
			end
			`JALR: begin
				$strobe("instruction JALR");
				op_type = 0;
				alu_out = i_pc + 4;
			end
			`LUI: begin
				$strobe("instruction LUI");
				op_type = 0;
				alu_out = {i_imm_20_i, 12'b0};
			end
			`AUIPC: begin
				$strobe("instruction AUIPC");
				op_type = 0;
				alu_out = {i_imm_20_i, 12'b0} + i_pc;
			end
			`LOAD: begin
				$strobe("instruction LOAD");
				op_type = 1;
				alu_out = i_rs_1 + tmp_1;
			end
			`STORE: begin
				$strobe("instruction STORE");
				op_type = 1;
				alu_out = i_rs_1 + tmp_4;
			end		
		endcase
		
		$strobe("i_pc = %0h", i_pc);
		$strobe("i_rs_1 = %0h",i_rs_1);
		$strobe("i_rs_2 = %0h",i_rs_2);
		$strobe("i_rd_num = %0h",i_rd_num);
		$strobe("i_imm_12_i = %0h",i_imm_12_i);
        $strobe("i_imm_20 = %0h",i_imm_20);
        $strobe("i_imm_12_b = %0h",i_imm_12_b);
        $strobe("i_imm_20_i = %0h",i_imm_20_i);
		$strobe("i_imm_12_s = %0h",i_imm_12_s);
		$strobe("i_opcode = %0h",i_opcode);
		$strobe("i_func_3 = %0h",i_func_3);
		$strobe("i_func_7 = %0h",i_func_7);
        $strobe("rs_2 = %0h",rs_2);
        $strobe("rd_num = %0h",rd_num);
        $strobe("alu_out = %0h",alu_out);
        $strobe("opcode = %0h",opcode);
        $strobe("func_3 = %0h",func_3);
        $strobe("op_type = %0h",op_type);
        $strobe("time is %0t",$time);
		$strobe("---end execute---");  
	end
endmodule

