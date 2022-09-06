`ifndef COND_GT    
`define COND_GT
`endif

module cond_gt_32(input[31:0] i_op_1,
           input[31:0] i_op_2,
           output[31:0] out);

    out = i_op_1 > i_op_2 ? 8'd1 : 8'd0;
endmodule
