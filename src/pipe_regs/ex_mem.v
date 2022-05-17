module ex_mem(input clk,
			  input[31:0] i_rs_1,
              input[31:0] i_rs_2,
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input[6:0] i_opcode,
              input[2:0] i_func_3,
              input i_op_type,
              output reg[31:0] rs_1,
              output reg[31:0] rs_2,
              output reg[4:0] rd_num,
              output reg[31:0] alu_out,
              output reg[6:0] opcode,
              output reg[2:0] func_3,
              output reg op_type);
              
	always @(posedge(clk)) begin
		rs_1 <= i_rs_1;
        rs_2 <= i_rs_2;
        rd_num <= i_rd_num;
        alu_out <= i_alu_out;
        opcode <= i_opcode;
        func_3 <= func_3;
        op_type <= i_op_type;
    end
endmodule
