`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 17:00:58
// Design Name:
// Module Name: Tc_PL_cap_gain
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


module Tc_PL_cap_gain
#(
parameter CAP0_1  = 3   ,
	        CAP0_2  = 32  ,
	        CAP0_11 = 32  ,
	        CAP0_12 = 32  ,
	        CAP0_13 = 6   ,
          CAP0_14 = 4
)(
input                     clk125             ,
input                     rst                ,
input      [CAP0_1 -2:0]  gain_value	       ,
input                     gain_en            ,
output                    gain_cmpt          ,
output     [CAP0_2 -1:0]  cap_gain_del       ,
output     [CAP0_12-1:0]  cap_gain0_dacA     ,
output     [CAP0_12-1:0]  cap_gain0_dacB     ,
output     [CAP0_12-1:0]  cap_gain1_dacA     ,
output     [CAP0_12-1:0]  cap_gain1_dacB     ,
output     [CAP0_12-1:0]  cap_gain2_dacA     ,
output     [CAP0_12-1:0]  cap_gain2_dacB     ,
output     [CAP0_12-1:0]  cap_gain3_dacA     ,
output     [CAP0_12-1:0]  cap_gain3_dacB     ,
output     [CAP0_13-1:0]  cap_gain0_lmh      ,
output     [CAP0_13-1:0]  cap_gain1_lmh      ,
output     [CAP0_13-1:0]  cap_gain2_lmh      ,
output     [CAP0_13-1:0]  cap_gain3_lmh      ,
output     [CAP0_14-1:0]  cap_gain0_relay    ,
output     [CAP0_14-1:0]  cap_gain1_relay    ,
output     [CAP0_14-1:0]  cap_gain2_relay    ,
output     [CAP0_14-1:0]  cap_gain3_relay    ,
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

Tc_PL_cap_gain_ctl(
    );

Tc_PL_cap_gain_adc(
    );

Tc_PL_cap_gain_lmh(
    );


Tc_PL_cap_gain_relay(
    );






endmodule
