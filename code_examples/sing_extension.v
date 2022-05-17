module top();
	reg clk;
	reg[31:0] counter;
	reg[19:0] in;
	reg[31:0] out;
	reg[19:0] xxx;
	reg[19:0] yyy;

	always #5 clk = ~clk;

	initial begin
		clk <= 0;
		counter <= 0;
		in <= -'sd5;
		out <= 0;
		xxx <= 10;
		yyy <= 8;
		
	end

	always @(posedge(clk)) begin
		if ($unsigned(in) < $unsigned(yyy)) $display("in minore");
		else $display("in maggiore");
		//out <= {{16{in[15]}},in};
		out <= 32'd1 + {{11{in[19]}}, {in, 1'b0}};
		$display("in is %d ", in);
		//$display("out is %d ", $signed(out));
		$display("out is %d ", out);
		counter <= counter + 1;
		if (counter == 2) $finish();
    end
endmodule
