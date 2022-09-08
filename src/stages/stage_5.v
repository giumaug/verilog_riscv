`ifndef STAGE_5  
`define STAGE_5
`include "constants.vh"
`include "utils.vh"
`endif

module stage_5(input[31:0] i_mem_out,         
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input i_op_type,
              output reg[4:0] rd_num,
              output reg[31:0] rd);

	always @(*) begin
	    //i_op_type:
	    //00 use i_alu_out
	    //01 use i_mem_out
	    //10 use 8 low bit from i_mem_out signed extended
	    //11 use 16 low bit from i_mem_out signed extended
	    //100 use 8 low bit from i_mem_out zero extended
	    //101 use 16 low bit from i_mem_out zero extended
		if (i_op_type == 0) rd = i_alu_out;
		else rd = i_mem_out;		
		rd_num = i_rd_num;
	end
endmodule
