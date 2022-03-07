module top();
	reg[4:0] i_r_reg_num_1;
	reg[4:0] i_r_reg_num_2;
	reg[4:0] i_w_reg_num;
	reg[31:0] i_w_val;
	wire[31:0] r_reg_1;
	wire[31:0] r_reg_2;
	reg[31:0] counter;
	reg clk;

	register_file register_file_inst(.i_r_reg_num_1(i_r_reg_num_1),
	                                 .i_r_reg_num_2(i_r_reg_num_2),
	                                 .i_w_reg_num(i_w_reg_num),
	                                 .i_w_val(i_w_val),
	                                 .r_reg_1(r_reg_1),
	                                 .r_reg_2(r_reg_2));               
	always #5 clk = ~clk;
	                     
	initial begin
		i_r_reg_num_1 <= 0;
		i_r_reg_num_2 <= 0;
		i_w_reg_num <= 0;
		i_w_val <= 0;
		counter <= 0;
		clk <= 0;
	end
	
	always @(posedge(clk))
    begin
		i_r_reg_num_1 <= 1;
		i_r_reg_num_2 <= 2;
		i_w_reg_num <= 1;
		if (counter == 1) i_w_val <= 10;
		if (counter > 1) i_w_val <= 20;
		counter <= counter + 1;
		//$display("counter is %d", counter);
		//$display("r_reg_1 is %d", r_reg_1);
		//$display("r_reg_2 is %d", r_reg_2);
		$monitor("[$monitor] time=%0t clk=%d r_reg_1=%d  r_reg_2=%d i_w_val=%d counter=%d",$time, clk, r_reg_1, r_reg_2, i_w_val, counter);
		if (counter == 5) $finish();
    end
endmodule

