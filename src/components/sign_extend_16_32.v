module sign_extend_16_32(input[15:0] i_in
						 output[31:0] out);

	always @(*) begin
		if(i_in[15] == 1) begin
			out[31:16] <= 16'b1111111111111111;
			out[15:0] <= i_in[15:0];
		end
		else if(i_in[15] == 0) begin
			out[31:16] <= 16'b0000000000000000;
			out[15:0] <= i_in[15:0];
		end
	end
endmodule

