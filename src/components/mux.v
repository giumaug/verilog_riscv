module mux(input in_1,
			   input in_2,
			   input sel,
	           output out);

	assign out = sel == 0 ? in_1 : in_2;
endmodule


