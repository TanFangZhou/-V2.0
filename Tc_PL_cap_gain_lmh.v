`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/15 16:57:45
// Design Name:
// Module Name: Tc_PL_cap_gain_lmh
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


module Tc_PL_cap_gain_lmh
#(
parameter CAP0_13 = 6 ,
          SPI0_0  = 8
)(
input                     clk                ,
input                     rst                ,
input                     gset_en            ,
output                    gset_lmh_cmpt      ,
input      [CAP0_13-1:0]  gset_lmh           ,
output                    FDA0_SCK           ,
output                    FDA0_CSN           ,
output                    FDA0_SDI
    );

wire               stx_idle   ;
wire               stx_dreq   ;
wire               stx_valid  ;
wire [SPI0_0-1:0]  stx_data   ;

Tc_PL_cap_gain_lmh_tx
#(
.CAP0_13(CAP0_13),
.SPI0_0 (SPI0_0 )
)
Tc_PL_cap_gain_lmh_tx_ins0
(
.clk              (clk              ),
.rst              (rst              ),
.gset_en          (gset_en          ),
.gset_lmh_cmpt    (gset_lmh_cmpt    ),
.gset_lmh         (gset_lmh         ),
.stx_idle         (stx_idle         ),
.stx_dreq         (stx_dreq         ),
.stx_valid        (stx_valid        ),
.stx_data         (stx_data         )
    );

Tc_PL_cap_gain_lmh_spi
#(
.SPI0_0(SPI0_0)
)
Tc_PL_cap_gain_lmh_spi_ins0
(
.clk           (clk           ),
.rst           (rst           ),
.stx_idle      (stx_idle      ),
.stx_dreq      (stx_dreq      ),
.stx_valid     (stx_valid     ),
.stx_data      (stx_data      ),
.FDA0_SCK      (FDA0_SCK      ),
.FDA0_CSN      (FDA0_CSN      ),
.FDA0_SDI      (FDA0_SDI      )
    );

endmodule
