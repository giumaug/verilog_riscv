`include "constants.vh"

module cache #(parameter CACHE_SIZE =  `_CACHE_SIZE, 
               parameter CACHE_TYPE =  `_CACHE_TYPE_DATA)
             (input rst,
              input[31:0] address,
              input[31:0] i_val,
              input op_type,  // 0 read 1 write
              output reg[31:0] o_val);

	reg[31:0] mem_cell[CACHE_SIZE:0];

	always@(rst) begin
		if (rst == 1 && CACHE_TYPE == `_CACHE_TYPE_DATA) begin
		    `_DATA_CACHE_PAYLOAD
		end else if (rst == 1 && CACHE_TYPE == `_CACHE_TYPE_INST) begin
			`_INST_CACHE_PAYLOAD
		end
	end

	always@(op_type or address or i_val) begin
		if (op_type == 0) begin
			o_val <= mem_cell[address];
		end else if (op_type == 1) begin
			mem_cell[address] <= i_val;
			o_val <= 31'X; come faccio???
		end
	end
endmodule



	


