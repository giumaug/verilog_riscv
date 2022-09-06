`ifndef ALU     
`define ALU
`include "constants.vh"
`endif

module alu(input[31:0] i_op_1,
           input[31:0] i_op_2,
           input[7:0] i_op;
           output[31:0] out);
           
    always @(*) begin
		case (i_op)
		    `ALU_ADD: begin
		        out = i_op_1 + i_op_2;
		    end
		    `ALU_SUB: begin
		        out = i_op_1 - i_op_2;
		    end
		    `ALU_AND: begin
		        out = i_op_1 & i_op_2;
		    end
		    `ALU_OR: begin
		        out = i_op_1 | i_op_2;
		    end
		    `ALU_XOR: begin
		        out = i_op_1 ^ i_op_2;
		    end
		    `ALU_SLL: begin
		        out = i_op_1 << i_op_2;
		    end
		    `ALU_SLT: begin
		        out = i_op_1 < i_op_2 ? 1'b1 : 1'b0;
		    end
		    `ALU_SRL: begin
		        out = i_op_1 >> i_op_2;
		    end
		    `ALU_SRA: begin
		        out = (i_op_1 >> i_op_2) | {i_op_1[31:31], 31'b0};
		    end
        endcase
	end
endmodule
		    
		    
		    
		
