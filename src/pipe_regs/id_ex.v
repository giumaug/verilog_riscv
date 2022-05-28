module id_ex(input i_rst,
             input i_clk,
			 input [31:0] i_pc,
			 input [31:0] i_rs_1,
			 input [31:0] i_rs_2,
			 input [4:0] i_rd_num,
			 input[11:0] i_imm_12_i,
             input[19:0] i_imm_20,
             input[11:0] i_imm_12_b,
             input[19:0] i_imm_20_i,
			 input[11:0] i_imm_12_s,
			 input [6:0] i_opcode,
			 input [2:0] i_func_3,
			 input [6:0] i_func_7,		
			 output reg[31:0] pc,
			 output reg[31:0] rs_1,
			 output reg[31:0] rs_2,
			 output reg[4:0] rd_num,
			 output reg[11:0] imm_12_i,
             output reg[19:0] imm_20,
             output reg[11:0] imm_12_b,
             output reg[19:0] imm_20_i,
			 output reg[11:0] imm_12_s,
			 output reg[6:0] opcode,
			 output reg[2:0] func_3,
			 output reg[6:0] func_7);
			 
	always @(posedge(i_clk)) begin
		pc <= i_pc;
		rs_1 <= i_rs_1;
		rs_2 <= i_rs_2;
		rd_num <= i_rd_num;
		imm_12_i <= i_imm_12_i;
        imm_20 <= i_imm_20;
        imm_12_b <= i_imm_12_b;
		opcode <= i_opcode;
		func_3 <= i_func_3;
		func_7 <= i_func_7;
    end

	always@(i_rst) begin
		if (i_rst == 1) begin
			pc <= 0;
			rs_1 <= 0;
			rs_2 <= 0;
			rd_num <= 0;
			imm_12_i <= 0;
            imm_20 <= 0;
            imm_12_b <= 0;
			opcode <= 0;
			func_3 <= 0;
			func_7 <= 0;
		end
	end
endmodule
