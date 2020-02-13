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

Tc_PL_bus_ctl(
    );

wire                txb_req     ;
wire [AGP0_23-1:0]  txb_data    ;
wire                txb_full    ;
wire                txb_empty   ;
wire [AGP0_25-1:0]  rxb_data    ;
wire                rxb_valid   ;
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
.txb_req         (txb_req           ),
.txb_data        (txb_data          ),
.txb_full        (txb_full          ),
.txb_empty       (txb_empty         ),
.rxb_data        (rxb_data          ),
.rxb_valid       (rxb_valid         ),
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

Tc_PL_bus_csn(
    );

assign spi_tx_div = gp0_b6       ;
assign rxb_data   = spi_rx_data  ;
assign rxb_valid  = spi_rx_valid ;

endmodule
