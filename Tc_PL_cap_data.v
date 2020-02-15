`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 17:00:58
// Design Name:
// Module Name: Tc_PL_cap_data
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


module Tc_PL_cap_data
#(
parameter CAP0_3  = 3   ,
	        CAP0_4  = 8   ,
	        CAP0_5  = 3   ,
	        CAP0_6  = 14  ,
	        CAP0_7  = 32  ,
	        CAP0_8  = 32  ,
	        CAP0_9  = 32  ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32  ,
          ADC0_1  = 56
)(
input                     clk125             ,
input                     rst                ,
input                     data_en            ,
output                    data_cmpt          ,
output     [CAP0_3 -1:0]  cap_phase_number   ,
output     [CAP0_6 -1:0]  cap_points         ,
output     [CAP0_7 -1:0]  cap_addr           ,
input      [CAP0_8 -1:0]  cap_crc32          ,
output     [CAP0_10-1:0]  cap_gain0_cycle    ,
output     [CAP0_10-1:0]  cap_gain1_cycle    ,
output     [CAP0_10-1:0]  cap_gain2_cycle    ,
output     [CAP0_10-1:0]  cap_gain3_cycle    ,
output     [CAP0_11-1:0]  cap_gain0_Lddel    ,
output     [CAP0_11-1:0]  cap_gain1_Lddel    ,
output     [CAP0_11-1:0]  cap_gain2_Lddel    ,
output     [CAP0_11-1:0]  cap_gain3_Lddel    ,
output                    Gc_cap_trig        ,
input                     Gc_capr_rdy        ,
input      [ADC0_1-1:0]   Gc_merge_data      ,
input                     Gc_mereg_datv      ,
output                    Gc_mereg_datr      ,
output                    acp0_tx_en         ,
input                     acp0_tx_rdy        ,
output     [31:0]         acp0_tx_awaddr     ,
output     [2:0]          acp0_tx_awid       ,
output     [63:0]         acp0_tx_wdata      ,
input                     acp0_tx_wdreq
    );




endmodule
