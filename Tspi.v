`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 11:38:41
// Design Name:
// Module Name: Tspi
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


module Tspi
#(
parameter SPI0_0  = 8 ,
          SPI0_1  = 32,
          SPI0_2  = 32
)(
input                     clk         ,
input                     rst         ,
output                    tx_idle     ,
output                    tx_dreq     ,
input                     tx_valid    ,
input    [SPI0_0-1:0]     tx_data     ,
input    [SPI0_1-1:0]     tx_div      ,
input    [SPI0_2-1:0]     del_csh     ,
input    [SPI0_2-1:0]     del_csn     ,
input    [SPI0_2-1:0]     del_csp     ,
output   [SPI0_0-1:0]     rx_data     ,
output                    rx_valid    ,
output                    CSN         ,
output                    SCLK        ,
output                    MOSI        ,
input                     MISO
    );

Tspi_tx
#(
.SPI0_0 (SPI0_0),
.SPI0_1 (SPI0_1),
.SPI0_2 (SPI0_2)
)
Tspi_tx_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.tx_idle     (tx_idle     ),
.tx_dreq     (tx_dreq     ),
.tx_valid    (tx_valid    ),
.tx_data     (tx_data     ),
.tx_div      (tx_div      ),
.del_csh     (del_csh     ),
.del_csn     (del_csn     ),
.del_csp     (del_csp     ),
.CSN         (CSN         ),
.SCLK        (SCLK        ),
.MOSI        (MOSI        )
    );

Tspi_rx
#(
.SPI0_0 (SPI0_0)
)
Tspi_rx_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.rx_data     (rx_data     ),
.rx_valid    (rx_valid    ),
.CSN         (CSN         ),
.SCLK        (SCLK        ),
.MISO        (MISO        )
    );

endmodule
