module mux(input[31:0] i_in_1,
	       input[31:0] i_in_2,
	       input i_sel,
	       output[31:0] out);

	assign out = i_sel == 0 ? i_in_1 : i_in_2;
endmodule


