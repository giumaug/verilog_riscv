`ifndef VERILOG_RISCV        
`define VERILOG_RISCV
`include "pipe_regs/if_id.v"
`include "pipe_regs/id_ex.v"
`include "pipe_regs/ex_mem.v"
`include "pipe_regs/mem_wb.v"
`include "stages/stage_1.v"
`include "stages/stage_2.v"
`include "stages/stage_3.v"
`include "stages/stage_4.v"
`include "stages/stage_5.v"
`include "controllers/memory_controller.v"
`endif

module verilog_riscv(input[31:0] i_counter,
                     input i_rst,
                     input i_clk,
			         output[3:0] leds);
	
	wire[31:0] i_if_id_pc;
	wire[31:0] i_if_id_inst;
	wire[31:0] if_id_pc;
	wire[31:0] if_id_inst;
	
	wire[31:0] i_id_ex_pc;
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
	
	wire[31:0] id_ex_pc;
	wire[4:0] id_ex_rd_num;
	wire[31:0] id_ex_rs_1;
	wire[31:0] id_ex_rs_2;
	wire[6:0] id_ex_opcode;
    wire[6:0] id_ex_func_7;
    wire[2:0] id_ex_func_3;
    wire[11:0] id_ex_imm_12_i;
    wire[19:0] id_ex_imm_20;
    wire[11:0] id_ex_imm_12_b;
    wire[19:0] id_ex_imm_20_i;
	wire[11:0] id_ex_imm_12_s;
	
    wire[31:0] i_ex_mem_rs_2;
	wire[4:0] i_ex_mem_rd_num;
	wire[31:0] i_ex_mem_alu_out;
	wire[6:0] i_ex_mem_opcode;
	wire[2:0] i_ex_mem_func_3;
	wire i_ex_mem_op_type;
	wire[31:0] ex_mem_rs_2;
	wire[4:0] ex_mem_rd_num;
	wire[31:0] ex_mem_alu_out;
	wire[6:0] ex_mem_opcode;
	wire[2:0] ex_mem_func_3;
	wire ex_mem_op_type;
	
	wire[31:0] i_mem_wb_mem_out;    
    wire[4:0] i_mem_wb_rd_num;
    wire[31:0] i_mem_wb_alu_out;
    wire i_mem_wb_op_type;
    wire[31:0] mem_wb_mem_out;         
    wire[4:0] mem_wb_rd_num;
    wire[31:0] mem_wb_alu_out;
    wire mem_wb_op_type;
              
	wire[31:0] pc_0_out;
	wire[31:0] b_pc;
	wire b_taken;
	wire[31:0] i_val_from_mem_ctr;
    wire[31:0] addr_to_mem_ctr;
    wire[31:0] val_to_mem_ctr;
    wire op_to_mem_ctr;
	wire[31:0] w_rd;
	wire[4:0] w_rd_num;

	pc pc_0(.i_clk(i_clk), 
            .i_rst(i_rst),
            .i_in(i_if_id_pc),
            .out(pc_0_out));

	if_id if_id_0(.i_rst(i_rst),
                  .i_clk(i_clk),
                  .i_pc(i_if_id_pc),
                  .i_inst(i_if_id_inst),
                  .pc(if_id_pc),
                  .inst(if_id_inst));

	id_ex id_ex_0(.i_rst(i_rst),
                  .i_clk(i_clk),
			      .i_pc(i_id_ex_pc),
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
			      .pc(id_ex_pc),
			      .rs_1(id_ex_rs_1),
			      .rs_2(id_ex_rs_2),
			      .rd_num(id_ex_rd_num),
			      .imm_12_i(id_ex_imm_12_i),
                  .imm_20(id_ex_imm_20),
                  .imm_12_b(id_ex_imm_12_b),
                  .imm_20_i(id_ex_imm_20_i),
                  .imm_12_s(id_ex_imm_12_s),
			      .opcode(id_ex_opcode),
			      .func_3(id_ex_func_3),
			      .func_7(id_ex_func_7));
			      
	ex_mem ex_mem_0(.i_clk(i_clk),
					.i_rst(i_rst),
					.i_rs_2(i_ex_mem_rs_2),
					.i_rd_num(i_ex_mem_rd_num),
					.i_alu_out(i_ex_mem_alu_out),
					.i_opcode(i_ex_mem_opcode),
					.i_func_3(i_ex_mem_func_3),
					.i_op_type(i_ex_mem_op_type),
					.rs_2(ex_mem_rs_2),
					.rd_num(ex_mem_rd_num),
					.alu_out(ex_mem_alu_out),
					.opcode(ex_mem_opcode),
					.func_3(ex_mem_func_3),
					.op_type(ex_mem_op_type));

	stage_1 stage_1_0(.i_counter(i_counter),
	                  .i_b_taken(b_taken),
                      .i_pc(pc_0_out),
                      .i_b_pc(b_pc),
                      .pc_out(i_if_id_pc));

	stage_2 stage_2_0(.i_counter(i_counter),
	                  .i_rst(i_rst),
	                  .i_reg_op(i_clk),
	                  .i_w_rd(w_rd),
                      .i_w_rd_num(w_rd_num),
                      .i_inst(if_id_inst),
                      .i_pc(if_id_pc),
                      .b_taken(b_taken),
                      .b_pc(b_pc),
                      .pc(i_id_ex_pc),
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
					
	stage_3 stage_3_0(.i_counter(i_counter),
	           .i_pc(id_ex_pc),
			   .i_rs_1(id_ex_rs_1),
			   .i_rs_2(id_ex_rs_2),
			   .i_rd_num(id_ex_rd_num),
			   .i_imm_12_i(id_ex_imm_12_i),
               .i_imm_20(id_ex_imm_20),
               .i_imm_12_b(id_ex_imm_12_b),
               .i_imm_20_i(id_ex_imm_20_i),
			   .i_imm_12_s(id_ex_imm_12_s),
			   .i_opcode(id_ex_opcode),
			   .i_func_3(id_ex_func_3),
			   .i_func_7(id_ex_func_7),
               .rs_2(i_ex_mem_rs_2),
               .rd_num(i_ex_mem_rd_num),
               .alu_out(i_ex_mem_alu_out),
               .opcode(i_ex_mem_opcode),
               .func_3(i_ex_mem_func_3),
               .op_type(i_ex_mem_op_type));
               
	stage_4 stage_4_0(.i_counter(i_counter),
	          .i_rs_2(i_ex_mem_rs_2),
              .i_rd_num(i_ex_mem_rd_num),
              .i_alu_out(i_ex_mem_alu_out),
              .i_opcode(i_ex_mem_opcode),
              .i_func_3(i_ex_mem_func_3),
              .i_op_type(i_ex_mem_op_type),
              .i_val_from_mem_ctr(i_val_from_mem_ctr),
              .mem_out(i_mem_wb_mem_out),         
              .rd_num(i_mem_wb_rd_num),
              .alu_out(i_mem_wb_alu_out),
			  .op_type(i_mem_wb_op_type),
              .addr_to_mem_ctr(addr_to_mem_ctr),
              .val_to_mem_ctr(val_to_mem_ctr),
              .op_to_mem_ctr(op_to_mem_ctr));
              
     stage_5 stage_5_0(.i_counter(i_counter),
                       .i_mem_out(mem_wb_mem_out),         
                       .i_rd_num(mem_wb_rd_num),
                       .i_alu_out(mem_wb_alu_out),
                       .i_op_type(mem_wb_op_type),
                       .rd_num(w_rd_num),
                       .rd(w_rd));
                           
	memory_controller memory_controller_0(.i_rst(i_rst),
									      .i_address_0(addr_to_mem_ctr),
                                          .i_val_0(val_to_mem_ctr),
                                          .i_op_type_0(op_to_mem_ctr),
    							          .i_address_1(pc_0_out),
                                          .i_val_1(32'b0),
                                          .i_op_type_1(1'b0),
                                          .o_val_0(i_val_from_mem_ctr),
                                          .o_val_1(i_if_id_inst));
/*
	always@(posedge i_clk) begin
	
		$display("---begin pc---");
		$display("i_in = %0h", i_if_id_pc);
		$display("out = %0h", pc_0_out);
		$display("---end pc---");
	
		$display("---begin fetch---");
		$display("i_b_taken = %0h", b_taken);
		$display("i_pc = %0h", pc_0_out);
        $display("pc_out = %0h", i_if_id_pc);
		$display("---end fetch---");
		
		$display("---begin decode---");
		$display("i_w_rd = %0h", w_rd);
        $display("i_w_rd_num= %0h", w_rd_num);
        $display("i_inst = %0h", if_id_inst);
        $display("i_pc = %0h", if_id_pc);
        $display("b_taken = %0h", b_taken);
        $display("b_pc = %0h", b_pc);
        $display("rs_1 = %0h", i_id_ex_rs_1);
        $display("rs_2 = %0h", i_id_ex_rs_2);
		$display("rd_num = %0h", i_id_ex_rd_num);
		$display("opcode = %0h", i_id_ex_opcode);
        $display("func_7 = %0h", i_id_ex_func_7);
        $display("func_3 = %0h", i_id_ex_func_3);
        $display("imm_12_i = %0h", i_id_ex_imm_12_i);
        $display("imm_20 = %0h", i_id_ex_imm_20);
        $display("imm_12_b = %0h", i_id_ex_imm_12_b);
        $display("imm_20_i = %0h", i_id_ex_imm_20_i);
		$display("imm_12_s = %0h", i_id_ex_imm_12_s);
		$display("---end decode---");
		
		$display("---begin execute---");
		$display("i_pc = %0h", id_ex_pc);
		$display("i_rs_1 = %0h", id_ex_rs_1);
		$display("i_rs_2 = %0h", id_ex_rs_2);
		$display("i_rd_num = %0h", id_ex_rd_num);
		$display("i_imm_12_i = %0h", id_ex_imm_12_i);
        $display("i_imm_20 = %0h", id_ex_imm_20);
        $display("i_imm_12_b = %0h", id_ex_imm_12_b);
        $display("i_imm_20_i = %0h", id_ex_imm_20_i);
		$display("i_imm_12_s = %0h", id_ex_imm_12_s);
		$display("i_opcode = %0h", id_ex_opcode);
		$display("i_func_3 = %0h", id_ex_func_3);
		$display("i_func_7 = %0h", id_ex_func_7);
        $display("rs_2 = %0h", i_ex_mem_rs_2);
        $display("rd_num = %0h", i_ex_mem_rd_num);
        $display("alu_out = %0h", i_ex_mem_alu_out);
        $display("opcode = %0h", i_ex_mem_opcode);
        $display("func_3 = %0h", i_ex_mem_func_3);
        $display("op_type = %0h", i_ex_mem_op_type);
		$display("---end execute---");
		
		$display("---begin mem access---");
		$display("i_rs_2 = %0h", i_ex_mem_rs_2);
		$display("i_rd_num = %0h", i_ex_mem_rd_num);
		$display("i_alu_out = %0h", i_ex_mem_alu_out);
		$display("i_opcode = %0h", i_ex_mem_opcode);
        $display("i_func_3 = %0h", i_ex_mem_func_3);
        $display("i_op_type = %0h", i_ex_mem_op_type);
        $display("i_val_from_mem_ctr = %0h", i_val_from_mem_ctr);
        $display("mem_out = %0h", i_mem_wb_mem_out);          
        $display("rd_num = %0h", i_mem_wb_rd_num);
        $display("alu_out = %0h", i_mem_wb_alu_out);
		$display("op_type = %0h", i_mem_wb_op_type);
        $display("addr_to_mem_ctr = %0h", addr_to_mem_ctr);
        $display("val_to_mem_ctr = %0h", val_to_mem_ctr);
        $display("op_to_mem_ctr = %0h", op_to_mem_ctr);
		$display("---end mem access---");
		
		$display("---begin begin write back---");
		$display("i_mem_out = %0h", mem_wb_mem_out);
        $display("i_rd_num = %0h", mem_wb_rd_num);
        $display("i_alu_out = %0h", mem_wb_alu_out);
        $display("i_op_type = %0h", mem_wb_op_type);
        $display("rd_num = %0h", w_rd_num);
        $display("rd = %0h", w_rd);
		$display("---end write back---");
	end
*/
endmodule
