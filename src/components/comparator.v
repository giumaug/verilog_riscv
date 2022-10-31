module comparator (input[31:0] i_in_1,
				   input [31:0] i_in_2,
				   input sign,
				   output gt,
                   output lt,
                   output eq); 

	always @(*) begin
		if (sign == 1) begin
			gt <= ( $signed(i_in_1) > $signed(i_in_2)) ? 1'b1 : 1'b0; 
			lt <= ( $signed(i_in_1) < $signed(i_in_2)) ? 1'b1 : 1'b0; 
			eq <= ( $signed(i_in_1) == $signed(i_in_2)) ? 1'b1 : 1'b0;
		end else begin
			gt <= ( i_in_1 > i_in_2 ) ? 1'b1 : 1'b0; 
			lt <= ( i_in_1 < i_in_2 ) ? 1'b1 : 1'b0; 
			eq <= ( i_in_1 == i_in_2) ? 1'b1 : 1'b0;
		end 
    end 
endmodule
