`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 12:20:59
// Design Name:
// Module Name: Tc_PL_bus
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


module Tc_PL_bus
#(
parameter AGP0_21	= 6    ,
	        AGP0_22	= 2    ,
	        AGP0_23	= 9    ,
	        AGP0_24	= 8    ,
	        AGP0_25	= 8    ,
	        AGP0_26	= 8    ,
	        AGP0_27	= 16
)(
input                     clk125             ,
input                     rst                ,
output     [AGP0_21-1:0]  gp0_b0	           ,
input      [AGP0_22-1:0]  gp0_b1	           ,
input      [AGP0_23-1:0]  gp0_b2	           ,
output     [AGP0_24-1:0]  gp0_b3	           ,
output     [AGP0_25-1:0]  gp0_b4	           ,
output     [AGP0_26-1:0]  gp0_b5	           ,
input      [AGP0_27-1:0]  gp0_b6	           ,
input                     gp0_b0w            ,
input                     gp0_b2w  	         ,
input                     gp0_b4r  	         ,
output                    ADC0_CSN           ,
output                    ADC0_SCK           ,
output                    ADC0_SDI           ,
input                     ADC0_SDO           ,
output                    FDA0_SCK           ,
output                    FDA0_CSN           ,
output                    FDA0_SDI           ,
input                     FDA0_SDO           ,
output                    DAC0_SDI           ,
output                    DAC0_SCK           ,
output                    DAC0_CSN           ,
output                    DAC1_SDI           ,
output                    DAC1_SCK           ,
output                    DAC1_CSN           ,
output                    LPL0_CSN           ,
input                     LPL0_SDO           ,
output                    LPL0_SCK           ,
output                    LPL0_SDI
    );






endmodule
