`define ABS(VAL, LEN) ((VAL[LEN - 1] == 0) ? VAL : ( ~ (VAL - 1)))
`define SIGN_EXTEND(VAL, CUR_LEN, NEW_LEN) {{(NEW_LEN - CUR_LEN){VAL[CUR_LEN - 1]}}, VAL}
`define ZERO_EXTEND(VAL, CUR_LEN, NEW_LEN) {{(NEW_LEN - CUR_LEN){1'b0}}, VAL}

//((in[('sd20)-('sd1)])==('sd0))?(in):(~((in)-('sd1)))

module top();
	reg clk;
	reg[31:0] counter;
	reg[19:0] in;
	reg[31:0] out_1;
	reg[31:0] out_2;
	reg[31:0] out_3;
	reg[19:0] xxx;
	reg yyy;

	always #5 clk = ~clk;

	initial begin
		clk <= 0;
		counter <= 0;
		in <= -'sd5;
		out_1 <= 0;
		out_2 <= 0;
		out_3 <= {(32-0){1'b0}};
		
	end

	reg[19:0] tmp;
	always @(posedge(clk)) begin
		tmp = `ABS(in, 20);
		out_1 = `SIGN_EXTEND(in, 20, 32);
		//out_2 <= `ZERO_EXTEND(`ABS(in, 20), 20, 32);
		out_2 = `ZERO_EXTEND(tmp, 20, 32);
		tmp = 7;
		out_3 = `ABS(out_1, 32);
		$display("out_1 = %d \n", out_1);
		$display("out_2 = %d \n", out_2);
		$display("out_3 = %d \n", out_3);
		$display("tmp = %d \n", tmp);
		counter <= counter + 1;
		if (counter == 2) $finish();
    end
endmodule


