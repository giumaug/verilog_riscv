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
	    $display("---begin begin write back---");
		if (i_op_type == 0) rd = i_alu_out;
		else rd = i_mem_out;		
		rd_num = i_rd_num;
		
		$display("i_mem_out = %0h", i_mem_out);
        $display("i_rd_num = %0h", i_rd_num);
        $display("i_alu_out = %0h", i_alu_out);
        $display("i_op_type = %0h", i_op_type);
        $display("rd_num = %0h", rd_num);
        $display("rd = %0h", rd);
		$display("---end write back---");
	end
	
	
endmodule
