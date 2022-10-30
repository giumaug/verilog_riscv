module sign_extend_20_32(input[19:0] i_in
						 output[31:0] out);

	always @(*) begin
		if(i_in[19] == 1) begin
			out[31:20] <= 12'b111111111111;
			out[19:0] <= i_in[19:0];
		end
		else if(i_in[19] == 0) begin
			out[31:20] <= 12'b000000000000;
			out[19:0] <= i_in[19:0];
		end
	end
endmodule
