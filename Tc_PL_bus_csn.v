`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 11:28:13
// Design Name:
// Module Name: Tc_PL_bus_csn
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


module Tc_PL_bus_csn
#(
parameter AGP0_25 = 8
)(
input                     clk                ,
input                     rst                ,
input      [AGP0_25-1:0]  chip_sel           ,
input                     spi_CSN            ,
input                     spi_SCLK           ,
input                     spi_MOSI           ,
output                    spi_MISO           ,
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

wire sel_adc0;
wire sel_fda0;
wire sel_dac0;
wire sel_dac1;
wire sel_lpl0;

assign  ADC0_CSN  = spi_CSN|(!sel_adc0)   ;
assign  ADC0_SCK  = spi_SCLK              ;
assign  ADC0_SDI  = spi_MOSI              ;

assign  FDA0_CSN  = spi_CSN|(!sel_fda0)   ;
assign  FDA0_SCK  = spi_SCLK              ;
assign  FDA0_SDI  = spi_MOSI              ;

assign  DAC0_CSN  = spi_CSN|(!sel_dac0)   ;
assign  DAC0_SCK  = spi_SCLK              ;
assign  DAC0_SDI  = spi_MOSI              ;

assign  DAC1_CSN  = spi_CSN|(!sel_dac1)   ;
assign  DAC1_SCK  = spi_SCLK              ;
assign  DAC1_SDI  = spi_MOSI              ;

assign  LPL0_CSN  = spi_CSN|(!sel_lpl0)   ;
assign  LPL0_SCK  = spi_SCLK              ;
assign  LPL0_SDI  = spi_MOSI              ;

assign {sel_lpl0,sel_dac1,sel_dac0,sel_fda0,sel_adc0} = chip_sel;
assign spi_MISO                                       = (ADC0_SDO&sel_adc0)|(FDA0_SDO&sel_fda0)|(LPL0_SDO&sel_lpl0);

endmodule
