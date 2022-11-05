module sign_extend_12_32(input[11:0] i_in
						 output[31:0] out);

	always @(*) begin
		if(i_in[11] == 1) begin
			out[31:12] <= 20'b1111111111111111;
			out[11:0] <= i_in[11:0];
		end
		else if(i_in[11] == 0) begin
			out[31:12] <= 20'b0000000000000000;
			out[11:0] <= i_in[11:0];
		end
	end
endmodule

