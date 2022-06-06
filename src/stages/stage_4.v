`ifndef STAGE_4    
`define STAGE_4
`include "constants.vh"
`include "utils.vh"
`endif

module stage_4(input[31:0] i_rs_2,
              input[4:0] i_rd_num,
              input[31:0] i_alu_out,
              input[6:0] i_opcode,
              input[2:0] i_func_3,
              input i_op_type,
              input[31:0] i_val_from_mem_ctr,
              output reg[31:0] mem_out,         
              output[4:0] rd_num,
              output[31:0] alu_out,
              output op_type,
              output reg[31:0] addr_to_mem_ctr,
              output reg[31:0] val_to_mem_ctr,
              output reg op_to_mem_ctr);
              
    assign rd_num = i_rd_num;
    assign alu_out = i_alu_out;
    assign op_type = i_op_type;
            
    wire[7:0] tmp_1 = i_val_from_mem_ctr[7:0];
    wire[15:0] tmp_2 = i_val_from_mem_ctr[15:0];
	always @(*) begin
		case (i_opcode)
			`LOAD: begin
				addr_to_mem_ctr = i_alu_out;
				op_to_mem_ctr = 1'b0;
				val_to_mem_ctr = 32'b0;
				case (i_func_3)
					`LB: begin
						$display("instruction LB");
						mem_out = `SIGN_EXTEND(tmp_1, 8, 32);
					end
					`LH: begin
						$display("instruction LH");
						mem_out = `SIGN_EXTEND(tmp_2, 16, 32);
					end
					`LW: begin
						$display("instruction LW");
						mem_out = i_val_from_mem_ctr;
					end
					`LBU: begin
						$display("instruction LBU");
						mem_out = `ZERO_EXTEND(tmp_1, 8, 32);
					end
					`LHU: begin
						$display("instruction LHU");
						mem_out = `ZERO_EXTEND(tmp_2, 16, 32);
					end
				endcase
			end
			`STORE: begin
				addr_to_mem_ctr = i_alu_out;
				op_to_mem_ctr = 1'b1;
				mem_out = 32'b0;
				case (i_func_3)
					`SB: begin
						$display("instruction SB");
						val_to_mem_ctr = i_rs_2[7:0];
					end
					`SH: begin
						$display("instruction SH");
						val_to_mem_ctr = i_rs_2[15:0];
					end
					`SW: begin
						$display("instruction SW");
						val_to_mem_ctr = i_rs_2;
					end
				endcase
			end
			default : begin
				mem_out = 32'b0;
				addr_to_mem_ctr = 32'b0;
				val_to_mem_ctr = 32'b0;
				op_to_mem_ctr = 1'b0;
			end
		endcase
	end
endmodule
              
