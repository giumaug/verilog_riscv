`ifndef VERILOG_RISCV        
`define VERILOG_RISCV
`include "pipe_regs/if_id.v"
`include "pipe_regs/id_ex.v"
`include "pipe_regs/ex_mem.v"
`include "pipe_regs/mem_wb.v"
`include "stages/stage_1.v"
`include "memory/memory_controller.v"
`endif

module verilog_riscv(input rst,
                     input clk,
			         output[3:1] leds);
	
	wire[31:0] if_id_pc_w;
	wire[31:0] if_id_instr_w;

	reg[31:0] tmp_b_pc <= 0;
	reg[31:0] tmp_b_taken <= 0;

	reg[31:0] tmp_if_id_pc <= 0;
	reg[31:0] tmp_if_id_instr <= 0;

	reg[31:0] tmp_address_0 <= 0;
	reg[31:0] tmp_i_val_0  <= 0;
    reg tmp_op_type_0 <= 0;
	reg[31:0] tmp_o_val_0 <= 0;

	wire[31:0] inst_addr_w;
	wire[31:0] if_id_inst_w;

	if_id if_id_0(.rst(rst),
                  .clk(clk),
                  .i_pc(if_id_pc_w),
                  .i_instr(if_id_inst_w),
                  .pc(tmp_if_id_pc),
                  .instr(tmp_if_id_instr));

	stage stage_1(.rst(rst),
                  .clk(clk),
                  .b_taken(tmp_b_taken),
                  .b_pc(tmp_b_pc),
				  .inst_addr(inst_addr_w),
                  .pc_out(if_id_pc_w));
                  
	memory_controller memory_controller_0(.rst(rst),
									      .address_0(tmp_address_0),
                                          .i_val_0(tmp_i_val_0),
                                          .op_type_0(tmp_op_type_0),
    							          .address_1(inst_addr_w),
                                          .i_val_1(32'b0),
                                          .op_type_1(1'b0),
                                          .o_val_0(tmp_o_val_0),
                                          .o_val_1(if_id_inst_w));

endmodule
