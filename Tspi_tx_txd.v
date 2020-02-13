`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 12:02:55
// Design Name:
// Module Name: Tspi_tx_txd
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


module Tspi_tx_txd
#(
parameter SPI0_0  = 8 ,
          SPI0_1  = 32
)(
input                     clk         ,
input                     rst         ,
input                     txd_en      ,
output                    txd_cmpt    ,
output                    tx_dreq     ,
input                     tx_valid    ,
input    [SPI0_0-1:0]     tx_data     ,
input    [SPI0_1-1:0]     tx_div      ,
output                    SCLK        ,
output                    MOSI
    );

wire shift_en    ;
wire shift_cmpt  ;
Tspi_tx_txd_ctl
Tspi_tx_txd_ctl_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.txd_en      (txd_en      ),
.txd_cmpt    (txd_cmpt    ),
.tx_dreq     (tx_dreq     ),
.tx_valid    (tx_valid    ),
.shift_en    (shift_en    ),
.shift_cmpt  (shift_cmpt  )
    );

Tspi_tx_txd_shift
#(
.SPI0_0  (SPI0_0  ),
.SPI0_1  (SPI0_1  )
)
Tspi_tx_txd_shift_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.shift_en    (shift_en    ),
.shift_cmpt  (shift_cmpt  ),
.tx_data     (tx_data     ),
.tx_div      (tx_div      ),
.SCLK        (SCLK        ),
.MOSI        (MOSI        )
    );

endmodule
