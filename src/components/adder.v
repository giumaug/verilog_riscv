`ifndef ADDER    
`define ADDER
`endif
module adder(input[31:0] i_in_1,
			 input[31:0] i_in_2,
			 output[31:0] out);

	assign out = i_in_1 + i_in_2;
endmodule
