`include "mux.v"

module top_mux();
	reg clk;
	reg[31:0] val_1;
	reg[31:0] val_2;
	reg sel;
	reg[31:0] counter;
	wire[31:0] val_out;

	always #5 clk = ~clk;
	
	mux mux_0(.i_counter(counter),
              .i_in_1(val_1), //adder_0_out
			  .i_in_2(val_2),  //i_b_pc
			  .i_sel(sel),
              .out(val_out));

	initial begin
		clk <= 0;
		counter <= 0;
		val_1 <= 5;
		val_2 <= 0;
		sel = ~ sel;
		sel <= 0;
		
	end

	reg[19:0] tmp;
	always @(posedge(clk)) begin
		counter <= counter + 1;
		sel = ~ sel;
		if (counter == 2) $finish();
    end
endmodule
