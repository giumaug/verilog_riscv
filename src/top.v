`ifndef TOP         
`define TOP
`include "verilog_riscv.v"
`endif

module top();
	reg clk;
	reg rst;
	reg[31:0] counter;

	verilog_riscv verilog_riscv_0(.clk(clk), .rst(rst));

	always #5 clk = ~clk;

	initial begin
		clk <= 0;
		rst <= 0;
		counter <= 0;
	end

	always @(posedge(clk)) begin
		counter <= counter + 1;
		if (counter == 5) $finish();
    end
endmodule
