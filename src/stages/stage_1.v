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
               input[31:0] i_val_from_mem_ctr,
			   output[31:0] pc,
			   output[31:0] inst,
			   output[31:0] pc_next);

	wire[31:0] adder_0_out;
	wire[31:0] pc_0_out;
	wire[31:0] pc_incr; 
	
	assign pc = i_pc;
	assign inst = i_val_from_mem_ctr;

	adder adder_0(.i_in_1(32'b100),
		          .i_in_2(i_pc),
	              .out(adder_0_out));

	mux mux_0(.i_in_1(adder_0_out),
			  .i_in_2(i_b_pc),
			  .i_sel(i_b_taken),
              .out(pc_next));
              
              
                       
    always@(i_b_taken, i_pc, i_b_pc) begin
        $strobe("---begin stage_1---");
		$strobe("i_b_taken = %0h", i_b_taken);
		$strobe("i_pc = %0h", i_pc);
		$strobe("i_b_pc = %0h", i_b_pc);
		$strobe("pc_incr = %0h", pc_incr);
		$strobe("pc = %0h", pc);
		$strobe("inst = %0h", inst);
		$strobe("time is %0t",$time);
		$strobe("---end stage_1---");
    end        
endmodule
