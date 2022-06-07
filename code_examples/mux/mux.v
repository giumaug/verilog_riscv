module mux(input[31:0] i_in_1,
	       input[31:0] i_in_2,
	       input i_sel,
	       output[31:0] out);

	assign out = (i_sel == 0 ? i_in_1 : i_in_2);
	//assign out = 32'b111;
	
//    always @(*) begin
//		$display("i_in_1 = %0h", i_in_1);
//		$display("i_in_2 = %0h", i_in_2);
//		$display("i_sel = %0h", i_sel);
//		$display("out = %0h", out);
//    end
   
   		initial begin
		    $monitor("i_in_1 = %0h \n i_in_2 = %0h \n i_sel = %0h \n out = %0h \n ",i_in_1, i_in_2, i_sel, out);
		end
endmodule


