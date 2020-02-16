`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/15 16:57:45
// Design Name:
// Module Name: Tc_PL_cap_gain_adc
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


module Tc_PL_cap_gain_adc
#(
parameter CAP0_12 = 32
)(
input                     clk                ,
input                     rst                ,
input                     gset_en            ,
output                    gset_adc_cmpt      ,
input      [CAP0_12-1:0]  gset_dacA          ,
input      [CAP0_12-1:0]  gset_dacB          ,
output                    DAC0_SDI           ,
output                    DAC0_SCK           ,
output                    DAC0_CSN
    );

localparam SPI0_0 = 8;

wire                  stx_idle  ;
wire                  stx_dreq  ;
wire                  stx_valid ;
wire [SPI0_0-1:0]     stx_data  ;
Tc_PL_cap_gain_adc_ctl
#(
.CAP0_12(CAP0_12 ),
.SPI0_0 (SPI0_0  )
)
Tc_PL_cap_gain_adc_ctl_ins0
(
.clk            (clk            ),
.rst            (rst            ),
.gset_en        (gset_en        ),
.gset_adc_cmpt  (gset_adc_cmpt  ),
.gset_dacA      (gset_dacA      ),
.gset_dacB      (gset_dacB      ),
.stx_idle       (stx_idle       ),
.stx_dreq       (stx_dreq       ),
.stx_valid      (stx_valid      ),
.stx_data       (stx_data       )
    );

Tc_PL_cap_gain_adc_spi
#(
.SPI0_0(SPI0_0)
)
Tc_PL_cap_gain_adc_spi_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.stx_idle    (stx_idle    ),
.stx_dreq    (stx_dreq    ),
.stx_valid   (stx_valid   ),
.stx_data    (stx_data    ),
.DAC0_SDI    (DAC0_SDI    ),
.DAC0_SCK    (DAC0_SCK    ),
.DAC0_CSN    (DAC0_CSN    )
    );

endmodule
