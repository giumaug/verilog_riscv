module if_id(input i_rst,
			 input i_clk,
			 input[31:0] i_pc,
			 input[31:0] i_inst,
             output reg[31:0] pc,
             output reg[31:0] inst);
           
	always @(posedge(i_clk)) begin
		pc <= i_pc;
		inst <= i_inst;
    end

	always@(i_rst) begin
		if (i_rst == 1) begin
			pc <= 0;
			inst <= 0;
		end
	end
endmodule
