`ifndef TOP         
`define TOP
`include "verilog_riscv.v"
`endif

module top();
	reg clk;
	reg rst;
	reg[31:0] counter;

	verilog_riscv verilog_riscv_0(.i_counter(counter), .i_clk(clk), .i_rst(rst));

	always #5 clk = ~clk;

	initial begin
		clk <= 0;
		rst <= 1;
		counter <= 1;
	end

	always @(posedge(clk)) begin
	    if (rst == 1) rst <= 0;
		counter <= counter + 1;
		if (counter == 1000) $finish();
    end
endmodule
