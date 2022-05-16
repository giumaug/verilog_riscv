`ifndef VERILOG_RISCV        
`define VERILOG_RISCV
`include "pipe_regs/if_id.v"
`include "pipe_regs/id_ex.v"
`include "pipe_regs/ex_mem.v"
`include "pipe_regs/mem_wb.v"
`include "stages/stage_1.v"
`include "stages/stage_2.v"
`include "controllers/memory_controller.v"
`endif

module verilog_riscv(input rst,
                     input clk,
			         output[3:0] leds);
	
	wire[31:0] i_if_id_pc;
	wire[31:0] i_if_id_inst;
	wire[31:0] if_id_pc;
	wire[31:0] if_id_inst;
	wire[31:0] pc_0_out;
	wire[31:0] b_pc;
	wire b_taken;
	wire[4:0] i_id_ex_rd_num;
	wire[31:0] i_id_ex_rs_1;
	wire[31:0] i_id_ex_rs_2;
	wire[6:0] i_id_ex_opcode;
    wire[6:0] i_id_ex_func_7;
    wire[2:0] i_id_ex_func_3;
    wire[11:0] i_id_ex_imm_12_i;
    wire[19:0] i_id_ex_imm_20;
    wire[11:0] i_id_ex_imm_12_b;
    wire[19:0] i_id_ex_imm_20_i;
	wire[11:0] i_id_ex_imm_12_s;

	reg[31:0] tmp_address_0;
	reg[31:0] tmp_i_val_0;
    reg tmp_op_type_0;
	wire[31:0] tmp_o_val_0;

	// tmp reg
	reg[31:0] tmp_w_val;
	reg[4:0] tmp_w_reg_num;

	wire[31:0] tmp_pc;
	wire[31:0] tmp_rs_1;
	wire[31:0] tmp_rs_2;
	wire[4:0] tmp_rd_num;
	wire[11:0] tmp_imm_12_i;
    wire[19:0] tmp_imm_20;
    wire[11:0] tmp_imm_12_b;
    wire[19:0] tmp_imm_20_i;
    wire[11:0] tmp_imm_12_s;
	wire[6:0] tmp_opcode;
	wire[2:0] tmp_func_3;
	wire[6:0] tmp_func_7;

	initial begin
		tmp_address_0 <= 0;
		tmp_i_val_0  <= 0;
    	tmp_op_type_0 <= 0;
		tmp_w_val <= 0;
 		tmp_w_reg_num <= 0;
	end

	pc pc_0(.clk(clk), 
            .rst(rst),
            .in(i_if_id_pc),
            .out(pc_0_out));

	if_id if_id_0(.rst(rst),
                  .clk(clk),
                  .i_pc(i_if_id_pc),
                  .i_inst(i_if_id_inst),
                  .pc(if_id_pc),
                  .inst(if_id_inst));

	id_ex id_ex_0(.rst(rst),
                  .clk(clk),
			      .i_pc(if_id_pc),
			      .i_rs_1(i_id_ex_rs_1),
			      .i_rs_2(i_id_ex_rs_2),
			      .i_rd_num(i_id_ex_rd_num),
			      .i_imm_12_i(i_id_ex_imm_12_i),
                  .i_imm_20(i_id_ex_imm_20),
                  .i_imm_12_b(i_id_ex_imm_12_b),
                  .i_imm_20_i(i_id_ex_imm_20_i),
			      .i_imm_12_s(i_id_ex_imm_12_s),
			      .i_opcode(i_id_ex_opcode),
			      .i_func_3(i_id_ex_func_3),
			      .i_func_7(i_id_ex_func_7),		
			      .pc(tmp_pc),
			      .rs_1(tmp_rs_1),
			      .rs_2(tmp_rs_2),
			      .rd_num(tmp_rd_num),
			      .imm_12_i(tmp_imm_12_i),
                  .imm_20(tmp_imm_20),
                  .imm_12_b(tmp_imm_12_b),
                  .imm_20_i(tmp_imm_20_i),
                  .imm_12_s(tmp_imm_12_s),
			      .opcode(tmp_opcode),
			      .func_3(tmp_func_3),
			      .func_7(tmp_func_7));

	stage_1 stage_1_0(.b_taken(b_taken),
                      .pc(pc_0_out),
                      .b_pc(b_pc),
                      .pc_out(i_if_id_pc));

	stage_2 stage_2_0(.w_val(tmp_w_val),
                      .w_reg_num(tmp_w_reg_num),
                      .if_id_inst(if_id_inst),
                      .b_taken(b_taken),
                      .b_pc(b_pc),
                      .rs_1(i_id_ex_rs_1),
                      .rs_2(i_id_ex_rs_2),
				      .rd_num(i_id_ex_rd_num),
					  .opcode(i_id_ex_opcode),
                      .func_7(i_id_ex_func_7),
                      .func_3(i_id_ex_func_3),
                      .imm_12_i(i_id_ex_imm_12_i),
                      .imm_20(i_id_ex_imm_20),
                      .imm_12_b(i_id_ex_imm_12_b),
                      .imm_20_i(i_id_ex_imm_20_i),
					  .imm_12_s(i_id_ex_imm_12_s));
                      
	memory_controller memory_controller_0(.rst(rst),
									      .address_0(tmp_address_0),
                                          .i_val_0(tmp_i_val_0),
                                          .op_type_0(tmp_op_type_0),
    							          .address_1(pc_0_out),
                                          .i_val_1(32'b0),
                                          .op_type_1(1'b0),
                                          .o_val_0(tmp_o_val_0),
                                          .o_val_1(i_if_id_inst));

	always@(posedge clk) begin
		$display("---begin fetch---");
		$display("pc_0_out is %d ", pc_0_out);
		$display("i_if_id_pc is %d ", i_if_id_pc);
		$display("i_if_id_inst is %0h ", i_if_id_inst);
		$display("---end fetch---");
	end

	always@(posedge clk) begin
		$display("---begin decode---");
		$display("if_id_pc is %d ", if_id_pc);
		$display("i_id_ex_rs_1 is %d ", i_id_ex_rs_1);
		$display("i_id_ex_rs_2 is %d ", i_id_ex_rs_2);
		$display("i_id_ex_rd_num is %d ", i_id_ex_rd_num);
		$display("i_id_ex_imm_12_i is %d ", i_id_ex_imm_12_i);
        $display("i_id_ex_imm_20 is %d ", i_id_ex_imm_20);
        $display("i_id_ex_imm_12_b is %d ", i_id_ex_imm_12_b);
		$display("i_id_ex_opcode is %d ", i_id_ex_opcode);
		$display("i_id_ex_func_3 is %d ", i_id_ex_func_3);
		$display("i_id_ex_func_7 is %d ", i_id_ex_func_7);	
		$display("---end decode---");
	end
endmodule
