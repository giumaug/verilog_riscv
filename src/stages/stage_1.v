`ifndef STAGE_1             
`define STAGE_1
`include "constants.vh"
`include "components/mux.v"
`include "components/adder.v"
`include "memory/pc.v"
`endif

module stage_1(input b_taken,
               input[31:0] pc,
               input[31:0] b_pc,
			   output[31:0] pc_out);

	wire[31:0] adder_0_out;
	wire[31:0] pc_0_out;

	adder adder_0(.in_1(32'b100),
		          .in_2(pc),
	              .out(adder_0_out));

	mux mux_0(.in_1(adder_0_out),
			  .in_2(b_pc),
			  .sel(b_taken),
              .out(pc_out));
endmodule
