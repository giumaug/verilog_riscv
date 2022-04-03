`ifndef MEMORY_CONTROLLER           
`define MEMORY_CONTROLLER 
`include "constants.vh"
`include "inst_cache.v"
`include "data_cache.v"
`endif

module memory_controller(input rst,
                         input[31:0] address_0,
                         input[31:0] i_val_0,
                         input op_type_0,
					     input[31:0] address_1,
                         input[31:0] i_val_1,
                         input op_type_1,
                         output[31:0] o_val_0,
						 output[31:0] o_val_1);

	//data cache
	data_cache #(.CACHE_SIZE(`_DATA_CACHE_SIZE), 
            .CACHE_OFFSET(`_DATA_CACHE_OFFSET))
            data_cache_0(.rst(rst),
                         .address(address_0),
                         .i_val(i_val_0),
                         .op_type(op_type_0),
					     .o_val(o_val_0));

    //instruction cache
	inst_cache #(.CACHE_SIZE(`_INST_CACHE_SIZE), 
			.CACHE_OFFSET(`_INST_CACHE_OFFSET))
            inst_cache_0(.rst(rst),
                         .address(address_1),
                         .i_val(i_val_1),
                         .op_type(op_type_1),
					     .o_val(o_val_1));

endmodule     
