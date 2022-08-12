`ifndef STAGE_2           
`define STAGE_2
`include "constants.vh"
`include "controllers/branch_unit.v"
`include "controllers/data_hazard_unit.v"
`include "memory/register_file.v"
`endif

module stage_2(input i_rst,
               input i_reg_op,
			   input[31:0] i_w_rd,
               input[4:0] i_w_rd_num,
			   input[31:0] i_inst,
			   input[31:0] i_pc,
			   input[4:0] i_id_ex_rd_num,
	           input[4:0] i_ex_mem_rd_num,
	           output reg stall,
			   output reg b_taken,
               output reg[31:0] b_pc,
               output reg[31:0] pc,
               output reg[31:0] rs_1,
               output reg[31:0] rs_2,
               output reg[4:0] rd_num,
			   output reg[6:0] opcode,
               output reg[6:0] func_7,
               output reg[2:0] func_3,
               output reg[11:0] imm_12_i,
               output reg[19:0] imm_20,
               output reg[11:0] imm_12_b,
               output reg[19:0] imm_20_i,
               output reg[11:0] imm_12_s);
               
	wire[4:0] i_reg_num_1 = i_inst[19:15];
	wire[4:0] i_reg_num_2 = i_inst[24:20];
	wire[6:0] i_opcode = i_inst[6:0];
	wire[4:0] _rd_num = i_inst[11:7];
	wire[31:0] _rs_1;
	wire[31:0] _rs_2;
	wire[31:0] _b_pc;
	wire _b_taken;
	wire _stall;
	
	always @(*) begin
		$strobe("---inside decode---");
		$strobe("i_reg_num_1 = %0h", i_reg_num_1);
		$strobe("i_reg_num_2 = %0h", i_reg_num_2);
        $strobe("i_reg_op = %0h", i_reg_op);
		$strobe("i_w_rd = %0h", i_w_rd);
        $strobe("i_w_rd_num= %0h", i_w_rd_num);
        $strobe("i_inst = %0h", i_inst);
        $strobe("i_pc = %0h", i_pc);
        $strobe("b_taken = %0h", b_taken);
        $strobe("b_pc = %0h", b_pc);
        $strobe("rs_1 = %0h", rs_1);
        $strobe("rs_2 = %0h", rs_2);
		$strobe("rd_num = %0h", rd_num);
		$strobe("opcode = %0h", opcode);
        $strobe("func_7 = %0h", func_7);
        $strobe("func_3 = %0h", func_3);
        $strobe("imm_12_i = %0h", imm_12_i);
        $strobe("imm_20 = %0h", imm_20);
        $strobe("imm_12_b = %0h", imm_12_b);
        $strobe("imm_20_i = %0h", imm_20_i);
		$strobe("imm_12_s = %0h", imm_12_s);
		$strobe("time is %0t",$time);
		$strobe("---end decode---");  
		if (_stall == 0) begin
		    //$strobe("non stalling");
			rd_num = _rd_num;
			opcode = i_inst[6:0]; 
			func_7 = i_inst[31:25];
			func_3 = i_inst[14:12];
			imm_12_i = i_inst[31:20];
			imm_20 = {i_inst[31], i_inst[19:12], i_inst[20], i_inst[30:21]};
			imm_12_b = {i_inst[31], i_inst[7], i_inst[30:25], i_inst[11:8]};
			imm_20_i = {i_inst[31:12]};
			imm_12_s = {i_inst[31:25], i_inst[11:7]};
			pc = i_pc;
			rs_1 = _rs_1;
	        rs_2 = _rs_2;
	        b_pc = _b_pc;
	        b_taken = _b_taken;
		end
		else begin
			//$strobe("stalling");
			rd_num = 0;
			opcode = 0; 
			func_7 = 0;
			func_3 = 0;
			imm_12_i = 0;
			imm_20 = 0;
			imm_12_b = 0;
			imm_20_i = 0;
			imm_12_s = 0;
			pc = 0;
			rs_1 = 0;
	        rs_2 = 0;
	        b_pc = 0;
	        b_taken = 0;
		end
		stall = _stall;
	end
	
	branch_unit branch_unit_0(.i_pc(i_pc),
							  .i_opcode(opcode),
                              .i_func_3(func_3),
                              .i_func_7(func_7),
			                  .i_imm_12_i(imm_12_i),
                              .i_imm_20(imm_20),
                              .i_imm_12_b(imm_12_b),
                              .i_rs_1(rs_1),
                              .i_rs_2(rs_2),
			                  .b_taken(_b_taken),
                              .b_pc(_b_pc));

	register_file register_file_0(.i_rst(i_rst),
	                              .i_reg_num_1(i_reg_num_1),
                                  .i_reg_num_2(i_reg_num_2),
                                  .i_w_reg_num(i_w_rd_num),
                                  .i_w_val(i_w_rd),
                                  .i_op(i_reg_op),
								  .rs_1(_rs_1),
					              .rs_2(_rs_2));
					              
	data_hazard_unit data_hazard_unit_0(.i_opcode(i_opcode),
	                                    .i_reg_num_1(i_reg_num_1),
	                                    .i_reg_num_2(i_reg_num_2),
	                                    .i_id_ex_rd_num(i_id_ex_rd_num),
	                                    .i_ex_mem_rd_num(i_ex_mem_rd_num),
	                                    .stall(_stall));
			
/*		           
    always@(opcode, rs_1, rs_2, i_reg_op) begin
        $strobe("---begin decode---");
        $strobe("i_reg_op = %0h", i_reg_op);
		$strobe("i_w_rd = %0h", i_w_rd);
        $strobe("i_w_rd_num= %0h", i_w_rd_num);
        $strobe("i_inst = %0h", i_inst);
        $strobe("i_pc = %0h", i_pc);
        $strobe("b_taken = %0h", b_taken);
        $strobe("b_pc = %0h", b_pc);
        $strobe("rs_1 = %0h", rs_1);
        $strobe("rs_2 = %0h", rs_2);
		$strobe("rd_num = %0h", rd_num);
		$strobe("opcode = %0h", opcode);
        $strobe("func_7 = %0h", func_7);
        $strobe("func_3 = %0h", func_3);
        $strobe("imm_12_i = %0h", imm_12_i);
        $strobe("imm_20 = %0h", imm_20);
        $strobe("imm_12_b = %0h", imm_12_b);
        $strobe("imm_20_i = %0h", imm_20_i);
		$strobe("imm_12_s = %0h", imm_12_s);
		$strobe("time is %0t",$time);
		$strobe("---end decode---");  
    end
*/
					              
endmodule
