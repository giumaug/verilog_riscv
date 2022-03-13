module register_file(input rst,
					 input[4:0] i_r_reg_num_1,
                     input[4:0] i_r_reg_num_2,
                     input[4:0] i_w_reg_num,
                     input[31:0] i_w_val,
		             input op,
                     output reg[31:0] r_reg_1,
                     output reg[31:0] r_reg_2);
       
	integer i;              
	reg[31:0] registers[4:0];

	always@(rst) begin
		if (rst == 1) begin
			for (i = 0; i < 32; i++) begin
				registers[i] <= 0;
			end
		end
	end
	
	 
    always @(op)
    begin
		if (op == 0) begin
			$display("000 %d", op);
    		r_reg_1 <= registers[i_r_reg_num_1]; 
			r_reg_2 <= registers[i_r_reg_num_2];
		end
        if (op == 1) begin
			$display("111 %d",op);
    		registers[i_w_reg_num] <= i_w_val;
		end
    end
endmodule
             
             
             
             
