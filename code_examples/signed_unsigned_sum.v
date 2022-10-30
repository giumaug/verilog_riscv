module top();
	reg clk;
	reg[31:0] counter;
    reg[3:0] a;
    reg[3:0] b;
	reg[3:0] c;

	always #5 clk = ~clk;

	initial begin
		clk <= 0;
		counter <= 0;
		a <= 10;
        b <= 14;
		
	end

	always @(posedge(clk)) begin
	
		//out <= {{16{in[15]}},in};
		c = a + b;
		$display("a is %d ", $unsigned(a));
		$display("a signed is %d ", $signed(a));
        $display("b is %d ",$signed(b));
		
		$display("c is %d ", $signed(c));
		$display("c unsigned is %d ", $unsigned(c));
		counter <= counter + 1;
		if (counter == 0) $finish();
    end
endmodule
