module mem_wb(input[31:0] i_debug_pc,
			  input[31:0] i_debug_inst,
              input i_clk,
			  input i_rst,
			  input[31:0] i_mem_out,         
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input i_op_type,
              output reg[31:0] debug_pc,
			  output reg[31:0] debug_inst,
              output reg[31:0] mem_out,         
              output reg[4:0] rd_num,
              output reg[31:0] alu_out,
              output reg op_type);
              
	always @(posedge(i_clk)) begin
		mem_out <= i_mem_out;     
        rd_num <= i_rd_num;
        alu_out <= i_alu_out;
        op_type <= i_op_type;
        debug_pc <= i_debug_pc;
	    debug_inst <= i_debug_inst;
    end
    
    always@(i_rst) begin
		if (i_rst == 1) begin
			mem_out <= 0;     
			rd_num <= 0;
			alu_out <= 0;
			op_type <= 0;
			debug_pc <= 0;
	        debug_inst <= 0;
		end
	end
endmodule
