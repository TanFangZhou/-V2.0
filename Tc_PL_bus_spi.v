`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 11:28:13
// Design Name:
// Module Name: Tc_PL_bus_spi
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


module Tc_PL_bus_spi
#(
parameter SPI0_0  = 8 ,
          SPI0_1  = 32
)(
input                     clk         ,
input                     rst         ,
output                    tx_idle     ,
output                    tx_dreq     ,
input                     tx_valid    ,
input    [SPI0_0-1:0]     tx_data     ,
input    [SPI0_1-1:0]     tx_div      ,
output   [SPI0_0-1:0]     rx_data     ,
output                    rx_valid    ,
output                    CSN         ,
output                    SCLK        ,
output                    MOSI        ,
input                     MISO
    );

Tspi
#(
.SPI0_0(SPI0_0),
.SPI0_1(SPI0_1),
.SPI0_2(8)
)
Tspi_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.tx_idle     (tx_idle     ),
.tx_dreq     (tx_dreq     ),
.tx_valid    (tx_valid    ),
.tx_data     (tx_data     ),
.tx_div      (tx_div      ),
.del_csh     (100         ),
.del_csn     (100         ),
.del_csp     (100         ),
.rx_data     (rx_data     ),
.rx_valid    (rx_valid    ),
.CSN         (CSN         ),
.SCLK        (SCLK        ),
.MOSI        (MOSI        ),
.MISO        (MISO        )
    );

endmodule
