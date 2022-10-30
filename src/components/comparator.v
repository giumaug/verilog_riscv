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

-----------
module comparator (input[7:0]  In1,
       input [7:0] In2,
       output Gt,
       output Lt,
       output Eq); 

    always @(*) begin 
     Gt <= ( In1 > In2 )? 1'b1 : 1'b0; 
     Lt <= ( In1 < In2 )? 1'b1 : 1'b0; 
     Eq <= ( In1 == In2)? 1'b1 : 1'b0; 
    end 
    endmodule
