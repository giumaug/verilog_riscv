`ifndef DATA_CACHE           
`define DATA_CACHE
`include "constants.vh"
`endif

module data_cache #(parameter CACHE_SIZE =  `_DATA_CACHE_SIZE, 
			   parameter CACHE_OFFSET = `_DATA_CACHE_OFFSET)
             (input rst,
              input[31:0] address,
              input[31:0] i_val,
              input op_type,  // 0 read 1 write
              output reg[31:0] o_val);

	reg[7:0] mem_cell[CACHE_SIZE:0];

	always@(rst) begin
		`_DATA_CACHE_PAYLOAD
	end

	always@(op_type or address or i_val) begin
		if (op_type == 0) begin
			o_val <= {mem_cell[address + 3 - CACHE_OFFSET], 
			          mem_cell[address + 2 - CACHE_OFFSET], 
			          mem_cell[address + 1 - CACHE_OFFSET], 
			          mem_cell[address - CACHE_OFFSET]};
			$display("--------------address is %0h ", address);
			$display("--------------o_val is %0h ", o_val);
		end else if (op_type == 1) begin
			mem_cell[address - CACHE_OFFSET] <= i_val; //IS IT POSSIBLE TO HAVE A TMP VARIABLE?
            o_val <= 31'bx;
		end
	end
endmodule
