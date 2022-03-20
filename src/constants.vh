`define BOOT_ADDRESS 'h12c

`define _CACHE_SIZE 1'b1
`define _CACHE_TYPE 1'bx

`define _DATA_CACHE_TYPE 1'b0
`define _DATA_CACHE_SIZE 'h100
`define _DATA_CACHE_PAYLOAD mem_cell[0] <= 1; \
                            mem_cell[0] <= 1; \
                            mem_cell[0] <= 1;
`define _INST_CACHE_TYPE 1'b1
`define _INST_CACHE_SIZE 'h1ec
`define _INST_CACHE_PAYLOAD mem_cell[0] <= 1; \
                            mem_cell[0] <= 1; \
                            mem_cell[0] <= 1;



