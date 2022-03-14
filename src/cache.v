`include "constants.vh"

module cache #(parameter CACHE_SIZE =  `_CACHE_SIZE, 
               parameter CACHE_PAYLOAD_SIZE =  `_CACHE_PAYLOAD_SIZE, 
               parameter CACHE_PAYLOAD =  `_CACHE_PAYLOAD)
             (input rst,
              input[31:0] address,
              input[31:0] i_val,
              input op_type,
              output[31:0] o_val);

    integer i;
	reg[31:0] cll[4:0];

	always@(rst) begin
		if (rst == 1) begin
			for (i = 1; i < CACHE_PAYLOAD_SIZE; i++) begin
				cll[i] <= CACHE_PAYLOAD[(32*i) -1  +: i];
			end
		end
	end
endmodule



	


