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
parameter TOP0_0  = 3         ,
          TOP0_1  = 7         ,
          TOP0_2  = 2         ,
          TOP0_3  = 12        ,
          TOP0_4  = 4         ,
          ADC0_0  = TOP0_1*2  ,
          ADC0_1  = ADC0_0*4  ,
          LDD0_0  = 32        ,
          CAP0_0  = 4         ,
          CAP0_1  = 2         ,
          AGP0_0	= 3         ,
          AGP0_1	= 2         ,
          AGP0_2	= 1         ,
          AGP0_3	= 3         ,
	        AGP0_4	= 3         ,
	        AGP0_5	= 32        ,
	        AGP0_6	= 8         ,
	        AGP0_7	= 3         ,
	        AGP0_8	= 14        ,
	        AGP0_9	= 32        ,
	        AGP0_10	= 32        ,
	        AGP0_11	= 32        ,
	        AGP0_12	= 18        ,
	        AGP0_13	= 32        ,
	        AGP0_14	= 32        ,
	        AGP0_15	= 6         ,
	        AGP0_16	= 4         ,
	        AGP0_17	= 4         ,
	        AGP0_18	= 5         ,
	        AGP0_19	= 3         ,
	        AGP0_20	= 32        ,
	        AGP0_21	= 6         ,
	        AGP0_22	= 2         ,
	        AGP0_23	= 9         ,
	        AGP0_24	= 8         ,
	        AGP0_25	= 8         ,
	        AGP0_26	= 8         ,
	        AGP0_27	= 16        ,
	        AGP0_28	= 15        ,
	        AGP0_29	= 4         ,
	        AGP0_30	= 2         ,
	        AGP0_31	= 1         ,
	        AGP0_32	= 2         ,
	        AGP0_33	= 1         ,
	        AGP0_34	= 2         ,
	        AGP0_35	= 16
)(
output                  ADC0_CSN           ,
output                  ADC0_SCK           ,
output                  ADC0_SDI           ,
input                   ADC0_SDO           ,
output   [TOP0_0-1:0]   LDD0_WP            ,
output   [TOP0_0-1:0]   LDD0_WN            ,
input                   LPL0_CLKP18        ,
input                   LPL0_CLKN18        ,
input    [TOP0_1-1:0]   ADC0_DP            ,
input    [TOP0_1-1:0]   ADC0_DN            ,
input                   ADC0_OFP           ,
input                   ADC0_OFN           ,
input                   ADC0_CLKP          ,
input                   ADC0_CLKN          ,
output                  FDA0_SCK           ,
output                  FDA0_CSN           ,
output                  FDA0_SDI           ,
input                   FDA0_SDO           ,
output                  LDD0_OUTEA         ,
output                  LDD0_DISEA         ,
output                  LDD0_OSCEA         ,
output                  LDD0_OLD2N         ,
output                  LDD0_RDISN         ,
output                  DAC0_SDI           ,
output                  DAC0_SCK           ,
output                  DAC0_CSN           ,
output                  DAC1_SDI           ,
output                  DAC1_SCK           ,
output                  DAC1_CSN           ,
output                  OPA0_10X1          ,
output                  OPA0_10X2          ,
output                  OPA0_OPX1          ,
output                  OPA0_OPX2          ,
output                  APD0_EN            ,
output                  LPL0_CSN           ,
input                   LPL0_SDO           ,
output                  LPL0_SCK           ,
output                  LPL0_SDI           ,
input                   LPL0_LOCK          ,
input                   LPL0_ERR           ,
output                  LPL0_SYNC          ,
input                   TEC0_GOOD          ,
input                   TEC1_GOOD          ,
output                  VCO0_SCK           ,
inout                   VCO0_SDA           ,
output   [TOP0_2-1:0]   LED0_L             ,
output                  UART0_TX           ,
input                   UART0_RX           ,
output                  ADC1_CSN           ,
output                  ADC1_SCK           ,
input                   ADC1_SDO           ,
input                   FAN0_PLUS          ,
inout    [TOP0_3-1:0]   BACK0_TRIG         ,
inout                   BACK0_STAR         ,
inout                   BACK1_CLK          ,
output                  TEMP0_CSN          ,
output                  TEMP0_SDI          ,
input                   TEMP0_SDO          ,
output                  TEMP0_SCK          ,
output   [TOP0_4-1:0]   OPM0_IO            ,
output                  OPM0_UARX          ,
input                   OPM0_UATX          ,
output                  OPM0_CSN           ,
output                  OPM0_SDI           ,
input                   OPM0_SDO           ,
output                  OPM0_SCK           ,
output                  STM0_UARX          ,
input                   STM0_UATX          ,
output                  OSW0_CS            ,
output                  OSW0_IO            ,
input                   LPL0_CLKP33        ,
input                   LPL0_CLKN33        ,
inout      [14:0]       DDR_addr           ,
inout      [2:0]        DDR_ba             ,
inout                   DDR_cas_n          ,
inout                   DDR_ck_n           ,
inout                   DDR_ck_p           ,
inout                   DDR_cke            ,
inout                   DDR_cs_n           ,
inout      [3:0]        DDR_dm             ,
inout      [31:0]       DDR_dq             ,
inout      [3:0]        DDR_dqs_n          ,
inout      [3:0]        DDR_dqs_p          ,
inout                   DDR_odt            ,
inout                   DDR_ras_n          ,
inout                   DDR_reset_n        ,
inout                   DDR_we_n           ,
inout                   FIXED_IO_ddr_vrn   ,
inout                   FIXED_IO_ddr_vrp   ,
inout      [53:0]       FIXED_IO_mio       ,
inout                   FIXED_IO_ps_clk    ,
inout                   FIXED_IO_ps_porb   ,
inout                   FIXED_IO_ps_srstb
    );

wire                Gc_clk200        ;
wire                Gc_clk125        ;
wire                Gc_rst           ;
wire                Gc_adc_of        ;
wire [ADC0_0-1:0]   Gc_adc_data      ;
wire                Gc_cap_mode      ;
wire [TOP0_0-1:0]   Gc_cap_wdis      ;
wire [LDD0_0-1:0]   Gc_cap_plus      ;
wire [TOP0_0-1:0]   Gc_com_wdis      ;
wire [LDD0_0-1:0]   Gc_com_plus      ;
wire                Gc_com_open      ;
wire                Gc_com_close     ;
wire [TOP0_0-1:0]   Gc_wdis          ;
wire [ADC0_1-1:0]   Gc_merge_data    ;
wire                Gc_mereg_datv    ;
wire                Gc_mereg_datr    ;
wire                Gc_cap_trig      ;
wire                Gc_capr_rdy      ;
wire [63:0]         GPIO_0_0_tri_io  ;
wire                SPI0_MISO_I_0    ;
wire                SPI0_MOSI_O_0    ;
wire                SPI0_SCLK_O_0    ;
wire                SPI0_SS1_O_0     ;
wire                SPI0_SS2_O_0     ;
wire                SPI0_SS_O_0      ;
wire                UART_0_0_rxd     ;
wire                UART_0_0_txd     ;
tCLK_LOC
#(
.TOP0_0       (TOP0_0       ),
.TOP0_1       (TOP0_1       ),
.TOP0_2       (TOP0_2       ),
.TOP0_3       (TOP0_3       ),
.TOP0_4       (TOP0_4       ),
.AGP0_0       (AGP0_0       ),
.AGP0_1       (AGP0_1       ),
.AGP0_2       (AGP0_2       ),
.AGP0_3       (AGP0_3       ),
.AGP0_4       (AGP0_4       ),
.AGP0_5       (AGP0_5       ),
.AGP0_6       (AGP0_6       ),
.AGP0_7       (AGP0_7       ),
.AGP0_8       (AGP0_8       ),
.AGP0_9       (AGP0_9       ),
.AGP0_10      (AGP0_10      ),
.AGP0_11      (AGP0_11      ),
.AGP0_12      (AGP0_12      ),
.AGP0_13      (AGP0_13      ),
.AGP0_14      (AGP0_14      ),
.AGP0_15      (AGP0_15      ),
.AGP0_16      (AGP0_16      ),
.AGP0_17      (AGP0_17      ),
.AGP0_18      (AGP0_18      ),
.AGP0_19      (AGP0_19      ),
.AGP0_20      (AGP0_20      ),
.AGP0_21      (AGP0_21      ),
.AGP0_22      (AGP0_22      ),
.AGP0_23      (AGP0_23      ),
.AGP0_24      (AGP0_24      ),
.AGP0_25      (AGP0_25      ),
.AGP0_26      (AGP0_26      ),
.AGP0_27      (AGP0_27      ),
.AGP0_28      (AGP0_28      ),
.AGP0_29      (AGP0_29      ),
.AGP0_30      (AGP0_30      ),
.AGP0_31      (AGP0_31      ),
.AGP0_32      (AGP0_32      ),
.AGP0_33      (AGP0_33      ),
.AGP0_34      (AGP0_34      ),
.AGP0_35      (AGP0_35      )
)
tCLK_LOC_ins0
(
.clk200               (Gc_clk200               ),
.clk125               (Gc_clk125               ),
.rst                  (Gc_rst                  ),
.ADC0_CSN             (ADC0_CSN             ),
.ADC0_SCK             (ADC0_SCK             ),
.ADC0_SDI             (ADC0_SDI             ),
.ADC0_SDO             (ADC0_SDO             ),
.FDA0_SCK             (FDA0_SCK             ),
.FDA0_CSN             (FDA0_CSN             ),
.FDA0_SDI             (FDA0_SDI             ),
.FDA0_SDO             (FDA0_SDO             ),
.LDD0_OUTEA           (LDD0_OUTEA           ),
.LDD0_DISEA           (LDD0_DISEA           ),
.LDD0_OSCEA           (LDD0_OSCEA           ),
.LDD0_OLD2N           (LDD0_OLD2N           ),
.LDD0_RDISN           (LDD0_RDISN           ),
.DAC0_SDI             (DAC0_SDI             ),
.DAC0_SCK             (DAC0_SCK             ),
.DAC0_CSN             (DAC0_CSN             ),
.DAC1_SDI             (DAC1_SDI             ),
.DAC1_SCK             (DAC1_SCK             ),
.DAC1_CSN             (DAC1_CSN             ),
.OPA0_10X1            (OPA0_10X1            ),
.OPA0_10X2            (OPA0_10X2            ),
.OPA0_OPX1            (OPA0_OPX1            ),
.OPA0_OPX2            (OPA0_OPX2            ),
.APD0_EN              (APD0_EN              ),
.LPL0_CSN             (LPL0_CSN             ),
.LPL0_SDO             (LPL0_SDO             ),
.LPL0_SCK             (LPL0_SCK             ),
.LPL0_SDI             (LPL0_SDI             ),
.LPL0_LOCK            (LPL0_LOCK            ),
.LPL0_ERR             (LPL0_ERR             ),
.LPL0_SYNC            (LPL0_SYNC            ),
.TEC0_GOOD            (TEC0_GOOD            ),
.TEC1_GOOD            (TEC1_GOOD            ),
.LED0_L               (LED0_L               ),
.OPM0_IO              (OPM0_IO              ),
.GPIO_0_0_tri_io      (GPIO_0_0_tri_io      ),
.SPI0_MISO_I_0        (SPI0_MISO_I_0        ),
.SPI0_MOSI_O_0        (SPI0_MOSI_O_0        ),
.SPI0_SCLK_O_0        (SPI0_SCLK_O_0        ),
.SPI0_SS1_O_0         (SPI0_SS1_O_0         ),
.SPI0_SS2_O_0         (SPI0_SS2_O_0         ),
.SPI0_SS_O_0          (SPI0_SS_O_0          ),
.UART_0_0_rxd         (UART_0_0_rxd         ),
.UART_0_0_txd         (UART_0_0_txd         ),
.DDR_addr             (DDR_addr             ),
.DDR_ba               (DDR_ba               ),
.DDR_cas_n            (DDR_cas_n            ),
.DDR_ck_n             (DDR_ck_n             ),
.DDR_ck_p             (DDR_ck_p             ),
.DDR_cke              (DDR_cke              ),
.DDR_cs_n             (DDR_cs_n             ),
.DDR_dm               (DDR_dm               ),
.DDR_dq               (DDR_dq               ),
.DDR_dqs_n            (DDR_dqs_n            ),
.DDR_dqs_p            (DDR_dqs_p            ),
.DDR_odt              (DDR_odt              ),
.DDR_ras_n            (DDR_ras_n            ),
.DDR_reset_n          (DDR_reset_n          ),
.DDR_we_n             (DDR_we_n             ),
.FIXED_IO_ddr_vrn     (FIXED_IO_ddr_vrn     ),
.FIXED_IO_ddr_vrp     (FIXED_IO_ddr_vrp     ),
.FIXED_IO_mio         (FIXED_IO_mio         ),
.FIXED_IO_ps_clk      (FIXED_IO_ps_clk      ),
.FIXED_IO_ps_porb     (FIXED_IO_ps_porb     ),
.FIXED_IO_ps_srstb    (FIXED_IO_ps_srstb    )
    );

wire                Ga_clki        ;
wire                Ga_rsti        ;
wire                Ga_clk250      ;
wire                Ga_adc_of      ;
wire [ADC0_0-1:0]   Ga_adc_data    ;
wire                Ga_clk200      ;
wire                Ga_cap_mode    ;
wire [TOP0_0-1:0]   Ga_cap_wdis    ;
wire [LDD0_0-1:0]   Ga_cap_plus    ;
wire [TOP0_0-1:0]   Ga_com_wdis    ;
wire [LDD0_0-1:0]   Ga_com_plus    ;
wire                Ga_com_open    ;
wire                Ga_com_close   ;
wire [TOP0_0-1:0]   Ga_wdis        ;
wire                Ga_clk62       ;
wire [ADC0_1-1:0]   Ga_merge_data  ;
wire                Ga_mereg_datv  ;
wire                Ga_clk50       ;
wire                Ga_cap_trig    ;
wire                Ga_capr_rdy    ;
wire                Ga_mem_reset   ;
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
.clki         (Ga_clki        ),
.rsti         (Ga_rsti        ),
.ADC0_CLKP    (ADC0_CLKP       ),
.ADC0_CLKN    (ADC0_CLKN       ),
.ADC0_DAP     (ADC0_DAP        ),
.ADC0_DAN     (ADC0_DAN        ),
.ADC0_OFP     (ADC0_OFP        ),
.ADC0_OFN     (ADC0_OFN        ),
.clk250       (Ga_clk250      ),
.adc_of       (Ga_adc_of      ),
.adc_data     (Ga_adc_data    ),
.clk200       (Ga_clk200      ),
.cap_mode     (Ga_cap_mode    ),
.cap_wdis     (Ga_cap_wdis    ),
.cap_plus     (Ga_cap_plus    ),
.com_wdis     (Ga_com_wdis    ),
.com_plus     (Ga_com_plus    ),
.com_open     (Ga_com_open    ),
.com_close    (Ga_com_close   ),
.wdis_out     (Ga_wdis        ),
.LDD0_WP      (LDD0_WP         ),
.LDD0_WN      (LDD0_WN         ),
.clk62        (Ga_clk62       ),
.merge_data   (Ga_merge_data  ),
.mereg_datv   (Ga_mereg_datv  ),
.clk50        (Ga_clk50       ),
.cap_trig     (Ga_cap_trig    ),
.capr_rdy     (Ga_capr_rdy    ),
.mem_reset    (Ga_mem_reset   )
    );

tCLK_L2A
#(
.TOP0_0(TOP0_0),
.TOP0_1(TOP0_1),
.TOP0_2(TOP0_2),
.TOP0_3(TOP0_3),
.TOP0_4(TOP0_4),
.ADC0_0(ADC0_0),
.ADC0_1(ADC0_1),
.LDD0_0(LDD0_0),
.CAP0_0(CAP0_0),
.CAP0_1(CAP0_1)
)
tCLK_L2A_ins0
(
.Gc_clk125        (Gc_clk125        ),
.Gc_rst           (Gc_rst           ),
.Gc_adc_of        (Gc_adc_of        ),
.Gc_adc_data      (Gc_adc_data      ),
.Gc_cap_mode      (Gc_cap_mode      ),
.Gc_cap_wdis      (Gc_cap_wdis      ),
.Gc_cap_plus      (Gc_cap_plus      ),
.Gc_com_wdis      (Gc_com_wdis      ),
.Gc_com_plus      (Gc_com_plus      ),
.Gc_com_open      (Gc_com_open      ),
.Gc_com_close     (Gc_com_close     ),
.Gc_merge_data    (Gc_merge_data    ),
.Gc_mereg_datv    (Gc_mereg_datv    ),
.Gc_mereg_datr    (Gc_mereg_datr    ),
.Gc_cap_trig      (Gc_cap_trig      ),
.Gc_capr_rdy      (Gc_capr_rdy      ),
.Gc_wdis          (Gc_wdis          ),
.Ga_clk250        (Ga_clk250        ),
.Ga_adc_of        (Ga_adc_of        ),
.Ga_adc_data      (Ga_adc_data      ),
.Ga_clk200        (Ga_clk200        ),
.Ga_cap_mode      (Ga_cap_mode      ),
.Ga_cap_wdis      (Ga_cap_wdis      ),
.Ga_cap_plus      (Ga_cap_plus      ),
.Ga_com_wdis      (Ga_com_wdis      ),
.Ga_com_plus      (Ga_com_plus      ),
.Ga_com_open      (Ga_com_open      ),
.Ga_com_close     (Ga_com_close     ),
.Ga_wdis          (Ga_wdis          ),
.Ga_clk62         (Ga_clk62         ),
.Ga_merge_data    (Ga_merge_data    ),
.Ga_mereg_datv    (Ga_mereg_datv    ),
.Ga_clk50         (Ga_clk50         ),
.Ga_cap_trig      (Ga_cap_trig      ),
.Ga_capr_rdy      (Ga_capr_rdy      ),
.Ga_mem_reset     (Ga_mem_reset     )
    );

tPS_EMIO
#(
.TOP0_0(TOP0_0),
.TOP0_1(TOP0_1),
.TOP0_2(TOP0_2),
.TOP0_3(TOP0_3),
.TOP0_4(TOP0_4)
)
tPS_EMIO_ins0
(
.GPIO_0_0_tri_io (GPIO_0_0_tri_io ),
.SPI0_MISO_I_0   (SPI0_MISO_I_0   ),
.SPI0_MOSI_O_0   (SPI0_MOSI_O_0   ),
.SPI0_SCLK_O_0   (SPI0_SCLK_O_0   ),
.SPI0_SS1_O_0    (SPI0_SS1_O_0    ),
.SPI0_SS2_O_0    (SPI0_SS2_O_0    ),
.SPI0_SS_O_0     (SPI0_SS_O_0     ),
.UART_0_0_rxd    (UART_0_0_rxd    ),
.UART_0_0_txd    (UART_0_0_txd    ),
.UART0_TX        (UART0_TX        ),
.UART0_RX        (UART0_RX        ),
.ADC1_CSN        (ADC1_CSN        ),
.ADC1_SCK        (ADC1_SCK        ),
.ADC1_SDO        (ADC1_SDO        ),
.FAN0_PLUS       (FAN0_PLUS       ),
.BACK0_TRIG      (BACK0_TRIG      ),
.BACK0_STAR      (BACK0_STAR      ),
.BACK1_CLK       (BACK1_CLK       ),
.TEMP0_CSN       (TEMP0_CSN       ),
.TEMP0_SDI       (TEMP0_SDI       ),
.TEMP0_SDO       (TEMP0_SDO       ),
.TEMP0_SCK       (TEMP0_SCK       ),
.OPM0_CSN        (OPM0_CSN        ),
.OPM0_SDI        (OPM0_SDI        ),
.OPM0_SDO        (OPM0_SDO        ),
.OPM0_SCK        (OPM0_SCK        ),
.OSW0_CS         (OSW0_CS         ),
.OSW0_IO         (OSW0_IO         )
    );

assign Ga_clki = Gc_clk200;
assign Ga_rsti = Gc_rst   ;

endmodule
