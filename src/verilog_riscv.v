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
			         output reg[3:0] leds);
			     
    wire[3:0] _leds;    
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
	wire[31:0] pc_0_in;
	wire[31:0] b_pc;
	wire b_taken;
	wire[31:0] i_val_from_mem_ctr_0;
    wire[31:0] addr_to_mem_ctr_0;
    wire[31:0] val_to_mem_ctr_0;
    wire op_to_mem_ctr_0;
    wire[31:0] i_val_from_mem_ctr_1;
    wire[31:0] addr_to_mem_ctr_1;
    wire[31:0] val_to_mem_ctr_1;
	wire[31:0] w_rd;
	wire[4:0] w_rd_num;
	
	wire[31:0] i_if_id_debug_pc;
	wire[31:0] i_if_id_debug_inst;
	wire[31:0] i_id_ex_debug_pc;
	wire[31:0] i_id_ex_debug_inst;
	wire[31:0] i_ex_mem_debug_pc;
	wire[31:0] i_ex_mem_debug_inst;
	wire[31:0] i_mem_wb_debug_pc;
	wire[31:0] i_mem_wb_debug_inst;
	wire[31:0] mem_wb_debug_pc;
	wire[31:0] mem_wb_debug_inst;
	
	wire _stall;
	wire i_clk_stall;
	
	assign i_if_id_debug_pc = pc_0_out;
	assign i_if_id_debug_inst = i_if_id_inst;
	assign i_clk_stall = _stall ? 1'b1 : i_clk;
	assign addr_to_mem_ctr_1 = i_if_id_pc;
	
	pc pc_0(.i_clk(i_clk_stall), 
            .i_rst(i_rst),
            .i_in(pc_0_in),
            .out(pc_0_out));
            
	if_id if_id_0(.i_debug_pc(i_if_id_debug_pc),
				  .i_debug_inst(i_if_id_debug_inst),
	              .i_rst(i_rst),
                  .i_clk(i_clk_stall),
                  .i_pc(i_if_id_pc),
                  .i_inst(i_if_id_inst),
                  .debug_pc(i_id_ex_debug_pc),
				  .debug_inst(i_id_ex_debug_inst),
                  .pc(if_id_pc),
                  .inst(if_id_inst));

	id_ex id_ex_0(.i_debug_pc(i_id_ex_debug_pc),
				  .i_debug_inst(i_id_ex_debug_inst),
	              .i_rst(i_rst),
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
			      .debug_pc(i_ex_mem_debug_pc),
				  .debug_inst(i_ex_mem_debug_inst),	
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
			      
	ex_mem ex_mem_0(.i_debug_pc(i_ex_mem_debug_pc),
				    .i_debug_inst(i_ex_mem_debug_inst),
	                .i_clk(i_clk),
					.i_rst(i_rst),
					.i_rs_2(i_ex_mem_rs_2),
					.i_rd_num(i_ex_mem_rd_num),
					.i_alu_out(i_ex_mem_alu_out),
					.i_opcode(i_ex_mem_opcode),
					.i_func_3(i_ex_mem_func_3),
					.i_op_type(i_ex_mem_op_type),
					.debug_pc(i_mem_wb_debug_pc),
				    .debug_inst(i_mem_wb_debug_inst),
					.rs_2(ex_mem_rs_2),
					.rd_num(ex_mem_rd_num),
					.alu_out(ex_mem_alu_out),
					.opcode(ex_mem_opcode),
					.func_3(ex_mem_func_3),
					.op_type(ex_mem_op_type));
					
	mem_wb mem_wb_0(.i_debug_pc(i_mem_wb_debug_pc),
			        .i_debug_inst(i_mem_wb_debug_inst),
                    .i_clk(i_clk),
			        .i_rst(i_rst),
			        .i_mem_out(i_mem_wb_mem_out),         
                    .i_rd_num(i_mem_wb_rd_num),
                    .i_alu_out(i_mem_wb_alu_out),
                    .i_op_type(i_mem_wb_op_type),
                    .debug_pc(mem_wb_debug_pc),
			        .debug_inst(mem_wb_debug_inst),
                    .mem_out(mem_wb_mem_out),         
                    .rd_num(mem_wb_rd_num),
                    .alu_out(mem_wb_alu_out),
                    .op_type(mem_wb_op_type));

	stage_1 stage_1_0(.i_b_taken(b_taken),
                      .i_pc(pc_0_out),
                      .i_b_pc(b_pc),
                      .i_val_from_mem_ctr(i_val_from_mem_ctr_1),
                      .pc(i_if_id_pc),
                      .inst(i_if_id_inst),
                      .pc_next(pc_0_in));

	stage_2 stage_2_0(.i_rst(i_rst),
	                  .i_reg_op(i_clk),
	                  .i_w_rd(w_rd),
                      .i_w_rd_num(w_rd_num),
                      .i_inst(if_id_inst),
                      .i_pc(if_id_pc),
                      .i_id_ex_rd_num(id_ex_rd_num),
	                  .i_ex_mem_rd_num(ex_mem_rd_num),
	                  .stall(_stall),
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
					
	stage_3 stage_3_0(.i_pc(id_ex_pc),
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
               
	stage_4 stage_4_0(.i_rs_2(ex_mem_rs_2),
              .i_rd_num(ex_mem_rd_num),
              .i_alu_out(ex_mem_alu_out),
              .i_opcode(ex_mem_opcode),
              .i_func_3(ex_mem_func_3),
              .i_op_type(ex_mem_op_type),
              .i_val_from_mem_ctr(i_val_from_mem_ctr_0),
              .mem_out(i_mem_wb_mem_out),         
              .rd_num(i_mem_wb_rd_num),
              .alu_out(i_mem_wb_alu_out),
			  .op_type(i_mem_wb_op_type),
              .addr_to_mem_ctr(addr_to_mem_ctr_0),
              .val_to_mem_ctr(val_to_mem_ctr_0),
              .op_to_mem_ctr(op_to_mem_ctr_0));
              
     stage_5 stage_5_0(.i_mem_out(mem_wb_mem_out),         
                       .i_rd_num(mem_wb_rd_num),
                       .i_alu_out(mem_wb_alu_out),
                       .i_op_type(mem_wb_op_type),
                       .rd_num(w_rd_num),
                       .rd(w_rd));
                           
	memory_controller memory_controller_0(.i_rst(i_rst),
									      .i_address_0(addr_to_mem_ctr_0),
                                          .i_val_0(val_to_mem_ctr_0),
                                          .i_op_type_0(op_to_mem_ctr_0),
    							          .i_address_1(addr_to_mem_ctr_1),
                                          .i_val_1(32'b0),
                                          .i_op_type_1(1'b0),
                                          .o_val_0(i_val_from_mem_ctr_0),
                                          .o_val_1(i_val_from_mem_ctr_1),
                                          .o_leds(_leds));
                                          
	always@(_leds) begin
        leds <= _leds;
	end                                       
                                                                            
    //Per ogni stage stampo la relazione ingresso/uscita. Considero l'uscita disponibile a t+T con t = istante
    //in cui arriva il fronte di salita del clock.
    //i_counter conta il numero di elaborazioni eseguita dallo stage1. Il conteggio parte da 1.                                   
	always@(posedge i_clk) begin
		$display("---begin pc---");
		$display("i_in = %0h", i_if_id_pc);
		$display("out = %0h", pc_0_out);
		$display("i_counter = %0h", i_counter);
		$display("time is %0t",$time);
		$display("---end pc---");
		
		$display("---begin fetch---");
		$display("i_counter = %0h", i_counter);
		$display("time is %0t",$time);
		$display("i_b_taken = %0h", b_taken); //verificare se corretto
        $display("i_pc = %0h", pc_0_out);
        $display("i_b_pc = %0h", b_pc);
        $display("i_val_from_mem_ctr = %0h", i_val_from_mem_ctr_1);
	    $display("pc = %0h", i_if_id_pc);
	    $display("inst = %0h", i_if_id_inst);
	    $display("pc_next = %0h", pc_0_in);
	    $display("---end fetch---");
	   
		//$display("---begin fetch---");
		//$display("i_counter = %0h", i_counter);
		//$display("time is %0t",$time);
		//$display("inst = %0h", i_if_id_inst);
		//$display("i_b_taken = %0h", b_taken);
		//$display("i_pc = %0h", pc_0_out);
        //$display("pc_out = %0h", i_if_id_pc);
		//$display("---end fetch---");
		
		$display("---begin decode---");
		$display("i_counter = %0h", i_counter);
		$display("time is %0t",$time);
		$display("if_id_debug_pc = %0h", i_id_ex_debug_pc);
        $display("if_id_debug_inst = %0h", i_id_ex_debug_inst);
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
		$display("i_counter = %0h", i_counter);
		$display("time is %0t",$time);
		$display("id_ex_debug_pc = %0h", i_ex_mem_debug_pc);
        $display("id_ex_debug_inst = %0h", i_ex_mem_debug_inst);
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
        decode_inst(i_ex_mem_debug_inst);
		$display("---end execute---");
		
		$display("---begin mem access---");
		$display("i_counter = %0h", i_counter);
		$display("time is %0t",$time);
		$display("ex_mem_debug_pc = %0h", i_mem_wb_debug_pc);
        $display("ex_mem_debug_inst = %0h", i_mem_wb_debug_inst);
		$display("i_rs_2 = %0h", ex_mem_rs_2);
		$display("i_rd_num = %0h", ex_mem_rd_num);
		$display("i_alu_out = %0h", ex_mem_alu_out);
		$display("i_opcode = %0h", ex_mem_opcode);
        $display("i_func_3 = %0h", ex_mem_func_3);
        $display("i_op_type = %0h", ex_mem_op_type);
        $display("i_val_from_mem_ctr = %0h", i_val_from_mem_ctr_0);
        $display("mem_out = %0h", i_mem_wb_mem_out);          
        $display("rd_num = %0h", i_mem_wb_rd_num);
        $display("alu_out = %0h", i_mem_wb_alu_out);
		$display("op_type = %0h", i_mem_wb_op_type);
        $display("addr_to_mem_ctr_0 = %0h", addr_to_mem_ctr_0);
        $display("val_to_mem_ctr_0 = %0h", val_to_mem_ctr_0);
        $display("op_to_mem_ctr_0 = %0h", op_to_mem_ctr_0);
        decode_inst(i_mem_wb_debug_inst);
		$display("---end mem access---");
		
		$display("---begin write back---");
		$display("i_counter = %0h", i_counter);
		$display("time is %0t",$time);
		$display("mem_wb_debug_pc = %0h", mem_wb_debug_pc);
        $display("mem_wb_debug_inst = %0h", mem_wb_debug_inst);
		$display("i_mem_out = %0h", mem_wb_mem_out);
        $display("i_rd_num = %0h", mem_wb_rd_num);
        $display("i_alu_out = %0h", mem_wb_alu_out);
        $display("i_op_type = %0h", mem_wb_op_type);
        $display("rd_num = %0h", w_rd_num);
        $display("rd = %0h", w_rd);
        decode_inst(mem_wb_debug_inst);
		$display("---end write back---");
	end
	
	task decode_inst(input[31:0] i_inst);
		begin
			$display("instruction code = %0h", i_inst);
			case (i_inst[6:0])
			    `BRANCH: begin
					case (i_inst[14:12])
						`BEQ: begin
							$display("instruction BEQ");
						end
						`BNE: begin
							$display("instruction BNE");
						end
						`BLT: begin
							$display("instruction BLT");	
						end
						`BLTU: begin
							$display("instruction BLTU");	
						end
						`BGE: begin
							$display("instruction BGE");
						end
						`BGEU: begin
							$display("instruction BGE");
						end
					endcase
				end
				`OPIMM: begin
					case (i_inst[14:12])
						`ADDI: begin
							$display("instruction ADDI");
						end
						`SLTI: begin
							$display("instruction SLTI");
						end
						`SLTIU: begin
							$display("instruction SLTIU");
						end
						`ANDI: begin
							$display("instruction ANDI");
						end
						`ORI: begin
							$display("instruction ORI");
						end
						`XORI: begin
							$display("instruction XORI");
						end
						`SLLI: begin
							$display("instruction SLLI");
						end
						`SRLISRAI: begin
							if (i_inst[31:25] == `SRLI)	$display("instruction SRLI");
							else if (i_inst[31:25] == `SRAI) $display("instruction SRAI");
						end
					endcase
				end
				`OP: begin
					case (i_inst[14:12])
						`ADDSUB: begin
							if (i_inst[31:25] == `ADD) $display("instruction ADD");
							else if (i_inst[31:25] == `SUB) $display("instruction SUB");
						end
						`SLT: begin
							$display("instruction SLT");
						end
						`SLTU: begin
							$display("instruction SLTU");
						end
						`AND: begin
							$display("instruction AND");
						end
						`OR: begin
							$display("instruction OR");
						end
						`XOR: begin
							$display("instruction XOR");
						end
						`SLL: begin
							$display("instruction SLL");
						end
						`SRLSRA: begin
							$display("instruction SRLSRA");
							if (i_inst[31:25] == `SRL) $display("instruction SRL");
						else if (i_inst[31:25] == `SRA) $display("instruction SRA");
						end
					endcase
				end
				`JAL: begin
					$display("instruction JAL");
				end
				`JALR: begin
					$display("instruction JALR");
				end
				`LUI: begin
					$display("instruction LUI");
				end
				`AUIPC: begin
					$display("instruction AUIPC");
				end
				`LOAD: begin
					$display("instruction LOAD");
				end
				`STORE: begin
					$display("instruction STORE");
				end		
			endcase
		end  
	endtask  
endmodule
