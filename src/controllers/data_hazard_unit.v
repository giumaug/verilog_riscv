module data_hazard_unit(input[6:0] i_opcode,
                        input[4:0] i_reg_num_1,
                        input[4:0] i_reg_num_2,
                        input[4:0] i_id_ex_rd_num,
                        input[4:0] i_ex_mem_rd_num,
                        output reg stall);
						 
	always @(*) begin
		case (i_opcode)
			`JALR: begin
				stall = hazard(i_reg_num_1, i_id_ex_rd_num, i_ex_mem_rd_num);
			end
			`BRANCH: begin
				stall = hazard(i_reg_num_1, i_id_ex_rd_num, i_ex_mem_rd_num) || 
					hazard(i_reg_num_2, i_id_ex_rd_num, i_ex_mem_rd_num);
			end
			`OPIMM: begin
				stall = hazard(i_reg_num_1, i_id_ex_rd_num, i_ex_mem_rd_num);
			end
			`OP: begin
				stall = hazard(i_reg_num_1, i_id_ex_rd_num, i_ex_mem_rd_num) || 
					hazard(i_reg_num_2, i_id_ex_rd_num, i_ex_mem_rd_num);
			end
			`LOAD: begin
				stall = hazard(i_reg_num_1, i_id_ex_rd_num, i_ex_mem_rd_num);
			end
			`STORE: begin
				stall = hazard(i_reg_num_1, i_id_ex_rd_num, i_ex_mem_rd_num) || 
					hazard(i_reg_num_2, i_id_ex_rd_num, i_ex_mem_rd_num);
			end
			default : stall = 0;
		endcase
	end
	
	function hazard;
		input[4:0] i_reg_num;
		input[4:0] i_id_ex_rd_num;
		input[4:0] i_ex_mem_rd_num;
		begin
			hazard = i_reg_num != 0 && (i_reg_num == i_id_ex_rd_num || i_reg_num == i_ex_mem_rd_num);
		end
	endfunction
endmodule
	
	
