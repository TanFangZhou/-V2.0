`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 11:38:26
// Design Name:
// Module Name: Tspi_tx
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


module Tspi_tx
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
output                    CSN         ,
output                    SCLK        ,
output                    MOSI
    );

wire csn_en   ;
wire csn_cmpt ;
Tspi_tx_ctl
#(
.SPI0_2(SPI0_2)
)
Tspi_tx_ctl_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.del_csh     (del_csh     ),
.tx_idle     (tx_idle     ),
.tx_valid    (tx_valid    ),
.csn_en      (csn_en      ),
.csn_cmpt    (csn_cmpt    ),
.CSN         (CSN         )
    );

wire txd_en   ;
wire txd_cmpt ;
Tspi_tx_csn
#(
.SPI0_2(SPI0_2)
)
Tspi_tx_csn_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.csn_en      (csn_en      ),
.csn_cmpt    (csn_cmpt    ),
.del_csn     (del_csn     ),
.del_csp     (del_csp     ),
.txd_en      (txd_en      ),
.txd_cmpt    (txd_cmpt    )
    );

Tspi_tx_txd(

    );

endmodule
