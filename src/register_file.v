module register_file(input[4:0] i_r_reg_num_1,
                     input[4:0] i_r_reg_num_2,
                     input[4:0] i_w_reg_num,
                     input[31:0] i_w_val,
                     output reg[31:0] r_reg_1,
                     output reg[31:0] r_reg_2);
                     
	reg[31:0] registers[3:0];
	
//	assign r_reg_1 = registers[i_r_reg_num_1]; 
//	assign r_reg_2 = registers[i_r_reg_num_2]; 
	 
	always @(registers[i_r_reg_num_1] or registers[i_r_reg_num_2])
    begin
    	r_reg_1 <= registers[i_r_reg_num_1]; 
		r_reg_2 <= registers[i_r_reg_num_2]; 
    end
    
    always @(i_w_reg_num or i_w_val)
    begin
    	registers[i_w_reg_num] <= i_w_val;
    end
endmodule
             
             
             
             
