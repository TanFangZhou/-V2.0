`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 12:34:32
// Design Name:
// Module Name: Tc_PL_cap_gain_lmh_spi
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


module Tc_PL_cap_gain_lmh_spi
#(
parameter SPI0_0  = 8
)(
input                     clk                ,
input                     rst                ,
output                    stx_idle           ,
output                    stx_dreq           ,
input                     stx_valid          ,
input    [SPI0_0-1:0]     stx_data           ,
output                    FDA0_SCK           ,
output                    FDA0_CSN           ,
output                    FDA0_SDI
    );

Tspi_tx
#(
.SPI0_0 (SPI0_0 ),
.SPI0_1 (32     ),
.SPI0_2 (32     )
)
Tspi_tx_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.tx_idle     (stx_idle    ),
.tx_dreq     (stx_dreq    ),
.tx_valid    (stx_valid   ),
.tx_data     (stx_data    ),
.tx_div      (4           ),
.del_csh     (100         ),
.del_csn     (100         ),
.del_csp     (2000        ),
.CSN         (FDA0_CSN    ),
.SCLK        (FDA0_SCK    ),
.MOSI        (FDA0_SDI    )
    );

endmodule
