`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 11:45:27
// Design Name:
// Module Name: Ttop
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


module Ttop
#(
parameter TOP0_0 = 3         ,
          TOP0_1 = 7         ,
          TOP0_2 = 2         ,
          TOP0_3 = 12        ,
          TOP0_4 = 4         ,
          ADC0_0 = TOP0_1*2  ,
          ADC0_1 = ADC0_0*4  ,
          LDD0_0 = 32        ,
          CAP0_0 = 4         ,
          CAP0_1 = 2
)(
output                  ADC0_CSN      ,
output                  ADC0_SCK      ,
output                  ADC0_SDI      ,
input                   ADC0_SDO      ,
output   [TOP0_0-1:0]   LDD0_WP       ,
output   [TOP0_0-1:0]   LDD0_WN       ,
input                   LPL0_CLKP18   ,
input                   LPL0_CLKN18   ,
input    [TOP0_1-1:0]   ADC0_DP       ,
input    [TOP0_1-1:0]   ADC0_DN       ,
input                   ADC0_OFP      ,
input                   ADC0_OFN      ,
input                   ADC0_CLKP     ,
input                   ADC0_CLKN     ,
output                  FDA0_SCK      ,
output                  FDA0_CSN      ,
output                  FDA0_SDI      ,
input                   FDA0_SDO      ,
output                  LDD0_OUTEA    ,
output                  LDD0_DISEA    ,
output                  LDD0_OSCEA    ,
output                  LDD0_OLD2N    ,
output                  LDD0_RDISN    ,
output                  DAC0_SDI      ,
output                  DAC0_SCK      ,
output                  DAC0_CSN      ,
output                  DAC1_SDI      ,
output                  DAC1_SCK      ,
output                  DAC1_CSN      ,
output                  OPA0_10X1     ,
output                  OPA0_10X2     ,
output                  OPA0_OPX1     ,
output                  OPA0_OPX2     ,
output                  APD0_EN       ,
output                  LPL0_CSN      ,
input                   LPL0_SDO      ,
output                  LPL0_SCK      ,
output                  LPL0_SDI      ,
input                   LPL0_LOCK     ,
input                   LPL0_ERR      ,
output                  LPL0_SYNC     ,
input                   TEC0_GOOD     ,
input                   TEC1_GOOD     ,
output                  VCO0_SCK      ,
inout                   VCO0_SDA      ,
output   [TOP0_2-1:0]   LED0_L        ,
output                  UART0_TX      ,
input                   UART0_RX      ,
output                  ADC1_CSN      ,
output                  ADC1_SCK      ,
input                   ADC1_SDO      ,
input                   FAN0_PLUS     ,
inout    [TOP0_3-1:0]   BACK0_TRIG    ,
inout                   BACK0_STAR    ,
inout                   BACK1_CLK     ,
output                  TEMP0_CSN     ,
output                  TEMP0_SDI     ,
input                   TEMP0_SDO     ,
output                  TEMP0_SCK     ,
output   [TOP0_4-1:0]   OPM0_IO       ,
output                  OPM0_UARX     ,
input                   OPM0_UATX     ,
output                  OPM0_CSN      ,
output                  OPM0_SDI      ,
input                   OPM0_SDO      ,
output                  OPM0_SCK      ,
output                  STM0_UARX     ,
input                   STM0_UATX     ,
output                  OSW0_CS       ,
output                  OSW0_IO       ,
input                   LPL0_CLKP33   ,
input                   LPL0_CLKN33   ,
inout [14:0]DDR_0_addr       ,
inout [2:0]DDR_0_ba          ,
inout DDR_0_cas_n            ,
inout DDR_0_ck_n             ,
inout DDR_0_ck_p             ,
inout DDR_0_cke              ,
inout DDR_0_cs_n             ,
inout [3:0]DDR_0_dm          ,
inout [31:0]DDR_0_dq         ,
inout [3:0]DDR_0_dqs_n       ,
inout [3:0]DDR_0_dqs_p       ,
inout DDR_0_odt              ,
inout DDR_0_ras_n            ,
inout DDR_0_reset_n          ,
inout DDR_0_we_n             ,
output FCLK_CLK0_0           ,
output FCLK_RESET0_N_0       ,
inout FIXED_IO_0_ddr_vrn     ,
inout FIXED_IO_0_ddr_vrp     ,
inout [53:0]FIXED_IO_0_mio   ,
inout FIXED_IO_0_ps_clk      ,
inout FIXED_IO_0_ps_porb     ,
inout FIXED_IO_0_ps_srstb
    );

tCLK_LOC
tCLK_LOC_ins0
(
);

wire                adc_clki        ;
wire                adc_rsti        ;
wire                adc_clk250      ;
wire                adc_adc_of      ;
wire [ADC0_0-1:0]   adc_adc_data    ;
wire                adc_clk200      ;
wire                adc_cap_mode    ;
wire [TOP0_0-1:0]   adc_cap_wdis    ;
wire [LDD0_0-1:0]   adc_cap_plus    ;
wire [TOP0_0-1:0]   adc_com_wdis    ;
wire [LDD0_0-1:0]   adc_com_plus    ;
wire                adc_com_open    ;
wire                adc_com_close   ;
wire                adc_clk62       ;
wire [ADC0_1-1:0]   adc_merge_data  ;
wire                adc_mereg_datv  ;
wire                adc_clk50       ;
wire                adc_cap_trig    ;
wire                adc_capr_rdy    ;
wire                adc_mem_reset   ;
tCLK_ADC
#(
.TOP0_1 (TOP0_1 ),
.ADC0_0 (ADC0_0 ),
.ADC0_1 (ADC0_1 ),
.CAP0_1 (CAP0_1 ),
.LDD0_0 (LDD0_0 )
)
tCLK_ADC_ins0
(
.clki         (adc_clki        ),
.rsti         (adc_rsti        ),
.ADC0_CLKP    (ADC0_CLKP       ),
.ADC0_CLKN    (ADC0_CLKN       ),
.ADC0_DAP     (ADC0_DAP        ),
.ADC0_DAN     (ADC0_DAN        ),
.ADC0_OFP     (ADC0_OFP        ),
.ADC0_OFN     (ADC0_OFN        ),
.clk250       (adc_clk250      ),
.adc_of       (adc_adc_of      ),
.adc_data     (adc_adc_data    ),
.clk200       (adc_clk200      ),
.cap_mode     (adc_cap_mode    ),
.cap_wdis     (adc_cap_wdis    ),
.cap_plus     (adc_cap_plus    ),
.com_wdis     (adc_com_wdis    ),
.com_plus     (adc_com_plus    ),
.com_open     (adc_com_open    ),
.com_close    (adc_com_close   ),
.clk62        (adc_clk62       ),
.merge_data   (adc_merge_data  ),
.mereg_datv   (adc_mereg_datv  ),
.clk50        (adc_clk50       ),
.cap_trig     (adc_cap_trig    ),
.capr_rdy     (adc_capr_rdy    ),
.mem_reset    (adc_mem_reset   )
    );

endmodule
