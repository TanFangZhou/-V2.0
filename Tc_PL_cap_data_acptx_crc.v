`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/17 10:08:51
// Design Name:
// Module Name: Tc_PL_cap_data_acptx_crc
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


module Tc_PL_cap_data_acptx_crc
#(
parameter CAP0_8  = 32
)(
input                     clk             ,
input                     rst             ,
input                     crc_en          ,
output     [31:0]         crc32           ,
input      [63:0]         crc_data        ,
input                     crc_data_valid
    );

reg[31:0] t_crc32=0;

wire[31:0] crc_out;
Tcrc32_64
Tcrc32_64_ins0
(
.clk         (clk         ),
.rst         (!crc_en     ),
.data        (crc_data        ),
.data_valid  (crc_data_valid  ),
.crc_out     (crc_out     )
    );

always@(posedge clk)begin
	if(rst)begin
		t_crc32 <= 0;
	end else begin
		if(crc_en)begin
			t_crc32 <= crc_out;
		end
	end
end

assign crc32 = t_crc32;

endmodule
