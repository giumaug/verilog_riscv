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
		out <= 0;
	end

	always @(posedge(clk)) begin
		decode_inst(counter);
		$strobe("pre-counter is %0t",counter);
	    counter <= counter + 1;
	    out <= counter;
	    $strobe("time is %0t",$time);
	    $strobe("counter is %0t",counter);
	    $strobe("out is %0t",out);
	    //decode_inst(counter);
		if (counter == 2) $finish();
    end
    
    task decode_inst(input[31:0] xxx);
		begin
			 $strobe("task_time is %0t",$time);
			 $strobe("task_counter is %0t",xxx);
		end
	endtask  
endmodule
