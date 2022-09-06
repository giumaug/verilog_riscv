`ifndef COND_EQ     
`define COND_EQ
`endif

module cond_eq_32(input[31:0] i_op_1,
           input[31:0] i_op_2,
           output out);

    out = i_op_1 == i_op_2 ? 1 : 0;            
endmodule
