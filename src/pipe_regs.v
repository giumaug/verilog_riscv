//module if_id (input clk,
//              input i_pc,
//              input i_instr,
//              output o_pc,
//              output o_instr);
//            
//	reg[31:0] pc = 0;
//	reg[31:0] instr = 0;
//	
//	assign o_pc = pc;
//	assign o_instr = o_instr;
//	
//	always @(posedge(clk))
//    begin
//		pc <= i_pc;
//		instr <= i_instr;
//    end
//endmodule

module if_id(input clk,
			 input[31:0] i_pc,
			 input[31:0] i_instr,
             output reg[31:0] pc,
             output reg[31:0] instr);
           
	always @(posedge(clk))
    begin
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
			 input [6:0] i_pcode,
			 input [2:0] i_func_3,
			 input [6:0] i_func_7		
			 output reg[31:0] pc,
			 output reg[31:0] rs_1,
			 output reg[31:0] rs_2,
			 output reg[4:0] rd_num,
			 output reg[11:0] imm_12,
			 output reg[19:0] imm_20,
			 output reg[6:0] opcode,
			 output reg[2:0] func_3,
			 output reg[6:0] func_7);
			 
	always @(posedge(clk))
    begin
		pc <= i_pc;
		rs1 <= i_rs1;
		rs2 <= i_rs_2;
		rd_num <= i_rd_num;
		imm_12 <= i_imm_12;
	  	imm_20 <= i_imm_20;
		opcode <= i_opcode;
		func_3 <= i_func_3;
		func_7 <= i_func_7;
    end
endmodule



module ex_mem(input[31:0] i_rs_1,
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
              
	always @(posedge(clk))
    begin
		rs_1 <= i_rs_1;
        rs_2 <= i_rs_2;
        rd_num <= i_rd_num;
        alu_out <= i_alu_out;
        opcode <= i_opcode;
        func_3 <= func_3;
        op_type <= i_op_type;
    end
endmodule
              
module mem_wb(input[31:0] mem_out,         
              input[4:0] rd_num,
              input[31:0] alu_out,
              input op_type,
		

		
module mkMemWb(MemWb);
		Reg#(Bit#(32)) memOut <- mkReg(0);
		Reg#(Bit#(5)) rdNum <- mkReg(0);
		Reg#(Bit#(32)) aluOut <- mkReg(0);
		Reg#(Bit#(1)) opType <- mkReg(0);
		//Only debug
		Reg#(Bit#(32)) instr <- mkReg(0);
            
            
       
