module register_file(input i_rst,
					 input[4:0] i_reg_num_1,
                     input[4:0] i_reg_num_2,
                     input[4:0] i_reg_num,
                     input[31:0] i_val,
		             input i_op,
                     output reg[31:0] rs_1,
                     output reg[31:0] rs_2);
       
	integer i;              
	reg[31:0] registers[4:0];

	always@(i_rst) begin
		if (i_rst == 1) begin
			for (i = 0; i < 32; i++) begin
				registers[i] <= 0;
			end
		end
	end
	
	 
    always @(op)
    begin
		if (op == 0) begin
			$display("000 %d", op);
    		rs_1 <= registers[i_reg_num_1]; 
			rs_2 <= registers[i_reg_num_2];
		end
        if (op == 1) begin
			$display("111 %d",op);
    		registers[i_reg_num] <= i_val;
		end
    end
endmodule
             
             
             
             
