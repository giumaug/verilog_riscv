module register_file(input i_rst,
					 input[4:0] i_reg_num_1,
                     input[4:0] i_reg_num_2,
                     input[4:0] i_w_reg_num,
                     input[31:0] i_w_val,
		             input i_op,
                     output reg[31:0] rs_1,
                     output reg[31:0] rs_2);
       
	integer i;              
	reg[31:0] registers[4:0];

	always@(i_rst) begin
		if (i_rst == 1) begin
			for (i = 0; i < 32; i++) begin
				registers[i] <= 0;
				$display("init register file !!!!!");
			end
		end
	end
	
	 
    always @(*)
    begin
		if (i_op == 0) begin
			$display("reading from register file !!!!!");
			$display("rs_1 = %0h", rs_1);
			$display("rs_2 = %0h", rs_2);
			$display("i_reg_num_1 = %0h", i_reg_num_1);
			$display("i_reg_num_2 = %0h", i_reg_num_2);
    		rs_1 <= registers[(5'd25)]; 
			rs_2 <= registers[i_reg_num_2];
			
		end
        if (i_op == 1) begin
    		//registers[i_w_reg_num] <= i_w_val;
		end
    end
endmodule
             
             
             
             
