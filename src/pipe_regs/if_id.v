module if_id(input rst,
			 input clk,
			 input[31:0] i_pc,
			 input[31:0] i_instr,
             output reg[31:0] pc,
             output reg[31:0] instr);
           
	always @(posedge(clk)) begin
		pc <= i_pc;
		instr <= i_instr;
    end
endmodule
