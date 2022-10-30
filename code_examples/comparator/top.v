`include "comparator.v"

module top();
	reg clk;
	reg[31:0] op_1;
	reg[31:0] op_2;
	reg[31:0] counter;
	wire gt;
    wire eq;
    wire lt;

	wire[32:0] cn;
    wire c;
    wire[31:0] n;
    wire z;

	wire[31:0] pippo;
    wire[31:0] pippo_1;

	assign pippo = 32'b11111111111111111111111111111010;
	assign pippo_1 = ~pippo;

	always #5 clk = ~clk;

	comparator comparator_0(.i_op_1(op_1),
                            .i_op_2(op_2),
                            .gt(gt),
                            .eq(eq),
                            .lt(lt),
                            .cn(cn),
                            .c(c),
                            .n(n),
                            .z(z));
	
	initial begin
		clk <= 0;
		counter <= 0;
		op_1 <= 5;
		op_2 <= 0;
	end

	always @(posedge(clk)) begin
		counter <= counter + 1;
		if (counter == 3) $finish();
		$display("op_1 = %b \n", op_1);
		$display("op_2 = %b \n", op_2);
		$display("gt = %b \n", gt);
		$display("eq = %b \n", eq);
		$display("lt = %b \n", lt);

		$display("cn = %b \n", cn);
		$display("c = %b \n", c);
		$display("n = %b \n", n);
		$display("z = %b \n", z);
		$display("pippo = %b \n", pippo);
		$display("pippo_1 = %b \n", pippo_1);

    end
endmodule
