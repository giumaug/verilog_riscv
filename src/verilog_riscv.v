`ifndef VERILOG_RISCV        
`define VERILOG_RISCV
`include "pipe_regs.v"
`include "stage_1.v"
`include "memory_controller.v"
`endif


module verilog_riscv(input rst,
                     input clk,
			         output[3:1] leds);
	
	wire[31:0] if_id_pc_wire;
	wire[31:0] if_id_instr_wire;

	wire[31:0] tmp_b_pc;

	wire[31:0] tmp_if_id_pc;
	wire[31:0] tmp_if_id_instr;

	reg[31:0] tmp_address_0;
	reg[31:0] tmp_i_val_0;
    reg tmp_op_type_0;
	wire[31:0] tmp_o_val_0;

	wire[31:0] mem_con_address_1;
	wire[31:0] mem_con_o_val_1;

	if_id if_id_0(.rst(rst),
                  .clk(clk),
                  .i_pc(if_id_pc_wire),
                  .i_instr(if_id_instr_wire),
                  .pc(tmp_if_id_pc),
                  .instr(tmp_if_id_instr));

	stage_1 stage_1_0(.rst(rst),
                      .clk(clk),
                      .stall(1'b0),
                      .b_taken(1'b0),
                      .instr(mem_con_o_val_1),
                      .b_pc(tmp_b_pc),
                      .pc(mem_con_address_1),
                      .if_id_pc(if_id_pc_wire),
                      .if_id_instr(if_id_instr_wire));

	memory_controller memory_controller_0(.rst(rst),
									      .address_0(tmp_address_0),
                                          .i_val_0(tmp_i_val_0),
                                          .op_type_0(tmp_op_type_0),
    							          .address_1(mem_con_address_1),
                                          .i_val_1(32'b0),
                                          .op_type_1(1'b0),
                                          .o_val_0(tmp_o_val_0),
                                          .o_val_1(mem_con_o_val_1));

endmodule
