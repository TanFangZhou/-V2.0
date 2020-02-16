`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 11:21:16
// Design Name:
// Module Name: Tc_PL_cap_gain_adc_ctl
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


module Tc_PL_cap_gain_adc_ctl
#(
parameter CAP0_12 = 32,
          SPI0_0  = 8
)(
input                     clk                ,
input                     rst                ,
input                     gset_en            ,
output                    gset_adc_cmpt      ,
input      [CAP0_12-1:0]  gset_dacA          ,
input      [CAP0_12-1:0]  gset_dacB          ,
input                     stx_idle           ,
input                     stx_dreq           ,
output                    stx_valid          ,
output     [SPI0_0-1:0]   stx_data
    );

localparam GDAC0_0 = 24;

wire [GDAC0_0-1:0]  dac_value  ;
wire                dac_en     ;
wire                dac_cmpt   ;
Tc_PL_cap_gain_adc_ctl_chn
#(
.CAP0_12 (CAP0_12 ),
.GDAC0_0 (GDAC0_0 )
)
Tc_PL_cap_gain_adc_ctl_chn_ins0
(
.clk                (clk                ),
.rst                (rst                ),
.gset_en            (gset_en            ),
.gset_adc_cmpt      (gset_adc_cmpt      ),
.gset_dacA          (gset_dacA          ),
.gset_dacB          (gset_dacB          ),
.dac_value          (dac_value          ),
.dac_en             (dac_en             ),
.dac_cmpt           (dac_cmpt           )
    );

Tc_PL_cap_gain_adc_ctl_set
#(
.GDAC0_0 (GDAC0_0 ),
.SPI0_0  (SPI0_0  )
)
Tc_PL_cap_gain_adc_ctl_set_ins0
(
.clk          (clk          ),
.rst          (rst          ),
.dac_value    (dac_value    ),
.dac_en       (dac_en       ),
.dac_cmpt     (dac_cmpt     ),
.stx_idle     (stx_idle     ),
.stx_dreq     (stx_dreq     ),
.stx_valid    (stx_valid    ),
.stx_data     (stx_data     )
    );

endmodule
