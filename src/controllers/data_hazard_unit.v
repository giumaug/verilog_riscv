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
		
		//$strobe("-------stall unit----------");
		//$strobe("i_opcode= %d",i_opcode);
        //$strobe("i_reg_num_1= %d",i_reg_num_1);
        //$strobe("i_reg_num_2= %d",i_reg_num_2);
        //$strobe("i_id_ex_rd_num= %d",i_id_ex_rd_num);
        //$strobe("i_ex_mem_rd_num= %d",i_ex_mem_rd_num);
		//$strobe("stall is %d", stall);
		//$strobe("time is %0t",$time);
		//$strobe("--------------------------");
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
	
	
