`ifndef MEM_CACHE           
`define MEM_CACHE
`include "constants.vh"
`endif

module inst_cache #(parameter CACHE_SIZE =  `_INST_CACHE_SIZE, 
			   parameter CACHE_OFFSET = `_INST_CACHE_OFFSET)
             (input i_rst,
              input[31:0] i_address,
              input[31:0] i_val,
              input i_op_type,  // 0 read 1 write
              output reg[31:0] o_val);

	reg[7:0] mem_cell[CACHE_SIZE:0];

	always@(i_rst) begin
		if (i_rst == 1) begin
			`_INST_CACHE_PAYLOAD
		end
	end

	always@(i_op_type or i_address or i_val) begin
		if (i_op_type == 0) begin
			o_val <= {mem_cell[i_address + 3 - CACHE_OFFSET], 
			          mem_cell[i_address + 2 - CACHE_OFFSET], 
			          mem_cell[i_address + 1 - CACHE_OFFSET], 
			          mem_cell[i_address - CACHE_OFFSET]};
			//$display("--------------i_address is %0h ", address);
			//$display("--------------o_val is %0h ", o_val);
		end else if (i_op_type == 1) begin
			mem_cell[i_address - CACHE_OFFSET] <= i_val; //IS IT POSSIBLE TO HAVE A TMP VARIABLE?
            o_val <= 31'bx;
		end
	end
endmodule
