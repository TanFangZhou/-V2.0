`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 12:20:59
// Design Name: 
// Module Name: Tc_PL_cap
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


module Tc_PL_cap
#(
parameter TOP0_0	= 3    ,
          TOP0_1	= 7    ,
          TOP0_2	= 2    ,
          TOP0_3	= 12   ,
          TOP0_4	= 4    ,
          ADC0_0  = 14   ,
          ADC0_1  = 56   ,
          LDD0_0  = 32   ,
          CAP0_0  = 4    ,
          CAP0_1  = 2    ,
          AGP0_0	= 3    ,
          AGP0_1	= 2    ,
          AGP0_2	= 1    ,
          AGP0_3	= 3    ,
	        AGP0_4	= 3    ,
	        AGP0_5	= 32   ,
	        AGP0_6	= 8    ,
	        AGP0_7	= 3    ,
	        AGP0_8	= 14   ,
	        AGP0_9	= 32   ,
	        AGP0_10	= 32   ,
	        AGP0_11	= 32   ,
	        AGP0_12	= 18   ,
	        AGP0_13	= 32   ,
	        AGP0_14	= 32   ,
	        AGP0_15	= 6    ,
	        AGP0_16	= 4    ,
	        AGP0_17	= 4    ,
	        AGP0_18	= 5    ,
	        AGP0_19	= 3    ,
	        AGP0_20	= 32   ,
	        AGP0_21	= 6    ,
	        AGP0_22	= 2    ,
	        AGP0_23	= 9    ,
	        AGP0_24	= 8    ,
	        AGP0_25	= 8    ,
	        AGP0_26	= 8    ,
	        AGP0_27	= 16   ,
	        AGP0_28	= 15   ,
	        AGP0_29	= 4    ,
	        AGP0_30	= 2    ,
	        AGP0_31	= 1    ,
	        AGP0_32	= 2    ,
	        AGP0_33	= 1    ,
	        AGP0_34	= 2    ,
	        AGP0_35	= 16
)(
input                     clk125             ,
input                     rst                ,
input      [ADC0_1-1:0]   Gc_merge_data      ,
input                     Gc_mereg_datv      ,
output                    Gc_mereg_datr      ,
output                    Gc_cap_trig        ,
input                     Gc_capr_rdy        ,
output                    Gc_cap_mode        ,
output     [TOP0_0-1:0]   Gc_cap_wdis        ,
output     [LDD0_0-1:0]   Gc_cap_plus        ,
output     [AGP0_1 -1:0]  gp0_c0	           ,
input                     gp0_c1	           ,
input      [AGP0_2 -1:0]  gp0_c2	           ,
input      [AGP0_3 -1:0]  gp0_c3	           ,
input      [AGP0_4 -1:0]  gp0_c4	           ,
input      [AGP0_5 -1:0]  gp0_c5	           ,
input      [AGP0_6 -1:0]  gp0_c6	           ,
input      [AGP0_7 -1:0]  gp0_c7	           ,
input      [AGP0_8 -1:0]  gp0_c8	           ,
input      [AGP0_9 -1:0]  gp0_c9	           ,
output     [AGP0_10-1:0]  gp0_c10	           ,
output     [AGP0_11-1:0]  gp0_c11	           ,
input      [AGP0_12-1:0]  gp0_c12	           ,
input      [AGP0_12-1:0]  gp0_c13	           ,
input      [AGP0_12-1:0]  gp0_c14	           ,
input      [AGP0_12-1:0]  gp0_c15	           ,
input      [AGP0_13-1:0]  gp0_c16	           ,
input      [AGP0_13-1:0]  gp0_c17	           ,
input      [AGP0_13-1:0]  gp0_c18	           ,
input      [AGP0_13-1:0]  gp0_c19	           ,
input      [AGP0_14-1:0]  gp0_c20	           ,
input      [AGP0_14-1:0]  gp0_c21	           ,
input      [AGP0_14-1:0]  gp0_c22	           ,
input      [AGP0_14-1:0]  gp0_c23	           ,
input      [AGP0_14-1:0]  gp0_c24	           ,
input      [AGP0_14-1:0]  gp0_c25	           ,
input      [AGP0_14-1:0]  gp0_c26	           ,
input      [AGP0_14-1:0]  gp0_c27	           ,
input      [AGP0_15-1:0]  gp0_c28	           ,
input      [AGP0_15-1:0]  gp0_c29	           ,
input      [AGP0_15-1:0]  gp0_c30	           ,
input      [AGP0_15-1:0]  gp0_c31	           ,
input      [AGP0_16-1:0]  gp0_c32	           ,
input      [AGP0_16-1:0]  gp0_c33	           ,
input      [AGP0_16-1:0]  gp0_c34	           ,
input      [AGP0_16-1:0]  gp0_c35	           ,
input                     gp0_c0w            ,
output                    acp0_tx_en         ,
input                     acp0_tx_rdy        ,
output     [31:0]         acp0_tx_awaddr     ,
output     [2:0]          acp0_tx_awid       ,
output     [63:0]         acp0_tx_wdata      ,
input                     acp0_tx_wdreq      ,
output                    FDA0_SCK           ,
output                    FDA0_CSN           ,
output                    FDA0_SDI           ,
output                    DAC0_SDI           ,
output                    DAC0_SCK           ,
output                    DAC0_CSN           ,
output                    OPA0_10X1          ,
output                    OPA0_10X2          ,
output                    OPA0_OPX1          ,
output                    OPA0_OPX2          
    );
    
endmodule
