`define BOOT_ADDRESS 							'h12c

`define _CACHE_SIZE 							'h100
`define _CACHE_TYPE 							1'bx
`define _CACHE_OFFSET 							'h0

`define _DATA_CACHE_TYPE 						1'b0
`define _DATA_CACHE_SIZE 						'h100
`define _DATA_CACHE_OFFSET	 					'h1ec

`define _DATA_CACHE_PAYLOAD 					mem_cell[0] <= 'h40; \
                     							mem_cell[1] <= 'h00; \
                     							mem_cell[2] <= 'h00; \
                     							mem_cell[3] <= 'h00; \
                     							mem_cell[4] <= 'h22; \
                     							mem_cell[5] <= 'h00; \
                     							mem_cell[6] <= 'h00; \
                     							mem_cell[7] <= 'h00; \
                     							mem_cell[8] <= 'h19; \
                     							mem_cell[9] <= 'h00; \
                     							mem_cell[10] <= 'h00; \
                     							mem_cell[11] <= 'h00; \
                     							mem_cell[12] <= 'h0c; \
                     							mem_cell[13] <= 'h00; \
                     							mem_cell[14] <= 'h00; \
                     							mem_cell[15] <= 'h00; \
                     							mem_cell[16] <= 'h16; \
                     							mem_cell[17] <= 'h00; \
                     							mem_cell[18] <= 'h00; \
                     							mem_cell[19] <= 'h00; \
                     							mem_cell[20] <= 'h0b; \
                     							mem_cell[21] <= 'h00; \
                     							mem_cell[22] <= 'h00; \
                     							mem_cell[23] <= 'h00; \
                     							mem_cell[24] <= 'h5a; \
                     							mem_cell[25] <= 'h00; \
                     							mem_cell[26] <= 'h00; \
                     							mem_cell[27] <= 'h00;   

`define _INST_CACHE_TYPE 						1'b1
`define _INST_CACHE_SIZE 						'h1ec
`define _INST_CACHE_OFFSET 						'h0

`define _INST_CACHE_PAYLOAD 					mem_cell[0]   <= 'h13; \
                     							mem_cell[1]   <= 'h01; \
                     							mem_cell[2]   <= 'h01; \
                     							mem_cell[3]   <= 'hfd; \
                     							mem_cell[4]   <= 'h23; \
                     							mem_cell[5]   <= 'h26; \
                     							mem_cell[6]   <= 'h81; \
                     							mem_cell[7]   <= 'h02; \
                     							mem_cell[8]   <= 'h13; \
                     							mem_cell[9]   <= 'h04; \
                     							mem_cell[10]  <= 'h01; \
                     							mem_cell[11]  <= 'h03; \
                     							mem_cell[12]  <= 'h23; \
                     							mem_cell[13]  <= 'h2e; \
                     							mem_cell[14]  <= 'ha4; \
                     							mem_cell[15]  <= 'hfc; \
                     							mem_cell[16]  <= 'h23; \
                     							mem_cell[17]  <= 'h2c; \
                     							mem_cell[18]  <= 'hb4; \
                     							mem_cell[19]  <= 'hfc; \
                     							mem_cell[20]  <= 'h83; \
                     							mem_cell[21]  <= 'h27; \
                     							mem_cell[22]  <= 'hc4; \
                     							mem_cell[23]  <= 'hfd; \
                     							mem_cell[24]  <= 'h83; \
                     							mem_cell[25]  <= 'ha7; \
                     							mem_cell[26]  <= 'h07; \
                     							mem_cell[27]  <= 'h00; \
                     							mem_cell[28]  <= 'h23; \
                     							mem_cell[29]  <= 'h26; \
                     							mem_cell[30]  <= 'hf4; \
                     							mem_cell[31]  <= 'hfe; \
                     							mem_cell[32]  <= 'h83; \
                     							mem_cell[33]  <= 'h27; \
                     							mem_cell[34]  <= 'h84; \
                     							mem_cell[35]  <= 'hfd; \
                     							mem_cell[36]  <= 'h03; \
                     							mem_cell[37]  <= 'ha7; \
                     							mem_cell[38]  <= 'h07; \
                     							mem_cell[39]  <= 'h00; \
                     							mem_cell[40]  <= 'h83; \
                     							mem_cell[41]  <= 'h27; \
                     							mem_cell[42]  <= 'hc4; \
                     							mem_cell[43]  <= 'hfd; \
                     							mem_cell[44]  <= 'h23; \
                     							mem_cell[45]  <= 'ha0; \
                     							mem_cell[46]  <= 'he7; \
                     							mem_cell[47]  <= 'h00; \
                     							mem_cell[48]  <= 'h83; \
                     							mem_cell[49]  <= 'h27; \
                     							mem_cell[50]  <= 'h84; \
                     							mem_cell[51]  <= 'hfd; \
                     							mem_cell[52]  <= 'h03; \
                     							mem_cell[53]  <= 'h27; \
                     							mem_cell[54]  <= 'hc4; \
                     							mem_cell[55]  <= 'hfe; \
                     							mem_cell[56]  <= 'h23; \
                     							mem_cell[57]  <= 'ha0; \
                     							mem_cell[58]  <= 'he7; \
                     							mem_cell[59]  <= 'h00; \
                     							mem_cell[60]  <= 'h13; \
                     							mem_cell[61]  <= 'h00; \
                     							mem_cell[62]  <= 'h00; \
                     							mem_cell[63]  <= 'h00; \
                     							mem_cell[64]  <= 'h03; \
                     							mem_cell[65]  <= 'h24; \
                     							mem_cell[66]  <= 'hc1; \
                     							mem_cell[67]  <= 'h02; \
                     							mem_cell[68]  <= 'h13; \
                     							mem_cell[69]  <= 'h01; \
                     							mem_cell[70]  <= 'h01; \
                     							mem_cell[71]  <= 'h03; \
                     							mem_cell[72]  <= 'h67; \
                     							mem_cell[73]  <= 'h80; \
                     							mem_cell[74]  <= 'h00; \
                     							mem_cell[75]  <= 'h00; \
                     							mem_cell[76]  <= 'h13; \
                     							mem_cell[77]  <= 'h01; \
                     							mem_cell[78]  <= 'h01; \
                     							mem_cell[79]  <= 'hfd; \
                     							mem_cell[80]  <= 'h23; \
                    	 						mem_cell[81]  <= 'h26; \
                     							mem_cell[82]  <= 'h11; \
                     							mem_cell[83]  <= 'h02; \
                     							mem_cell[84]  <= 'h23; \
                     							mem_cell[85]  <= 'h24; \
                     							mem_cell[86]  <= 'h81; \
                     							mem_cell[87]  <= 'h02; \
                     							mem_cell[88]  <= 'h13; \
                     							mem_cell[89]  <= 'h04; \
                     							mem_cell[90]  <= 'h01; \
                     							mem_cell[91]  <= 'h03; \
                     							mem_cell[92]  <= 'h23; \
                     							mem_cell[93]  <= 'h2e; \
                     							mem_cell[94]  <= 'ha4; \
                     							mem_cell[95]  <= 'hfc; \
                     							mem_cell[96]  <= 'h23; \
                     							mem_cell[97]  <= 'h2c; \
                     							mem_cell[98]  <= 'hb4; \
                     							mem_cell[99]  <= 'hfc; \
                     							mem_cell[100] <= 'h23; \
                     							mem_cell[101] <= 'h26; \
                     							mem_cell[102] <= 'h04; \
                     							mem_cell[103] <= 'hfe; \
                     							mem_cell[104] <= 'h6f; \
                     							mem_cell[105] <= 'h00; \
                     							mem_cell[106] <= 'hc0; \
                     							mem_cell[107] <= 'h09; \
                    	 						mem_cell[108] <= 'h23; \
                     							mem_cell[109] <= 'h24; \
                     							mem_cell[110] <= 'h04; \
                     							mem_cell[111] <= 'hfe; \
                     							mem_cell[112] <= 'h6f; \
                     							mem_cell[113] <= 'h00; \
                     							mem_cell[114] <= 'h00; \
                     							mem_cell[115] <= 'h07; \
                     							mem_cell[116] <= 'h83; \
                     							mem_cell[117] <= 'h27; \
                     							mem_cell[118] <= 'h84; \
                     							mem_cell[119] <= 'hfe; \
                     							mem_cell[120] <= 'h93; \
                     							mem_cell[121] <= 'h97; \
                     							mem_cell[122] <= 'h27; \
                     							mem_cell[123] <= 'h00; \
                     							mem_cell[124] <= 'h03; \
                     							mem_cell[125] <= 'h27; \
                     							mem_cell[126] <= 'hc4; \
                     							mem_cell[127] <= 'hfd; \
                     							mem_cell[128] <= 'hb3; \
                     							mem_cell[129] <= 'h07; \
                     							mem_cell[130] <= 'hf7; \
                     							mem_cell[131] <= 'h00; \
                     							mem_cell[132] <= 'h03; \
                     							mem_cell[133] <= 'ha7; \
                     							mem_cell[134] <= 'h07; \
                     							mem_cell[135] <= 'h00; \
                     							mem_cell[136] <= 'h83; \
                     							mem_cell[137] <= 'h27; \
                     							mem_cell[138] <= 'h84; \
                     							mem_cell[139] <= 'hfe; \
                     							mem_cell[140] <= 'h93; \
                     							mem_cell[141] <= 'h87; \
                     							mem_cell[142] <= 'h17; \
                     							mem_cell[143] <= 'h00; \
                     							mem_cell[144] <= 'h93; \
                     							mem_cell[145] <= 'h97; \
                     							mem_cell[146] <= 'h27; \
                     							mem_cell[147] <= 'h00; \
                     							mem_cell[148] <= 'h83; \
                     							mem_cell[149] <= 'h26; \
                     							mem_cell[150] <= 'hc4; \
                     							mem_cell[151] <= 'hfd; \
                     							mem_cell[152] <= 'hb3; \
                     							mem_cell[153] <= 'h87; \
                     							mem_cell[154] <= 'hf6; \
                     							mem_cell[155] <= 'h00; \
                     							mem_cell[156] <= 'h83; \
                     							mem_cell[157] <= 'ha7; \
                     							mem_cell[158] <= 'h07; \
                     							mem_cell[159] <= 'h00; \
                     							mem_cell[160] <= 'h63; \
                     							mem_cell[161] <= 'hda; \
                     							mem_cell[162] <= 'he7; \
                     							mem_cell[163] <= 'h02; \
                     							mem_cell[164] <= 'h83; \
                    	 						mem_cell[165] <= 'h27; \
                     							mem_cell[166] <= 'h84; \
                     							mem_cell[167] <= 'hfe; \
                     							mem_cell[168] <= 'h93; \
                    	 						mem_cell[169] <= 'h97; \
                     							mem_cell[170] <= 'h27; \
                     							mem_cell[171] <= 'h00; \
                     							mem_cell[172] <= 'h03; \
                     							mem_cell[173] <= 'h27; \
												mem_cell[174] <= 'hc4; \
												mem_cell[175] <= 'hfd; \
												mem_cell[176] <= 'hb3; \
												mem_cell[177] <= 'h06; \
												mem_cell[178] <= 'hf7; \
												mem_cell[179] <= 'h00; \
												mem_cell[180] <= 'h83; \
												mem_cell[181] <= 'h27; \
												mem_cell[182] <= 'h84; \
												mem_cell[183] <= 'hfe; \
												mem_cell[184] <= 'h93; \
												mem_cell[185] <= 'h87; \
												mem_cell[186] <= 'h17; \
												mem_cell[187] <= 'h00; \
												mem_cell[188] <= 'h93; \
												mem_cell[189] <= 'h97; \
												mem_cell[190] <= 'h27; \
												mem_cell[191] <= 'h00; \
												mem_cell[192] <= 'h03; \
												mem_cell[193] <= 'h27; \
												mem_cell[194] <= 'hc4; \
												mem_cell[195] <= 'hfd; \
												mem_cell[196] <= 'hb3; \
												mem_cell[197] <= 'h07; \
												mem_cell[198] <= 'hf7; \
												mem_cell[199] <= 'h00; \
												mem_cell[200] <= 'h93; \
												mem_cell[201] <= 'h85; \
												mem_cell[202] <= 'h07; \
												mem_cell[203] <= 'h00; \
												mem_cell[204] <= 'h13; \
												mem_cell[205] <= 'h85; \
												mem_cell[206] <= 'h06; \
												mem_cell[207] <= 'h00; \
												mem_cell[208] <= 'hef; \
												mem_cell[209] <= 'hf0; \
												mem_cell[210] <= 'h1f; \
												mem_cell[211] <= 'hf3; \
												mem_cell[212] <= 'h83; \
												mem_cell[213] <= 'h27; \
												mem_cell[214] <= 'h84; \
												mem_cell[215] <= 'hfe; \
												mem_cell[216] <= 'h93; \
												mem_cell[217] <= 'h87; \
												mem_cell[218] <= 'h17; \
												mem_cell[219] <= 'h00; \
												mem_cell[220] <= 'h23; \
												mem_cell[221] <= 'h24; \
												mem_cell[222] <= 'hf4; \
												mem_cell[223] <= 'hfe; \
												mem_cell[224] <= 'h03; \
												mem_cell[225] <= 'h27; \
												mem_cell[226] <= 'h84; \
												mem_cell[227] <= 'hfd; \
												mem_cell[228] <= 'h83; \
												mem_cell[229] <= 'h27; \
												mem_cell[230] <= 'hc4; \
												mem_cell[231] <= 'hfe; \
												mem_cell[232] <= 'hb3; \
												mem_cell[233] <= 'h07; \
												mem_cell[234] <= 'hf7; \
												mem_cell[235] <= 'h40; \
												mem_cell[236] <= 'h93; \
												mem_cell[237] <= 'h87; \
												mem_cell[238] <= 'hf7; \
												mem_cell[239] <= 'hff; \
												mem_cell[240] <= 'h03; \
											 	mem_cell[241] <= 'h27; \
												mem_cell[242] <= 'h84; \
												mem_cell[243] <= 'hfe; \
												mem_cell[244] <= 'he3; \
												mem_cell[245] <= 'h40; \
												mem_cell[246] <= 'hf7; \
												mem_cell[247] <= 'hf8; \
											 	mem_cell[248] <= 'h83; \
												mem_cell[249] <= 'h27; \
												mem_cell[250] <= 'hc4; \
												mem_cell[251] <= 'hfe; \
												mem_cell[252] <= 'h93; \
												mem_cell[253] <= 'h87; \
												mem_cell[254] <= 'h17; \
												mem_cell[255] <= 'h00; \
												mem_cell[256] <= 'h23; \
												mem_cell[257] <= 'h26; \
												mem_cell[258] <= 'hf4; \
												mem_cell[259] <= 'hfe; \
												mem_cell[260] <= 'h83; \
												mem_cell[261] <= 'h27; \
												mem_cell[262] <= 'h84; \
												mem_cell[263] <= 'hfd; \
												mem_cell[264] <= 'h93; \
												mem_cell[265] <= 'h87; \
												mem_cell[266] <= 'hf7; \
												mem_cell[267] <= 'hff; \
												mem_cell[268] <= 'h03; \
												mem_cell[269] <= 'h27; \
												mem_cell[270] <= 'hc4; \
												mem_cell[271] <= 'hfe; \
												mem_cell[272] <= 'he3; \
												mem_cell[273] <= 'h4e; \
												mem_cell[274] <= 'hf7; \
												mem_cell[275] <= 'hf4; \
												mem_cell[276] <= 'h13; \
												mem_cell[277] <= 'h00; \
												mem_cell[278] <= 'h00; \
												mem_cell[279] <= 'h00; \
												mem_cell[280] <= 'h13; \
												mem_cell[281] <= 'h00; \
												mem_cell[282] <= 'h00; \
												mem_cell[283] <= 'h00; \
												mem_cell[284] <= 'h83; \
												mem_cell[285] <= 'h20; \
												mem_cell[286] <= 'hc1; \
												mem_cell[287] <= 'h02; \
												mem_cell[288] <= 'h03; \
												mem_cell[289] <= 'h24; \
												mem_cell[290] <= 'h81; \
												mem_cell[291] <= 'h02; \
												mem_cell[292] <= 'h13; \
												mem_cell[293] <= 'h01; \
												mem_cell[294] <= 'h01; \
												mem_cell[295] <= 'h03; \
												mem_cell[296] <= 'h67; \
												mem_cell[297] <= 'h80; \
												mem_cell[298] <= 'h00; \
												mem_cell[299] <= 'h00; \
												mem_cell[300] <= 'h13; \
												mem_cell[301] <= 'h01; \
												mem_cell[302] <= 'h01; \
												mem_cell[303] <= 'hfe; \
												mem_cell[304] <= 'h23; \
												mem_cell[305] <= 'h2e; \
												mem_cell[306] <= 'h11; \
												mem_cell[307] <= 'h00; \
												mem_cell[308] <= 'h23; \
												mem_cell[309] <= 'h2c; \
												mem_cell[310] <= 'h81; \
												mem_cell[311] <= 'h00; \
												mem_cell[312] <= 'h13; \
												mem_cell[313] <= 'h04; \
												mem_cell[314] <= 'h01; \
												mem_cell[315] <= 'h02; \
												mem_cell[316] <= 'hb7; \
												mem_cell[317] <= 'h07; \
												mem_cell[318] <= 'h01; \
												mem_cell[319] <= 'h00; \
												mem_cell[320] <= 'h93; \
												mem_cell[321] <= 'h87; \
												mem_cell[322] <= 'hf7; \
												mem_cell[323] <= 'hff; \
												mem_cell[324] <= 'h23; \
												mem_cell[325] <= 'h26; \
												mem_cell[326] <= 'hf4; \
												mem_cell[327] <= 'hfe; \
												mem_cell[328] <= 'h93; \
												mem_cell[329] <= 'h07; \
												mem_cell[330] <= 'h70; \
												mem_cell[331] <= 'h00; \
												mem_cell[332] <= 'h23; \
												mem_cell[333] <= 'h24; \
												mem_cell[334] <= 'hf4; \
												mem_cell[335] <= 'hfe; \
												mem_cell[336] <= 'h83; \
												mem_cell[337] <= 'h25; \
												mem_cell[338] <= 'h84; \
												mem_cell[339] <= 'hfe; \
												mem_cell[340] <= 'h13; \
												mem_cell[341] <= 'h05; \
												mem_cell[342] <= 'hc0; \
												mem_cell[343] <= 'h1e; \
												mem_cell[344] <= 'hef; \
												mem_cell[345] <= 'hf0; \
												mem_cell[346] <= 'h5f; \
												mem_cell[347] <= 'hef; \
												mem_cell[348] <= 'h93; \
												mem_cell[349] <= 'h07; \
												mem_cell[350] <= 'hc0; \
												mem_cell[351] <= 'h1e; \
												mem_cell[352] <= 'h03; \
												mem_cell[353] <= 'ha7; \
												mem_cell[354] <= 'h07; \
												mem_cell[355] <= 'h00; \
												mem_cell[356] <= 'h93; \
												mem_cell[357] <= 'h07; \
												mem_cell[358] <= 'hb0; \
												mem_cell[359] <= 'h00; \
												mem_cell[360] <= 'h63; \
												mem_cell[361] <= 'h1a; \
												mem_cell[362] <= 'hf7; \
												mem_cell[363] <= 'h06; \
												mem_cell[364] <= 'h93; \
												mem_cell[365] <= 'h07; \
												mem_cell[366] <= 'hc0; \
												mem_cell[367] <= 'h1e; \
												mem_cell[368] <= 'h03; \
												mem_cell[369] <= 'ha7; \
												mem_cell[370] <= 'h47; \
												mem_cell[371] <= 'h00; \
												mem_cell[372] <= 'h93; \
												mem_cell[373] <= 'h07; \
												mem_cell[374] <= 'hc0; \
												mem_cell[375] <= 'h00; \
												mem_cell[376] <= 'h63; \
												mem_cell[377] <= 'h12; \
												mem_cell[378] <= 'hf7; \
												mem_cell[379] <= 'h06; \
												mem_cell[380] <= 'h93; \
												mem_cell[381] <= 'h07; \
												mem_cell[382] <= 'hc0; \
												mem_cell[383] <= 'h1e; \
												mem_cell[384] <= 'h03; \
												mem_cell[385] <= 'ha7; \
												mem_cell[386] <= 'h87; \
												mem_cell[387] <= 'h00; \
												mem_cell[388] <= 'h93; \
												mem_cell[389] <= 'h07; \
												mem_cell[390] <= 'h60; \
												mem_cell[391] <= 'h01; \
												mem_cell[392] <= 'h63; \
												mem_cell[393] <= 'h1a; \
												mem_cell[394] <= 'hf7; \
												mem_cell[395] <= 'h04; \
												mem_cell[396] <= 'h93; \
												mem_cell[397] <= 'h07; \
												mem_cell[398] <= 'hc0; \
												mem_cell[399] <= 'h1e; \
												mem_cell[400] <= 'h03; \
												mem_cell[401] <= 'ha7; \
												mem_cell[402] <= 'hc7; \
												mem_cell[403] <= 'h00; \
												mem_cell[404] <= 'h93; \
												mem_cell[405] <= 'h07; \
												mem_cell[406] <= 'h90; \
												mem_cell[407] <= 'h01; \
												mem_cell[408] <= 'h63; \
												mem_cell[409] <= 'h12; \
												mem_cell[410] <= 'hf7; \
												mem_cell[411] <= 'h04; \
												mem_cell[412] <= 'h93; \
												mem_cell[413] <= 'h07; \
												mem_cell[414] <= 'hc0; \
												mem_cell[415] <= 'h1e; \
												mem_cell[416] <= 'h03; \
												mem_cell[417] <= 'ha7; \
												mem_cell[418] <= 'h07; \
												mem_cell[419] <= 'h01; \
												mem_cell[420] <= 'h93; \
												mem_cell[421] <= 'h07; \
												mem_cell[422] <= 'h20; \
												mem_cell[423] <= 'h02; \
												mem_cell[424] <= 'h63; \
												mem_cell[425] <= 'h1a; \
												mem_cell[426] <= 'hf7; \
												mem_cell[427] <= 'h02; \
												mem_cell[428] <= 'h93; \
												mem_cell[429] <= 'h07; \
												mem_cell[430] <= 'hc0; \
												mem_cell[431] <= 'h1e; \
												mem_cell[432] <= 'h03; \
												mem_cell[433] <= 'ha7; \
												mem_cell[434] <= 'h47; \
												mem_cell[435] <= 'h01; \
												mem_cell[436] <= 'h93; \
												mem_cell[437] <= 'h07; \
												mem_cell[438] <= 'h00; \
												mem_cell[439] <= 'h04; \
												mem_cell[440] <= 'h63; \
												mem_cell[441] <= 'h12; \
												mem_cell[442] <= 'hf7; \
												mem_cell[443] <= 'h02; \
												mem_cell[444] <= 'h93; \
												mem_cell[445] <= 'h07; \
												mem_cell[446] <= 'hc0; \
												mem_cell[447] <= 'h1e; \
												mem_cell[448] <= 'h03; \
												mem_cell[449] <= 'ha7; \
												mem_cell[450] <= 'h87; \
												mem_cell[451] <= 'h01; \
												mem_cell[452] <= 'h93; \
												mem_cell[453] <= 'h07; \
												mem_cell[454] <= 'ha0; \
												mem_cell[455] <= 'h05; \
												mem_cell[456] <= 'h63; \
												mem_cell[457] <= 'h1a; \
												mem_cell[458] <= 'hf7; \
												mem_cell[459] <= 'h00; \
												mem_cell[460] <= 'h83; \
												mem_cell[461] <= 'h27; \
												mem_cell[462] <= 'hc4; \
												mem_cell[463] <= 'hfe; \
												mem_cell[464] <= 'h13; \
												mem_cell[465] <= 'h07; \
												mem_cell[466] <= 'hf0; \
												mem_cell[467] <= 'h00; \
												mem_cell[468] <= 'h23; \
												mem_cell[469] <= 'ha0; \
												mem_cell[470] <= 'he7; \
												mem_cell[471] <= 'h00; \
												mem_cell[472] <= 'h6f; \
												mem_cell[473] <= 'h00; \
												mem_cell[474] <= 'h00; \
												mem_cell[475] <= 'h01; \
												mem_cell[476] <= 'h83; \
												mem_cell[477] <= 'h27; \
												mem_cell[478] <= 'hc4; \
												mem_cell[479] <= 'hfe; \
												mem_cell[480] <= 'h13; \
												mem_cell[481] <= 'h07; \
												mem_cell[482] <= 'ha0; \
												mem_cell[483] <= 'h00; \
												mem_cell[484] <= 'h23; \
												mem_cell[485] <= 'ha0; \
												mem_cell[486] <= 'he7; \
												mem_cell[487] <= 'h00; \
												mem_cell[488] <= 'h6f; \
												mem_cell[489] <= 'h00; \
												mem_cell[490] <= 'h00; \
												mem_cell[491] <= 'h00;

//Instruction constants
`define BRANCH 									7'b1100011
`define OPIMM   								7'b0010011
`define OP      								7'b0110011
`define LOAD    								7'b0000011
`define STORE   								7'b0100011
`define JAL 									7'b1101111 
`define JALR   									7'b1100111
`define BEQ     								3'b000  
`define BNE     								3'b001
`define BLT   									3'b100
`define BLTU    								3'b110 
`define BGE     								3'b101
`define BGEU    								3'b111
`define ADDI    								3'b000
`define SLTI    								3'b010
`define SLTIU   								3'b011
`define ANDI    								3'b111  
`define ORI     								3'b110    
`define XORI    								3'b100  
`define SLLI    								3'b001   
`define SRLISRAI								3'b101
`define SRLI        							7'b0000000
`define SRAI        							7'b0100000  	
`define ADDSUB  								3'b000   
`define ADD         							7'b0000000
`define SUB     								7'b0100000
`define SLT     								3'b010 
`define SLTU    								3'b011   
`define AND     								3'b111   
`define OR      								3'b110    
`define XOR     								3'b100
`define SLL     								3'b001  
`define SRLSRA  								3'b101
`define SRL  	    							7'b0000000 
`define SRA         							7'b0100000 	
`define LUI    									7'b0110111
`define AUIPC   								7'b0010111
`define LB      								3'b000     
`define LH      								3'b001     
`define LW      								3'b010     
`define LBU     								3'b100  
`define LHU     								3'b101    
`define SB      								3'b000 
`define SH      								3'b001
`define SW      								3'b010



