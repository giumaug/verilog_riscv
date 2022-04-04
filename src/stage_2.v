`ifndef STAGE_1             
`define STAGE_1
`include "constants.vh"
`endif

module stage_2(input rst,
               input clk,
			   input stall,
			   input[31:0] w_val,
               input[31:0] if_id_pc,
               input[31:0] if_id_instr
			   reg b_pc);

	wire[4:0] reg_num_1 = if_id_instr[19:15];
	wire[4:0] reg_num_2 = if_id_instr[24:20];
	wire[4:0] w_reg_num = if_id_instr[24:20];
	wire[6:0] opcode = if_id_instr[6:0]; 
	wire[6:0] func_7 = if_id_instr[31:25];
	wire[2:0] func_3 = if_id_instr[14:12];
	reg reg_file_op <= 0;
    reg[31:0] reg_1;
	reg[31:0] reg_2;

	register_file register_file_0(.reg_num_1(reg_num_1),
                                  .reg_num_2(reg_num_2),
                                  .reg_num(w_reg_num),
                                  .val(val),
                                  .op(reg_file_op),
								  .reg_1(reg_1),
					              .reg_2(reg_2));

    data_cache_0(.rst(rst),

	always@(rst) begin
		pc <= `BOOT_ADDRESS;
	end

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

		
`BRANCH: begin
						imm12 = rImm12B(word);
			     		_bPc = ifId.rPc() + signExtend(imm12 << 1);
			     		_rdNum = 0;
						case (func3) 
							`BEQ: begin
								if (rs1 == rs2) _bTaken = True;
								else _bTaken = False;
								`DISPLAY("instruction JALR")
							end	
							`BNE: begin
								if (rs1 != rs2) _bTaken = True;
								else _bTaken = False;
								`DISPLAY("instruction BNE")
							end
							`BLT: begin
								if (rs1 < rs2) _bTaken = True;
								else _bTaken = False;
								`DISPLAY("instruction BLT")
							end
							`BLTU: begin
								if (abs(rs1) < abs(rs2)) _bTaken = True;
								else _bTaken = False;
								`DISPLAY("instruction BLTU")
							end
							`BGE: begin
								if (rs1 > rs2) _bTaken = True;
								else _bTaken = False;
							end
							`BGEU: begin
								if (abs(rs1) > abs(rs2)) _bTaken = True;
								else _bTaken = False;
								`DISPLAY("instruction BGEU")
							end
							//default: bTaken <= False;
						endcase
					end

			endcase
			
		end

	end

	always@(negedge clk) begin
		reg_file_op <= 0;

	end
endmodule

id_ex_imm_20
b_pc
b_taken



Bit#(32) pc = ifId.rPc();
			Bit#(32) word = ifId.rInstr();


input rst,
					 input[4:0] i_r_reg_num_1,
                     input[4:0] i_r_reg_num_2,
                     input[4:0] i_w_reg_num,
                     input[31:0] i_w_val,
		             input op,
                     output reg[31:0] r_reg_1,
                     output reg[31:0] r_reg_2);




input [31:0] i_pc,
			 input [31:0] i_rs_1,
			 input [31:0] i_rs_2,
			 input [4:0]  i_rd_num,
			 input [11:0] i_imm_12,
			 input [19:0] i_imm_20,
			 input [6:0] i_opcode,
			 input [2:0] i_func_3,
			 input [6:0] i_func_7,	
