`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 12:20:59
// Design Name:
// Module Name: Tc_PL_bus
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


module Tc_PL_bus
#(
parameter AGP0_21	= 6    ,
	        AGP0_22	= 2    ,
	        AGP0_23	= 9    ,
	        AGP0_24	= 8    ,
	        AGP0_25	= 8    ,
	        AGP0_26	= 8    ,
	        AGP0_27	= 16
)(
input                     clk                ,
input                     rst                ,
output     [AGP0_21-1:0]  gp0_b0	           ,
input      [AGP0_22-1:0]  gp0_b1	           ,
input      [AGP0_23-1:0]  gp0_b2	           ,
output     [AGP0_24-1:0]  gp0_b3	           ,
output     [AGP0_25-1:0]  gp0_b4	           ,
output     [AGP0_26-1:0]  gp0_b5	           ,
input      [AGP0_27-1:0]  gp0_b6	           ,
input                     gp0_b0w            ,
input                     gp0_b2w  	         ,
input                     gp0_b4r  	         ,
output                    ADC0_CSN           ,
output                    ADC0_SCK           ,
output                    ADC0_SDI           ,
input                     ADC0_SDO           ,
output                    FDA0_SCK           ,
output                    FDA0_CSN           ,
output                    FDA0_SDI           ,
input                     FDA0_SDO           ,
output                    DAC0_SDI           ,
output                    DAC0_SCK           ,
output                    DAC0_CSN           ,
output                    DAC1_SDI           ,
output                    DAC1_SCK           ,
output                    DAC1_CSN           ,
output                    LPL0_CSN           ,
input                     LPL0_SDO           ,
output                    LPL0_SCK           ,
output                    LPL0_SDI
    );

localparam SPI0_0  = AGP0_25 ,
           SPI0_1  = AGP0_27 ;

wire                 tx_tx_trig      ;
wire                 tx_tx_ting      ;
wire                 tx_tx_cmpt      ;
wire  [AGP0_25-1:0]  tx_tx_sel       ;
wire                 tx_txb_req      ;
wire  [AGP0_23-1:0]  tx_txb_data     ;
wire                 tx_txb_empty    ;
wire                 tx_spit_idle    ;
wire                 tx_spit_dreq    ;
wire                 tx_spit_valid   ;
wire [SPI0_0-1:0]    tx_spit_data    ;
Tc_PL_bus_tx
#(
.AGP0_23 (AGP0_23 ),
.AGP0_25 (AGP0_25 ),
.SPI0_0  (SPI0_0  )
)
Tc_PL_bus_tx_ins0
(
.clk           (clk          ),
.rst           (rst          ),
.tx_trig       (tx_tx_trig      ),
.tx_ting       (tx_tx_ting      ),
.tx_cmpt       (tx_tx_cmpt      ),
.tx_sel        (tx_tx_sel       ),
.txb_req       (tx_txb_req      ),
.txb_data      (tx_txb_data     ),
.txb_empty     (tx_txb_empty    ),
.spit_idle     (tx_spit_idle    ),
.spit_dreq     (tx_spit_dreq    ),
.spit_valid    (tx_spit_valid   ),
.spit_data     (tx_spit_data    )
    );

wire                txbo_req    ;
wire [AGP0_23-1:0]  txbo_data   ;
wire                txb_full    ;
wire                txb_empty   ;
wire [AGP0_25-1:0]  rxbi_data   ;
wire                rxbi_valid  ;
wire                rxb_full    ;
wire                rxb_empty   ;
Tc_PL_bus_buff
#(
.AGP0_21 (AGP0_21	),
.AGP0_22 (AGP0_22	),
.AGP0_23 (AGP0_23	),
.AGP0_24 (AGP0_24	),
.AGP0_25 (AGP0_25	),
.AGP0_26 (AGP0_26	),
.AGP0_27 (AGP0_27	)
)
Tc_PL_bus_buff_ins0
(
.clk             (clk               ),
.rst             (rst               ),
.gp0_b1          (gp0_b1            ),
.gp0_b2          (gp0_b2            ),
.gp0_b3          (gp0_b3            ),
.gp0_b4          (gp0_b4            ),
.gp0_b5          (gp0_b5            ),
.gp0_b2w         (gp0_b2w           ),
.gp0_b4r         (gp0_b4r           ),
.txbo_req        (txbo_req          ),
.txbo_data       (txbo_data         ),
.txb_full        (txb_full          ),
.txb_empty       (txb_empty         ),
.rxbi_data       (rxbi_data         ),
.rxbi_valid      (rxbi_valid        ),
.rxb_full        (rxb_full          ),
.rxb_empty       (rxb_empty         )
    );

wire               spi_tx_idle   ;
wire               spi_tx_dreq   ;
wire               spi_tx_valid  ;
wire [SPI0_0-1:0]  spi_tx_data   ;
wire [SPI0_1-1:0]  spi_tx_div    ;
wire [SPI0_0-1:0]  spi_rx_data   ;
wire               spi_rx_valid  ;
wire               spi_CSN       ;
wire               spi_SCLK      ;
wire               spi_MOSI      ;
wire               spi_MISO      ;
Tc_PL_bus_spi
#(
.SPI0_0(SPI0_0),
.SPI0_1(SPI0_1)
)
Tc_PL_bus_spi_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.tx_idle     (spi_tx_idle     ),
.tx_dreq     (spi_tx_dreq     ),
.tx_valid    (spi_tx_valid    ),
.tx_data     (spi_tx_data     ),
.tx_div      (spi_tx_div      ),
.rx_data     (spi_rx_data     ),
.rx_valid    (spi_rx_valid    ),
.CSN         (spi_CSN         ),
.SCLK        (spi_SCLK        ),
.MOSI        (spi_MOSI        ),
.MISO        (spi_MISO        )
    );

Tc_PL_bus_state
Tc_PL_bus_state_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.tx_ting     (tx_tx_ting  ),
.tx_cmpt     (tx_tx_cmpt  ),
.tx_cmpt_clr (gp0_b0w     ),
.txb_empty   (txb_empty   ),
.txb_full    (txb_full    ),
.rxb_empty   (rxb_empty   ),
.rxb_full    (rxb_full    ),
.state       (gp0_b0      )
    );

wire csn_chip_sel;
Tc_PL_bus_csn
#(
.AGP0_25(AGP0_25)
)
Tc_PL_bus_csn_ins0
(
.clk             (clk             ),
.rst             (rst             ),
.chip_sel        (chip_sel        ),
.spi_CSN         (spi_CSN         ),
.spi_SCLK        (spi_SCLK        ),
.spi_MOSI        (spi_MOSI        ),
.spi_MISO        (spi_MISO        ),
.ADC0_CSN        (ADC0_CSN        ),
.ADC0_SCK        (ADC0_SCK        ),
.ADC0_SDI        (ADC0_SDI        ),
.ADC0_SDO        (ADC0_SDO        ),
.FDA0_SCK        (FDA0_SCK        ),
.FDA0_CSN        (FDA0_CSN        ),
.FDA0_SDI        (FDA0_SDI        ),
.FDA0_SDO        (FDA0_SDO        ),
.DAC0_SDI        (DAC0_SDI        ),
.DAC0_SCK        (DAC0_SCK        ),
.DAC0_CSN        (DAC0_CSN        ),
.DAC1_SDI        (DAC1_SDI        ),
.DAC1_SCK        (DAC1_SCK        ),
.DAC1_CSN        (DAC1_CSN        ),
.LPL0_CSN        (LPL0_CSN        ),
.LPL0_SDO        (LPL0_SDO        ),
.LPL0_SCK        (LPL0_SCK        ),
.LPL0_SDI        (LPL0_SDI        )
    );

assign tx_tx_trig    = gp0_b1       ;

assign txbo_req      = tx_txb_req   ;
assign tx_txb_data   = txbo_data    ;
assign tx_txb_empty  = txb_empty    ;

assign spi_tx_div    = gp0_b6       ;

assign rxbi_data     = spi_rx_data  ;
assign rxbi_valid    = spi_rx_valid ;

assign tx_spit_idle  = spi_tx_idle  ;
assign tx_spit_dreq  = spi_tx_dreq  ;
assign spi_tx_valid  = tx_spit_valid;
assign spi_tx_data   = tx_spit_data ;

assign csn_chip_sel  = tx_tx_sel    ;

endmodule
