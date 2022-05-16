module mux(input[31:0] in_1,
	       input[31:0] in_2,
	       input sel,
	       output[31:0] out);

	assign out = sel == 0 ? in_1 : in_2;
endmodule


