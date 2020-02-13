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

wire spi_CSN ;
wire spi_SCLK;
wire spi_MOSI;

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
.CSN         (spi_CSN     )
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

Tspi_tx_txd
#(
.SPI0_0  (SPI0_0  ),
.SPI0_1  (SPI0_1  )
)
Tspi_tx_txd_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.txd_en      (txd_en      ),
.txd_cmpt    (txd_cmpt    ),
.tx_dreq     (tx_dreq     ),
.tx_valid    (tx_valid    ),
.tx_data     (tx_data     ),
.tx_div      (tx_div      ),
.SCLK        (spi_SCLK    ),
.MOSI        (spi_MOSI    )
    );

reg t_CSN  =0;
reg t_SCLK =0;
reg t_MOSI =0;
always@(posedge clk)begin
	t_CSN  <= spi_CSN  ;
	t_SCLK <= spi_SCLK ;
	t_MOSI <= spi_MOSI ;
end

assign CSN  = t_CSN  ;
assign SCLK = t_SCLK ;
assign MOSI = t_MOSI ;

endmodule
