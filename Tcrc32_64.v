`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/17 16:04:52
// Design Name:
// Module Name: Tcrc32_64
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////


module Tcrc32_64
#(
parameter DATA_BITS = 64,
parameter CRC_BITS  = 32
)(
input                       clk           ,
input                       rst           ,
input      [DATA_BITS-1:0]  data          ,
input                       data_valid    ,
output     [CRC_BITS-1:0]   crc_out
    );

reg [CRC_BITS-1:0] crc = 0;
wire [DATA_BITS-1:0] d;
assign d = data;
wire [CRC_BITS-1:0] c;
assign c = crc;

always@(posedge clk)
	if(rst)begin
		crc <= ~0;
	end else begin
		if(data_valid)begin
			crc[0]  <= c[0]^c[10]^c[11]^c[13]^c[16]^c[17]^c[18]^c[19]^c[2]^c[21]^c[22]^c[27]^c[28]^c[29]^c[5]^d[0]^d[10]^d[11]^d[13]^d[16]^d[17]^d[18]^d[19]^d[2]^d[21]^d[22]^d[27]^d[28]^d[29]^d[33]^d[34]^d[36]^d[37]^d[38]^d[39]^d[41]^d[43]^d[46]^d[47]^d[48]^d[5]^d[52]^d[55]^d[56]^d[57]^d[58]^d[59]^d[60]                                                              ;
			crc[1]  <= c[0]^c[1]^c[11]^c[12]^c[14]^c[17]^c[18]^c[19]^c[20]^c[22]^c[23]^c[28]^c[29]^c[3]^c[30]^c[6]^d[0]^d[1]^d[11]^d[12]^d[14]^d[17]^d[18]^d[19]^d[20]^d[22]^d[23]^d[28]^d[29]^d[3]^d[30]^d[34]^d[35]^d[37]^d[38]^d[39]^d[40]^d[42]^d[44]^d[47]^d[48]^d[49]^d[53]^d[56]^d[57]^d[58]^d[59]^d[6]^d[60]^d[61]                                                    ;
			crc[2]  <= c[0]^c[1]^c[12]^c[13]^c[15]^c[18]^c[19]^c[2]^c[20]^c[21]^c[23]^c[24]^c[29]^c[30]^c[31]^c[4]^c[7]^d[0]^d[1]^d[12]^d[13]^d[15]^d[18]^d[19]^d[2]^d[20]^d[21]^d[23]^d[24]^d[29]^d[30]^d[31]^d[35]^d[36]^d[38]^d[39]^d[4]^d[40]^d[41]^d[43]^d[45]^d[48]^d[49]^d[50]^d[54]^d[57]^d[58]^d[59]^d[60]^d[61]^d[62]^d[7]                                          ;
			crc[3]  <= c[1]^c[13]^c[14]^c[16]^c[19]^c[2]^c[20]^c[21]^c[22]^c[24]^c[25]^c[3]^c[30]^c[31]^c[5]^c[8]^d[1]^d[13]^d[14]^d[16]^d[19]^d[2]^d[20]^d[21]^d[22]^d[24]^d[25]^d[3]^d[30]^d[31]^d[32]^d[36]^d[37]^d[39]^d[40]^d[41]^d[42]^d[44]^d[46]^d[49]^d[5]^d[50]^d[51]^d[55]^d[58]^d[59]^d[60]^d[61]^d[62]^d[63]^d[8]                                                ;
			crc[4]  <= c[10]^c[11]^c[13]^c[14]^c[15]^c[16]^c[18]^c[19]^c[20]^c[23]^c[25]^c[26]^c[27]^c[28]^c[29]^c[3]^c[31]^c[4]^c[5]^c[6]^c[9]^d[10]^d[11]^d[13]^d[14]^d[15]^d[16]^d[18]^d[19]^d[20]^d[23]^d[25]^d[26]^d[27]^d[28]^d[29]^d[3]^d[31]^d[32]^d[34]^d[36]^d[39]^d[4]^d[40]^d[42]^d[45]^d[46]^d[48]^d[5]^d[50]^d[51]^d[55]^d[57]^d[58]^d[6]^d[61]^d[62]^d[63]^d[9];
			crc[5]  <= c[0]^c[12]^c[13]^c[14]^c[15]^c[18]^c[2]^c[20]^c[22]^c[24]^c[26]^c[30]^c[4]^c[6]^c[7]^d[0]^d[12]^d[13]^d[14]^d[15]^d[18]^d[2]^d[20]^d[22]^d[24]^d[26]^d[30]^d[32]^d[34]^d[35]^d[36]^d[38]^d[39]^d[4]^d[40]^d[48]^d[49]^d[51]^d[55]^d[57]^d[6]^d[60]^d[62]^d[63]^d[7]                                                                                    ;
			crc[6]  <= c[1]^c[10]^c[11]^c[14]^c[15]^c[17]^c[18]^c[2]^c[22]^c[23]^c[25]^c[28]^c[29]^c[3]^c[31]^c[7]^c[8]^d[1]^d[10]^d[11]^d[14]^d[15]^d[17]^d[18]^d[2]^d[22]^d[23]^d[25]^d[28]^d[29]^d[3]^d[31]^d[34]^d[35]^d[38]^d[40]^d[43]^d[46]^d[47]^d[48]^d[49]^d[50]^d[55]^d[57]^d[59]^d[60]^d[61]^d[63]^d[7]^d[8]                                                      ;
			crc[7]  <= c[10]^c[12]^c[13]^c[15]^c[17]^c[21]^c[22]^c[23]^c[24]^c[26]^c[27]^c[28]^c[3]^c[30]^c[4]^c[5]^c[8]^c[9]^d[10]^d[12]^d[13]^d[15]^d[17]^d[21]^d[22]^d[23]^d[24]^d[26]^d[27]^d[28]^d[3]^d[30]^d[32]^d[33]^d[34]^d[35]^d[37]^d[38]^d[4]^d[43]^d[44]^d[46]^d[49]^d[5]^d[50]^d[51]^d[52]^d[55]^d[57]^d[59]^d[61]^d[62]^d[8]^d[9]                              ;
			crc[8]  <= c[0]^c[10]^c[11]^c[13]^c[14]^c[16]^c[18]^c[22]^c[23]^c[24]^c[25]^c[27]^c[28]^c[29]^c[31]^c[4]^c[5]^c[6]^c[9]^d[0]^d[10]^d[11]^d[13]^d[14]^d[16]^d[18]^d[22]^d[23]^d[24]^d[25]^d[27]^d[28]^d[29]^d[31]^d[33]^d[34]^d[35]^d[36]^d[38]^d[39]^d[4]^d[44]^d[45]^d[47]^d[5]^d[50]^d[51]^d[52]^d[53]^d[56]^d[58]^d[6]^d[60]^d[62]^d[63]^d[9]                  ;
			crc[9]  <= c[1]^c[12]^c[13]^c[14]^c[15]^c[16]^c[18]^c[2]^c[21]^c[22]^c[23]^c[24]^c[25]^c[26]^c[27]^c[30]^c[6]^c[7]^d[1]^d[12]^d[13]^d[14]^d[15]^d[16]^d[18]^d[2]^d[21]^d[22]^d[23]^d[24]^d[25]^d[26]^d[27]^d[30]^d[32]^d[33]^d[35]^d[38]^d[40]^d[41]^d[43]^d[45]^d[47]^d[51]^d[53]^d[54]^d[55]^d[56]^d[58]^d[6]^d[60]^d[61]^d[63]^d[7]                            ;
			crc[10] <= c[0]^c[10]^c[11]^c[14]^c[15]^c[18]^c[21]^c[23]^c[24]^c[25]^c[26]^c[29]^c[3]^c[31]^c[5]^c[7]^c[8]^d[0]^d[10]^d[11]^d[14]^d[15]^d[18]^d[21]^d[23]^d[24]^d[25]^d[26]^d[29]^d[3]^d[31]^d[37]^d[38]^d[42]^d[43]^d[44]^d[47]^d[5]^d[54]^d[58]^d[60]^d[61]^d[62]^d[7]^d[8]                                                                                    ;
			crc[11] <= c[0]^c[1]^c[11]^c[12]^c[15]^c[16]^c[19]^c[22]^c[24]^c[25]^c[26]^c[27]^c[30]^c[4]^c[6]^c[8]^c[9]^d[0]^d[1]^d[11]^d[12]^d[15]^d[16]^d[19]^d[22]^d[24]^d[25]^d[26]^d[27]^d[30]^d[32]^d[38]^d[39]^d[4]^d[43]^d[44]^d[45]^d[48]^d[55]^d[59]^d[6]^d[61]^d[62]^d[63]^d[8]^d[9]                                                                                ;
			crc[12] <= c[0]^c[1]^c[11]^c[12]^c[18]^c[19]^c[20]^c[21]^c[22]^c[23]^c[25]^c[26]^c[29]^c[31]^c[7]^c[9]^d[0]^d[1]^d[11]^d[12]^d[18]^d[19]^d[20]^d[21]^d[22]^d[23]^d[25]^d[26]^d[29]^d[31]^d[34]^d[36]^d[37]^d[38]^d[40]^d[41]^d[43]^d[44]^d[45]^d[47]^d[48]^d[49]^d[52]^d[55]^d[57]^d[58]^d[59]^d[62]^d[63]^d[7]^d[9]                                              ;
			crc[13] <= c[0]^c[1]^c[11]^c[12]^c[16]^c[17]^c[18]^c[20]^c[23]^c[24]^c[26]^c[28]^c[29]^c[30]^c[5]^c[8]^d[0]^d[1]^d[11]^d[12]^d[16]^d[17]^d[18]^d[20]^d[23]^d[24]^d[26]^d[28]^d[29]^d[30]^d[32]^d[33]^d[34]^d[35]^d[36]^d[42]^d[43]^d[44]^d[45]^d[47]^d[49]^d[5]^d[50]^d[52]^d[53]^d[55]^d[57]^d[63]^d[8]                                                          ;
			crc[14] <= c[0]^c[1]^c[10]^c[11]^c[12]^c[16]^c[22]^c[24]^c[25]^c[28]^c[30]^c[31]^c[5]^c[6]^c[9]^d[0]^d[1]^d[10]^d[11]^d[12]^d[16]^d[22]^d[24]^d[25]^d[28]^d[30]^d[31]^d[35]^d[38]^d[39]^d[41]^d[44]^d[45]^d[47]^d[5]^d[50]^d[51]^d[52]^d[53]^d[54]^d[55]^d[57]^d[59]^d[6]^d[60]^d[9]                                                                              ;
			crc[15] <= c[1]^c[10]^c[11]^c[12]^c[13]^c[17]^c[2]^c[23]^c[25]^c[26]^c[29]^c[31]^c[6]^c[7]^d[1]^d[10]^d[11]^d[12]^d[13]^d[17]^d[2]^d[23]^d[25]^d[26]^d[29]^d[31]^d[32]^d[36]^d[39]^d[40]^d[42]^d[45]^d[46]^d[48]^d[51]^d[52]^d[53]^d[54]^d[55]^d[56]^d[58]^d[6]^d[60]^d[61]^d[7]                                                                                  ;
			crc[16] <= c[11]^c[12]^c[13]^c[14]^c[18]^c[2]^c[24]^c[26]^c[27]^c[3]^c[30]^c[7]^c[8]^d[11]^d[12]^d[13]^d[14]^d[18]^d[2]^d[24]^d[26]^d[27]^d[3]^d[30]^d[32]^d[33]^d[37]^d[40]^d[41]^d[43]^d[46]^d[47]^d[49]^d[52]^d[53]^d[54]^d[55]^d[56]^d[57]^d[59]^d[61]^d[62]^d[7]^d[8]                                                                                        ;
			crc[17] <= c[12]^c[13]^c[14]^c[15]^c[19]^c[25]^c[27]^c[28]^c[3]^c[31]^c[4]^c[8]^c[9]^d[12]^d[13]^d[14]^d[15]^d[19]^d[25]^d[27]^d[28]^d[3]^d[31]^d[33]^d[34]^d[38]^d[4]^d[41]^d[42]^d[44]^d[47]^d[48]^d[50]^d[53]^d[54]^d[55]^d[56]^d[57]^d[58]^d[60]^d[62]^d[63]^d[8]^d[9]                                                                                        ;
			crc[18] <= c[0]^c[11]^c[14]^c[15]^c[17]^c[18]^c[19]^c[2]^c[20]^c[21]^c[22]^c[26]^c[27]^c[4]^c[9]^d[0]^d[11]^d[14]^d[15]^d[17]^d[18]^d[19]^d[2]^d[20]^d[21]^d[22]^d[26]^d[27]^d[32]^d[33]^d[35]^d[36]^d[37]^d[38]^d[4]^d[41]^d[42]^d[45]^d[46]^d[47]^d[49]^d[51]^d[52]^d[54]^d[60]^d[61]^d[63]^d[9]                                                                ;
			crc[19] <= c[0]^c[1]^c[11]^c[12]^c[13]^c[15]^c[17]^c[2]^c[20]^c[23]^c[29]^c[3]^d[0]^d[1]^d[11]^d[12]^d[13]^d[15]^d[17]^d[2]^d[20]^d[23]^d[29]^d[3]^d[41]^d[42]^d[50]^d[53]^d[56]^d[57]^d[58]^d[59]^d[60]^d[61]^d[62]                                                                                                                                              ;
			crc[20] <= c[0]^c[1]^c[12]^c[13]^c[14]^c[16]^c[18]^c[2]^c[21]^c[24]^c[3]^c[30]^c[4]^d[0]^d[1]^d[12]^d[13]^d[14]^d[16]^d[18]^d[2]^d[21]^d[24]^d[3]^d[30]^d[4]^d[42]^d[43]^d[51]^d[54]^d[57]^d[58]^d[59]^d[60]^d[61]^d[62]^d[63]                                                                                                                                    ;
			crc[21] <= c[0]^c[1]^c[10]^c[11]^c[14]^c[15]^c[16]^c[18]^c[21]^c[25]^c[27]^c[28]^c[29]^c[3]^c[31]^c[4]^d[0]^d[1]^d[10]^d[11]^d[14]^d[15]^d[16]^d[18]^d[21]^d[25]^d[27]^d[28]^d[29]^d[3]^d[31]^d[33]^d[34]^d[36]^d[37]^d[38]^d[39]^d[4]^d[41]^d[44]^d[46]^d[47]^d[48]^d[56]^d[57]^d[61]^d[62]^d[63]                                                                ;
			crc[22] <= c[1]^c[10]^c[12]^c[13]^c[15]^c[18]^c[21]^c[26]^c[27]^c[30]^c[4]^d[1]^d[10]^d[12]^d[13]^d[15]^d[18]^d[21]^d[26]^d[27]^d[30]^d[32]^d[33]^d[35]^d[36]^d[4]^d[40]^d[41]^d[42]^d[43]^d[45]^d[46]^d[49]^d[52]^d[55]^d[56]^d[59]^d[60]^d[62]^d[63]                                                                                                            ;
			crc[23] <= c[10]^c[14]^c[17]^c[18]^c[21]^c[29]^c[31]^d[10]^d[14]^d[17]^d[18]^d[21]^d[29]^d[31]^d[38]^d[39]^d[42]^d[44]^d[48]^d[50]^d[52]^d[53]^d[55]^d[58]^d[59]^d[61]^d[63]                                                                                                                                                                                      ;
			crc[24] <= c[0]^c[10]^c[13]^c[15]^c[16]^c[17]^c[2]^c[21]^c[27]^c[28]^c[29]^c[30]^c[5]^d[0]^d[10]^d[13]^d[15]^d[16]^d[17]^d[2]^d[21]^d[27]^d[28]^d[29]^d[30]^d[32]^d[33]^d[34]^d[36]^d[37]^d[38]^d[40]^d[41]^d[45]^d[46]^d[47]^d[48]^d[49]^d[5]^d[51]^d[52]^d[53]^d[54]^d[55]^d[57]^d[58]^d[62]                                                                    ;
			crc[25] <= c[1]^c[11]^c[14]^c[16]^c[17]^c[18]^c[22]^c[28]^c[29]^c[3]^c[30]^c[31]^c[6]^d[1]^d[11]^d[14]^d[16]^d[17]^d[18]^d[22]^d[28]^d[29]^d[3]^d[30]^d[31]^d[33]^d[34]^d[35]^d[37]^d[38]^d[39]^d[41]^d[42]^d[46]^d[47]^d[48]^d[49]^d[50]^d[52]^d[53]^d[54]^d[55]^d[56]^d[58]^d[59]^d[6]^d[63]                                                                    ;
			crc[26] <= c[10]^c[11]^c[12]^c[13]^c[15]^c[16]^c[21]^c[22]^c[23]^c[27]^c[28]^c[30]^c[31]^c[4]^c[5]^c[7]^d[10]^d[11]^d[12]^d[13]^d[15]^d[16]^d[21]^d[22]^d[23]^d[27]^d[28]^d[30]^d[31]^d[32]^d[33]^d[35]^d[37]^d[4]^d[40]^d[41]^d[42]^d[46]^d[49]^d[5]^d[50]^d[51]^d[52]^d[53]^d[54]^d[58]^d[7]                                                                    ;
			crc[27] <= c[0]^c[11]^c[12]^c[13]^c[14]^c[16]^c[17]^c[22]^c[23]^c[24]^c[28]^c[29]^c[31]^c[5]^c[6]^c[8]^d[0]^d[11]^d[12]^d[13]^d[14]^d[16]^d[17]^d[22]^d[23]^d[24]^d[28]^d[29]^d[31]^d[32]^d[33]^d[34]^d[36]^d[38]^d[41]^d[42]^d[43]^d[47]^d[5]^d[50]^d[51]^d[52]^d[53]^d[54]^d[55]^d[59]^d[6]^d[8]                                                                ;
			crc[28] <= c[1]^c[12]^c[13]^c[14]^c[15]^c[17]^c[18]^c[23]^c[24]^c[25]^c[29]^c[30]^c[6]^c[7]^c[9]^d[1]^d[12]^d[13]^d[14]^d[15]^d[17]^d[18]^d[23]^d[24]^d[25]^d[29]^d[30]^d[32]^d[33]^d[34]^d[35]^d[37]^d[39]^d[42]^d[43]^d[44]^d[48]^d[51]^d[52]^d[53]^d[54]^d[55]^d[56]^d[6]^d[60]^d[7]^d[9]                                                                      ;
			crc[29] <= c[10]^c[13]^c[14]^c[15]^c[16]^c[18]^c[19]^c[2]^c[24]^c[25]^c[26]^c[30]^c[31]^c[7]^c[8]^d[10]^d[13]^d[14]^d[15]^d[16]^d[18]^d[19]^d[2]^d[24]^d[25]^d[26]^d[30]^d[31]^d[33]^d[34]^d[35]^d[36]^d[38]^d[40]^d[43]^d[44]^d[45]^d[49]^d[52]^d[53]^d[54]^d[55]^d[56]^d[57]^d[61]^d[7]^d[8]                                                                    ;
			crc[30] <= c[0]^c[11]^c[14]^c[15]^c[16]^c[17]^c[19]^c[20]^c[25]^c[26]^c[27]^c[3]^c[31]^c[8]^c[9]^d[0]^d[11]^d[14]^d[15]^d[16]^d[17]^d[19]^d[20]^d[25]^d[26]^d[27]^d[3]^d[31]^d[32]^d[34]^d[35]^d[36]^d[37]^d[39]^d[41]^d[44]^d[45]^d[46]^d[50]^d[53]^d[54]^d[55]^d[56]^d[57]^d[58]^d[62]^d[8]^d[9]                                                                ;
			crc[31] <= c[1]^c[10]^c[12]^c[15]^c[16]^c[17]^c[18]^c[20]^c[21]^c[26]^c[27]^c[28]^c[4]^c[9]^d[1]^d[10]^d[12]^d[15]^d[16]^d[17]^d[18]^d[20]^d[21]^d[26]^d[27]^d[28]^d[32]^d[33]^d[35]^d[36]^d[37]^d[38]^d[4]^d[40]^d[42]^d[45]^d[46]^d[47]^d[51]^d[54]^d[55]^d[56]^d[57]^d[58]^d[59]^d[63]^d[9]                                                                    ;
		end
	end

assign crc_out = crc;

endmodule
