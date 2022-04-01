`define BOOT_ADDRESS 							'h0 //'h12c

`define _CACHE_SIZE 							'h100
`define _CACHE_TYPE 							1'bx
`define _CACHE_OFFSET 							'h0

`define _DATA_CACHE_TYPE 						1'b0
`define _DATA_CACHE_SIZE 						'h100
`define _DATA_CACHE_OFFSET	 					'h1ec

`define _DATA_CACHE_PAYLOAD 					mem_cell[0] <= 1; \
                            					mem_cell[1] <= 2; \
                            					mem_cell[2] <= 3; \
                            					mem_cell[3] <= 4; \
                            					mem_cell[4] <= 5;

`define _INST_CACHE_TYPE 						1'b1
`define _INST_CACHE_SIZE 						'h1ec
`define _INST_CACHE_OFFSET 						'h0

`define _INST_CACHE_PAYLOAD 					mem_cell[0] <= 1; \
                           						mem_cell[1] <= 2; \
                            					mem_cell[2] <= 3; \
                            					mem_cell[3] <= 4; \
                            					mem_cell[4] <= 5;



