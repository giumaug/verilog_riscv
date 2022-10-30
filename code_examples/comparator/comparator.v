
module comparator(input[31:0] i_op_1,
               input[31:0] i_op_2,
			   output gt,
			   output eq,
			   output lt,
               output[32:0] cn,
               output c,
               output [31:0] n,
               output z);
	
	//wire[31:0] n;
	//wire[32:0] cn;
	//wire c;
	//wire z;
	wire[31:0] pippo_neg;
	wire[31:0] n_neg;
	
    //assign pippo = 32'b11111111111111111111111111111010;
	assign pippo = 32'b11111111111101111110111111111111;
	assign n_neg = ~pippo;
	assign cn = ~i_op_1 + i_op_2;
	assign c = cn[32];
	assign n = cn[31:0];
	and(z, pippo);
	
	assign gt = ~i_op_1 | z;
	assign eq = z;
	assign lt = c;
	
endmodule	
