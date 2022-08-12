`ifndef REGISTER_FILE         
`define REGISTER_FILE
`include "constants.vh"
`endif

module register_file(input i_rst,
					 input[4:0] i_reg_num_1,
                     input[4:0] i_reg_num_2,
                     input[4:0] i_w_reg_num,
                     input[31:0] i_w_val,
		             input i_op,
                     output reg[31:0] rs_1,
                     output reg[31:0] rs_2);
       
	integer i;              
	reg[31:0] registers[31:0];

	always@(i_rst) begin
		registers[0] <= 0;
		registers[1] <= 0;
		registers[2] <= `STACK_ADDRESS;
		if (i_rst == 1) begin
			for (i = 3; i < 32; i++) begin
				registers[i] <= 0;
			end
		end
	end
	
    always @(*)
    begin
		if (i_op == 0) begin
			rs_1 <= registers[i_reg_num_1]; 
			rs_2 <= registers[i_reg_num_2];
		end
        if (i_op == 1) begin
    		registers[i_w_reg_num] <= i_w_val;
    		if (i_w_reg_num == 8)
			begin
				$strobe("i_w_reg_num = %0h", i_w_reg_num);
				$strobe("alert on 8 = %0h", i_w_val);
				$strobe("time is %0t",$time);
			end
		end
    end
endmodule
             
             
             
             
