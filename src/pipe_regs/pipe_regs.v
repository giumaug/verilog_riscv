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

module id_ex(input clk,
			 input [31:0] i_pc,
			 input [31:0] i_rs_1,
			 input [31:0] i_rs_2,
			 input [4:0]  i_rd_num,
			 input [11:0] i_imm_12,
			 input [19:0] i_imm_20,
			 input [6:0] i_opcode,
			 input [2:0] i_func_3,
			 input [6:0] i_func_7,		
			 output reg[31:0] pc,
			 output reg[31:0] rs_1,
			 output reg[31:0] rs_2,
			 output reg[4:0] rd_num,
			 output reg[11:0] imm_12,
			 output reg[19:0] imm_20,
			 output reg[6:0] opcode,
			 output reg[2:0] func_3,
			 output reg[6:0] func_7);
			 
	always @(posedge(clk)) begin
		pc <= i_pc;
		rs_1 <= i_rs_1;
		rs_2 <= i_rs_2;
		rd_num <= i_rd_num;
		imm_12 <= i_imm_12;
	  	imm_20 <= i_imm_20;
		opcode <= i_opcode;
		func_3 <= i_func_3;
		func_7 <= i_func_7;
    end
endmodule

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
              
module mem_wb(input clk,
			  input[31:0] i_mem_out,         
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input i_op_type,
              output reg[31:0] mem_out,         
              output reg[4:0] rd_num,
              output reg[31:0] alu_out,
              output reg op_type);
              
	always @(posedge(clk)) begin
		mem_out <= i_mem_out;     
        rd_num <= i_rd_num;
        alu_out <= i_alu_out;
        op_type <= i_op_type;
    end
endmodule
		

		

            
            
       
