module top();
	reg clk;
	reg[31:0] pc;
	reg[31:0] instr;
	
	if_id_2 if_id_2_inst(.clk(clk),
	                     .i_pc(pc),
	                     .i_instr(instr));
	               
	always #5 clk = ~clk;
	                     
	initial begin
		pc <= 0;
		instr <= 0;
		clk <= 0;
	end
	
	always @(posedge(clk))
    begin
		pc <= pc + 1;
		instr <= instr + 1;
		if (pc == 100) $finish();
    end
endmodule

