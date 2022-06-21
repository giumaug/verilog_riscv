module mux(input[31:0] i_counter,
           input[31:0] i_in_1,
	       input[31:0] i_in_2,
	       input i_sel,
	       output[31:0] out);

	assign out = (i_sel == 0 ? i_in_1 : i_in_2);
	//assign out = 32'b111;
	
    //always @(*) begin
    always @(i_counter, i_in_1, i_in_2, i_sel) begin
		$strobe("i_counter = %0h", i_counter);
		$strobe("i_in_1 = %0h", i_in_1);
		$strobe("i_in_2 = %0h", i_in_2);
		$strobe("i_sel = %0h", i_sel);
		$strobe("out = %0h", out);
        $strobe("time is %0t",$time);
    end
   
   		initial begin
		    //$monitor("i_in_1 = %0h \n i_in_2 = %0h \n i_sel = %0h \n out = %0h \n ",i_in_1, i_in_2, i_sel, out);
		end
endmodule


