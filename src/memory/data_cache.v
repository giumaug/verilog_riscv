`ifndef DATA_CACHE           
`define DATA_CACHE
`include "constants.vh"
`endif

module data_cache #(parameter CACHE_SIZE =  `_DATA_CACHE_SIZE, 
			   parameter CACHE_OFFSET = `_DATA_CACHE_OFFSET)
             (input i_rst,
              input[31:0] i_address,
              input[31:0] i_val,
              input i_op_type,  // 0 read 1 write
              output reg[31:0] o_val);

	reg[7:0] mem_cell[CACHE_SIZE:0];

	always@(i_rst) begin
		if (i_rst == 1) begin
			`_DATA_CACHE_PAYLOAD
		end
	end

	always@(i_op_type or i_address or i_val) begin
		if (i_op_type == 0) begin
			o_val <= {mem_cell[i_address + 3 - CACHE_OFFSET], 
			          mem_cell[i_address + 2 - CACHE_OFFSET], 
			          mem_cell[i_address + 1 - CACHE_OFFSET], 
			          mem_cell[i_address - CACHE_OFFSET]};
		end else if (i_op_type == 1) begin
			mem_cell[i_address - CACHE_OFFSET] <= i_val[7:0];
			mem_cell[i_address + 1 - CACHE_OFFSET] <= i_val[15:8];
			mem_cell[i_address + 2 - CACHE_OFFSET] <= i_val[23:16];
			mem_cell[i_address + 3 - CACHE_OFFSET] <= i_val[31:24];
			o_val <= 31'bx;
		end
	end
endmodule
