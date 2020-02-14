`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 10:07:49
// Design Name:
// Module Name: Tc_PL_bus_tx
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


module Tc_PL_bus_tx
#(
parameter AGP0_23	= 9    ,
	        AGP0_25	= 8    ,
	        SPI0_0	= 8
)(
input                     clk          ,
input                     rst          ,
input                     tx_trig      ,
output                    tx_ting      ,
output                    tx_cmpt      ,
output     [AGP0_25-1:0]  tx_sel       ,
output                    txb_req      ,
input      [AGP0_23-1:0]  txb_data     ,
input                     txb_empty    ,
input                     spit_idle    ,
input                     spit_dreq    ,
output                    spit_valid   ,
output    [SPI0_0-1:0]    spit_data
    );

wire txd_en     ;
wire txd_cmpt   ;
wire csn_en     ;
wire csn_cmpt   ;
Tc_PL_bus_tx_ctl
Tc_PL_bus_tx_ctl_ins0
(
.clk         (clk         ),
.rst         (rst         ),
.tx_trig     (tx_trig     ),
.tx_ting     (tx_ting     ),
.tx_cmpt     (tx_cmpt     ),
.txb_empty   (txb_empty   ),
.txd_en      (txd_en      ),
.txd_cmpt    (txd_cmpt    ),
.csn_en      (csn_en      ),
.csn_cmpt    (csn_cmpt    )
    );

wire txb_req_csn;
Tc_PL_bus_tx_csn
#(
.AGP0_23 (AGP0_23	),
.AGP0_25 (AGP0_25	)
)
Tc_PL_bus_tx_csn_ins0
(
.clk          (clk          ),
.rst          (rst          ),
.csn_en       (csn_en       ),
.csn_cmpt     (csn_cmpt     ),
.tx_sel       (tx_sel       ),
.txb_req      (txb_req_csn  ),
.txb_data     (txb_data     ),
.txb_empty    (txb_empty    )
    );

wire txb_req_txd;
Tc_PL_bus_tx_txd
#(
.AGP0_23(AGP0_23 ),
.SPI0_0 (SPI0_0  )
)
Tc_PL_bus_tx_txd_ins0
(
.clk            (clk            ),
.rst            (rst            ),
.txd_en         (txd_en         ),
.txd_cmpt       (txd_cmpt       ),
.txb_req        (txb_req_txd    ),
.txb_data       (txb_data       ),
.txb_empty      (txb_empty      ),
.spit_idle      (spit_idle      ),
.spit_dreq      (spit_dreq      ),
.spit_valid     (spit_valid     ),
.spit_data      (spit_data      )
    );

assign txb_req = txb_req_csn|txb_req_txd;

endmodule
