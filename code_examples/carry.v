module top();
	reg clk;
	reg[31:0] counter;
	reg[3:0] in_1;
	reg[3:0] in_2;
	reg[4:0] out;
    
	and(a,in_1); 
	
	always #5 clk = ~clk;

	initial begin
		clk <= 0;
		counter <= 0;
		in_1 <= 14;
		in_2 <= 8;
		out <= 0;
	end

	always @(posedge(clk)) begin
		out <= in_1 + in_2;
		counter <= counter + 1;
	    $display("full out is %d \n", out);
		$display("partial out is %d \n", out[3:0]);
		$display("a is %d \n", a);
		if (counter == 2) $finish();
    end
endmodule
