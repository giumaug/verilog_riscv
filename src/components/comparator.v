
module comparator(input sign i_sign,
               input[31:0] a,
               input[31:0] b,
			   output reg[31:0] gt,
			   output reg[31:0] eq,
			   output reg[31:0] lt);
	
	wire[33:0] n;
	wire cn;
	wire z;
	
	assign cn = ~a + b;
	assign c = cn[33];
	assign n = cn[32:0];
	assign z = and(~n);
	
	assign gt = ~a | z;
	assign eq = z;
	assign lt = c;
	
endmodule	
