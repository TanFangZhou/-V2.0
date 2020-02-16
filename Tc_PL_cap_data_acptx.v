`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 15:56:14
// Design Name:
// Module Name: Tc_PL_cap_data_acptx
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


module Tc_PL_cap_data_acptx
#(
parameter CAP0_7  = 32  ,
	        CAP0_8  = 32  ,
          CAP0_15 = 128
)(
input                     clk             ,
input                     rst             ,
input                     tacp_en         ,
output                    tacp_cmpt       ,
input      [CAP0_7 -1:0]  cap_addr        ,
output     [CAP0_8 -1:0]  cap_crc32       ,
input                     buff_empty      ,
input      [CAP0_15-1:0]  buff_dout       ,
output                    buff_dout_req   ,
output                    acp0_tx_en      ,
input                     acp0_tx_rdy     ,
output     [31:0]         acp0_tx_awaddr  ,
output     [2:0]          acp0_tx_awid    ,
output     [63:0]         acp0_tx_wdata   ,
input                     acp0_tx_wdreq
    );







endmodule
