`include "constants.vh"

module cache #(parameter CACHE_SIZE = _CACHE_SIZE, 
               parameter CACHE_PAYLOAD_SIZE = _CACHE_PAYLOAD_SIZE, 
               parameter [_CACHE_PAYLOAD_SIZE -1 : 0] CACHE_PAYLOAD = _CACHE_PAYLOAD)
//module cache #(parameter SIZE = 10, parameter CACHE_PAYLOAD_SIZE = 10, parameter[15:0] CACHE_PAYLOAD = {8'd4, 8'd4} )  
             (input rst,
              input[31:0] address,
              input[31:0] i_val,
              input op_type,
              output[31:0] o_val);

	reg[31:0] cll[4:0];

	always@(rst) begin
		if (rst == 1) begin
			for (i = 0; i < CACHE_PAYLOAD_SIZE; i++) begin
				cll[i] <= 0;
			end
		end
	end
endmodule



	


