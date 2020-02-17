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








endmodule
