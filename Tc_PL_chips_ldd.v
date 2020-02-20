`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 12:59:28
// Design Name:
// Module Name: Tc_PL_chips_ldd
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


module Tc_PL_chips_ldd
#(
parameter TOP0_0	= 3    ,
          TOP0_1	= 7    ,
          TOP0_2	= 2    ,
          TOP0_3	= 12   ,
          TOP0_4	= 4    ,
          ADC0_0  = 14   ,
          ADC0_1  = 56   ,
          LDD0_0  = 32   ,
	        AGP0_17	= 4    ,
	        AGP0_18	= 5    ,
	        AGP0_19	= 3    ,
	        AGP0_20	= 32
)(
input                     clk125             ,
input                     rst                ,
output     [TOP0_0-1:0]   Gc_com_wdis        ,
output     [LDD0_0-1:0]   Gc_com_plus        ,
output                    Gc_com_open        ,
output                    Gc_com_close       ,
input      [TOP0_0-1:0]   Gc_wdis            ,
input      [AGP0_17-1:0]  gp0_d0	           ,
output     [AGP0_18-1:0]  gp0_d1	           ,
input      [AGP0_19-1:0]  gp0_d2	           ,
input      [AGP0_20-1:0]  gp0_d3	           ,
input                     gp0_d4	           ,
input                     gp0_d5	           ,
output                    LDD0_OUTEA         ,
output                    LDD0_DISEA         ,
output                    LDD0_OSCEA         ,
output                    LDD0_OLD2N         ,
output                    LDD0_RDISN
    );

wire LDD0_RDIS;
assign {LDD0_OSCEA,LDD0_DISEA,LDD0_RDIS,LDD0_OLD2N,LDD0_OUTEA} = gp0_d0;
assign LDD0_RDISN = !LDD0_RDIS;

wire opened=|Gc_wdis;
assign gp0_d1 = {LDD0_RDIS,Gc_wdis,opened};

assign Gc_com_wdis  = gp0_d2;
assign Gc_com_plus  = gp0_d3;
assign Gc_com_open  = gp0_d4;
assign Gc_com_close = gp0_d5;

endmodule
