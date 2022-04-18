`ifndef STAGE_1             
`define STAGE_1
`include "constants.vh"
`include "branch_unit.v"
`endif

module stage_2(input rst,
               input clk,
			   input[31:0] w_val,
               input[31:0] if_id_pc,
               input[31:0] if_id_inst,
			   output b_taken,
               output[31:0] b_pc,
               output[31:0] if_id_inst,
               output[31:0] reg_1,
               output[31:0] reg_2);

	wire[4:0] reg_num_1 = if_id_inst[19:15];
	wire[4:0] reg_num_2 = if_id_inst[24:20];
	wire[4:0] w_reg_num = if_id_inst[24:20];
	wire[6:0] opcode = if_id_inst[6:0]; 
	wire[6:0] func_7 = if_id_inst[31:25];
	wire[2:0] func_3 = if_id_inst[14:12];
    wire[11:0] imm_12_i = if_id_inst[31,20];
    wire[19:0] imm_20 = {if_id_inst[31], if_id_inst[19:12], if_id_inst[20], if_id_inst[30:21]};

	branch_unit branch_unit_0(.opcode(opcode),
                              .func_3(func_3),
                              .func_7(func_7),
			                  .imm_12_i(imm_12_i),
                              .imm_20(imm_20),
                              .reg_1(reg_1),
                              .reg_2(reg_2),
			                  .b_taken(b_taken),
                              .b_pc(b_pc));

	register_file register_file_0(.reg_num_1(reg_num_1),
                                  .reg_num_2(reg_num_2),
                                  .reg_num(w_reg_num),
                                  .val(val),
                                  .op(reg_file_op),
								  .reg_1(reg_1),
					              .reg_2(reg_2));

	//Only for debug
	always@(posedge clk) begin
		$display("---begin fetch---");
		????????????????? 
		$display("---end fetch---");
	end
endmodule
