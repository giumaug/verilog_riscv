`ifndef STAGE_5  
`define STAGE_5
`include "constants.vh"
`include "utils.vh"
`endif

module stage_5(input[31:0] i_mem_out,         
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input i_op_type,
              output[4:0] rd_num,
              output[31:0] rd);

	always @(*) begin
		if (op_type == 0) rd = i_alu_out;
		else _rd = i_mem_out;		
		rd_num = i_rd_num;
	end
endmodule
