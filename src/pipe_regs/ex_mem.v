module ex_mem(input i_clk,
			  input i_rst,
			  //input[31:0] i_rs_1,
              input[31:0] i_rs_2,
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input[6:0] i_opcode,
              input[2:0] i_func_3,
              input i_op_type,
              //output reg[31:0] rs_1,
              output reg[31:0] rs_2,
              output reg[4:0] rd_num,
              output reg[31:0] alu_out,
              output reg[6:0] opcode,
              output reg[2:0] func_3,
              output reg op_type);
              
	always @(posedge(i_clk)) begin
        rs_2 <= i_rs_2;
        rd_num <= i_rd_num;
        alu_out <= i_alu_out;
        opcode <= i_opcode;
        func_3 <= func_3;
        op_type <= i_op_type;
    end
    
    always@(i_rst) begin
		if (i_rst == 1) begin
			rs_2 <= 0;
			rd_num <= 0;
			alu_out <= 0;
			opcode <= 0;
			func_3 <= 0;
			op_type <= 0;
		end
	end
endmodule
