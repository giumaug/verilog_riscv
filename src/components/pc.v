`ifndef PC       
`define PC
`include "constants.vh"
`endif

module pc(input clk,
          input rst,
		  input[31:0] in,
          output reg [31:0] out);

	always@(rst) begin
		if (rst == 1) begin
			out <= `BOOT_ADDRESS;
		end
	end

	always @(posedge(clk)) begin
		out <= in;
	end
endmodule
