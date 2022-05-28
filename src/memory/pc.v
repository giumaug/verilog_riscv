`ifndef PC       
`define PC
`include "constants.vh"
`endif

module pc(input i_clk,
          input i_rst,
		  input[31:0] i_in,
          output reg [31:0] out);

	always@(i_rst) begin
		if (i_rst == 1) begin
			out <= `BOOT_ADDRESS;
		end
	end

	always @(posedge(i_clk)) begin
		out <= i_in;
	end
endmodule
