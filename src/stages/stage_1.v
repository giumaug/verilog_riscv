`ifndef STAGE_1             
`define STAGE_1
`include "constants.vh"
`include "components/mux.v"
`include "components/adder.v"
`include "memory/pc.v"
`endif

module stage_1(input i_b_taken,
               input[31:0] i_pc,
               input[31:0] i_b_pc,
			   output[31:0] pc_out);

	wire[31:0] adder_0_out;
	wire[31:0] pc_0_out;

	adder adder_0(.i_in_1(32'b100),
		          .i_in_2(i_pc),
	              .out(adder_0_out));

	mux mux_0(.i_in_1(adder_0_out),
			  .i_in_2(i_b_pc),
			  .i_sel(i_b_taken),
              .out(pc_out));
    
/*          
    always@(i_pc) begin
        $display("---begin fetch---");
		$display("i_b_taken = %0h", i_b_taken);
		$display("i_pc = %0h", i_pc);
        $display("pc_out = %0h", pc_out);
		$display("---end fetch---");
    end
*/
                       
endmodule
