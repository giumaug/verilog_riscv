module if_id(input rst,
			 input clk,
			 input[31:0] i_pc,
			 input[31:0] i_inst,
             output reg[31:0] pc,
             output reg[31:0] inst);
           
	always @(posedge(clk)) begin
		pc <= i_pc;
		inst <= i_inst;
    end

	always@(rst) begin
		if (rst == 1) begin
			pc <= 0;
			inst <= 0;
		end
	end
endmodule
