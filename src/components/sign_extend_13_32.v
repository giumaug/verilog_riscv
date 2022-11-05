module sign_extend_13_32(input[12:0] i_in
						 output[31:0] out);

	always @(*) begin
		if(i_in[12] == 1) begin
			out[31:13] <= 21'b1111111111111111;
			out[12:0] <= i_in[12:0];
		end
		else if(i_in[12] == 0) begin
			out[31:13] <= 21'b0000000000000000;
			out[12:0] <= i_in[12:0];
		end
	end
endmodule
