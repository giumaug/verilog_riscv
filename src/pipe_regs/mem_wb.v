module mem_wb(input clk,
			  input[31:0] i_mem_out,         
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input i_op_type,
              output reg[31:0] mem_out,         
              output reg[4:0] rd_num,
              output reg[31:0] alu_out,
              output reg op_type);
              
	always @(posedge(clk)) begin
		mem_out <= i_mem_out;     
        rd_num <= i_rd_num;
        alu_out <= i_alu_out;
        op_type <= i_op_type;
    end
endmodule
