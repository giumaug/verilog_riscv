`ifndef STAGE_2           
`define STAGE_2
`include "constants.vh"
`include "controllers/branch_unit.v"
`include "memory/register_file.v"
`endif

module stage_2(input[31:0] w_val,
               input[4:0] w_reg_num,
			   input[31:0] if_id_inst,
			   input[31:0] pc,
			   output b_taken,
               output[31:0] b_pc,
               output[31:0] rs_1,
               output[31:0] rs_2,
               output[4:0] rd_num,
			   output[6:0] opcode,
               output[6:0] func_7,
               output[2:0] func_3,
               output[11:0] imm_12_i,
               output[19:0] imm_20,
               output[11:0] imm_12_b,
               output[11:0] imm_20_i,
               output[11:0] imm_12_s);
               
	wire[4:0] reg_num_1 = if_id_inst[19:15];
	wire[4:0] reg_num_2 = if_id_inst[24:20];
	
	assign reg_num_1 = if_id_inst[19:15];
	assign reg_num_2 = if_id_inst[24:20];
	assign rd_num = if_id_inst[11:7];
	assign opcode = if_id_inst[6:0]; 
	assign func_7 = if_id_inst[31:25];
	assign func_3 = if_id_inst[14:12];
    assign imm_12_i = if_id_inst[31:20];
    assign imm_20 = {if_id_inst[31], if_id_inst[19:12], if_id_inst[20], if_id_inst[30:21]};
	assign imm_12_b = {if_id_inst[31], if_id_inst[7], if_id_inst[30:25], if_id_inst[11:8]};
	assign imm_20_i = {if_id_inst[31:12]};
	assign imm_12_s = {if_id_inst[31:25], if_id_inst[11:7]};
	
	branch_unit branch_unit_0(.pc(pc),
							  .opcode(opcode),
                              .func_3(func_3),
                              .func_7(func_7),
			                  .imm_12_i(imm_12_i),
                              .imm_20(imm_20),
                              .imm_12_b(imm_12_b),
                              .rs_1(rs_1),
                              .rs_2(rs_2),
			                  .b_taken(b_taken),
                              .b_pc(b_pc));

	register_file register_file_0(.reg_num_1(reg_num_1),
                                  .reg_num_2(reg_num_2),
                                  .reg_num(w_reg_num),
                                  .val(w_val),
                                  .op(reg_file_op),
								  .rs_1(rs_1),
					              .rs_2(rs_2));
endmodule
