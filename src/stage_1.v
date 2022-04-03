`ifndef STAGE_1             
`define STAGE_1
`include "constants.vh"
`endif

module stage_1(input rst,
               input clk,
			   input stall,
			   input b_taken,
			   input[31:0] instr,
               input[31:0] b_pc,
			   output reg[31:0] pc,
               output reg[31:0] if_id_pc,
               output reg[31:0] if_id_instr);
	
	always@(rst) begin
		pc <= `BOOT_ADDRESS;
	end

	always@(posedge clk) begin
		$display("---begin fetch---");
		if (stall == 0) begin
			if (b_taken == 1) begin
				pc <= b_pc;
				if_id_pc <= 0;
				if_id_instr <= 0;
			end
			else begin
				pc <= pc + 4;
				if_id_pc <= pc;
				if_id_instr <= instr;
			end
		end
		else begin
			if_id_pc <= pc;
			if_id_instr <= 0;
		end
		$display("stall is %d ", stall);
		$display("instr is %0h ", instr);
		$display("pc is %0h ", pc);
		$display("---end fetch---");
	end
endmodule
