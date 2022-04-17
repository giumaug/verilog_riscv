`ifndef STAGE_1             
`define STAGE_1
`include "constants.vh"
`include "components/mux.v"
`include "components/adder.v"
`include "memory/pc.v"
`endif

module stage_1(input rst,
               input clk,
			   input b_taken,
               input[31:0] b_pc,
			   output[31:0] inst_addr,
			   output reg[31:0] pc_out);

	reg[31:0] const_incr <= 4; 
	wire[31:0] adder_0_out;
	wire[31:0] pc_0_out;
	wire[31:0] mux_0_out;

	pc pc_0(.clk(clk),
            .rst(rst),
            .in(pc_out),
            .out(inst_addr));

	adder adder_0(.in_1(const_incr),
		          .in_2(pc_0_out),
	              .out(inst_addr));

	mux mux_0(.in_1(adder_0_out),
			  .in_2(b_pc),
			  .sel(b_taken),
              .out(pc_out));

	//Only for debug
	always@(posedge clk) begin
		$display("---begin fetch---");
		$display("pc_out is %d ", pc_out);
		$display("inst_addr is %d ", inst_addr);
		$display("---end fetch---");
	end
endmodule
