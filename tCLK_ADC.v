`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 11:45:27
// Design Name:
// Module Name: tCLK_ADC
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


module tCLK_ADC
#(
parameter TOP0_0 = 3  ,
          TOP0_1 = 7  ,
          ADC0_0 = 14 ,
          ADC0_1 = 56 ,
          CAP0_1 = 2  ,
          LDD0_0 = 32
)(
input                   clki          ,
input                   rsti          ,
input                   ADC0_CLKP     ,
input                   ADC0_CLKN     ,
input    [TOP0_1-1:0]   ADC0_DAP      ,
input    [TOP0_1-1:0]   ADC0_DAN      ,
input                   ADC0_OFP      ,
input                   ADC0_OFN      ,
output                  clk250        ,
output                  adc_of        ,
output   [ADC0_0-1:0]   adc_data      ,
output                  clk200        ,
input                   cap_mode      ,
input    [TOP0_0-1:0]   cap_wdis      ,
input    [LDD0_0-1:0]   cap_plus      ,
input    [TOP0_0-1:0]   com_wdis      ,
input    [LDD0_0-1:0]   com_plus      ,
input                   com_open      ,
input                   com_close     ,
output   [TOP0_0-1:0]   LDD0_WP       ,
output   [TOP0_0-1:0]   LDD0_WN       ,
output                  clk62         ,
output   [ADC0_1-1:0]   merge_data    ,
output                  mereg_datv    ,
output                  clk50         ,
input                   cap_trig      ,
output                  capr_rdy      ,
output                  mem_reset
    );

wire rst;
Ta_clk
Ta_clk_ins0
(
.clki      (clki      ),
.rsti      (rsti      ),
.ADC0_CLKP (ADC0_CLKP ),
.ADC0_CLKN (ADC0_CLKN ),
.rsto      (rst       ),
.clk250    (clk250    ),
.clk200    (clk200    ),
.clk62     (clk62     ),
.clk50     (clk50     )
    );

wire merge_en;
Ta_adc
#(
.TOP0_1 (TOP0_1 ),
.ADC0_0 (ADC0_0 ),
.ADC0_1 (ADC0_1 )
)
Ta_adc_ins0
(
.clk250      (clk250      ),
.rst         (rst         ),
.ADC0_DAP    (ADC0_DAP    ),
.ADC0_DAN    (ADC0_DAN    ),
.ADC0_OFP    (ADC0_OFP    ),
.ADC0_OFN    (ADC0_OFN    ),
.adc_of      (adc_of      ),
.adc_data    (adc_data    ),
.merge_en    (merge_en    ),
.clk62       (clk62       ),
.merge_data  (merge_data  ),
.mereg_datv  (mereg_datv  )
    );

wire ldd_trig;
wire lddr_rdy;
Ta_ldd
#(
.TOP0_0 (TOP0_0),
.LDD0_0 (LDD0_0)
)
Ta_ldd_ins0
(
.clk200     (clk200      ),
.rst        (rst         ),
.cap_mode   (cap_mode    ),
.cap_wdis   (cap_wdis    ),
.cap_plus   (cap_plus    ),
.cap_trig   (ldd_trig    ),
.capr_rdy   (lddr_rdy    ),
.com_wdis   (com_wdis    ),
.com_plus   (com_plus    ),
.com_open   (com_open    ),
.com_close  (com_close   ),
.LDD0_WP    (LDD0_WP     ),
.LDD0_WN    (LDD0_WN     )
    );

Ta_sync
#(
.CAP0_1(CAP0_1)
)
Ta_sync_ins0
(
.rst        (rst        ),
.clk250     (clk250     ),
.clk200     (clk200     ),
.clk50      (clk50      ),
.cap_trig   (cap_trig   ),
.cap_cmpt   (cap_cmpt   ),
.capr_rdy   (capr_rdy   ),
.cap_phase  (cap_phase  ),
.merge_en   (merge_en   ),
.ldd_trig   (ldd_trig   ),
.lddr_rdy   (lddr_rdy   ),
.mem_reset  (mem_reset  )
    );

endmodule
