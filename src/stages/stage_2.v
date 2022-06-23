`ifndef STAGE_2           
`define STAGE_2
`include "constants.vh"
`include "controllers/branch_unit.v"
`include "memory/register_file.v"
`endif

module stage_2(input i_rst,
               input i_reg_op,
			   input[31:0] i_w_rd,
               input[4:0] i_w_rd_num,
			   input[31:0] i_inst,
			   input[31:0] i_pc,
			   output b_taken,
               output[31:0] b_pc,
               output[31:0] pc,
               output[31:0] rs_1,
               output[31:0] rs_2,
               output[4:0] rd_num,
			   output[6:0] opcode,
               output[6:0] func_7,
               output[2:0] func_3,
               output[11:0] imm_12_i,
               output[19:0] imm_20,
               output[11:0] imm_12_b,
               output[19:0] imm_20_i,
               output[11:0] imm_12_s);
               
	wire[4:0] reg_num_1 = i_inst[19:15];
	wire[4:0] reg_num_2 = i_inst[24:20];
	
	assign reg_num_1 = i_inst[19:15];
	assign reg_num_2 = i_inst[24:20];
	assign rd_num = i_inst[11:7];
	assign opcode = i_inst[6:0]; 
	assign func_7 = i_inst[31:25];
	assign func_3 = i_inst[14:12];
    assign imm_12_i = i_inst[31:20];
    assign imm_20 = {i_inst[31], i_inst[19:12], i_inst[20], i_inst[30:21]};
	assign imm_12_b = {i_inst[31], i_inst[7], i_inst[30:25], i_inst[11:8]};
	assign imm_20_i = {i_inst[31:12]};
	assign imm_12_s = {i_inst[31:25], i_inst[11:7]};
	assign pc = i_pc;
	
	branch_unit branch_unit_0(.i_pc(i_pc),
							  .i_opcode(opcode),
                              .i_func_3(func_3),
                              .i_func_7(func_7),
			                  .i_imm_12_i(imm_12_i),
                              .i_imm_20(imm_20),
                              .i_imm_12_b(imm_12_b),
                              .i_rs_1(rs_1),
                              .i_rs_2(rs_2),
			                  .b_taken(b_taken),
                              .b_pc(b_pc));

	register_file register_file_0(.i_rst(i_rst),
	                              .i_reg_num_1(reg_num_1),
                                  .i_reg_num_2(reg_num_2),
                                  .i_w_reg_num(i_w_rd_num),
                                  .i_w_val(i_w_rd),
                                  .i_op(i_reg_op),
								  .rs_1(rs_1),
					              .rs_2(rs_2));
			
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
