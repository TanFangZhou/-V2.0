`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 17:00:58
// Design Name:
// Module Name: Tc_PL_cap_data
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


module Tc_PL_cap_data
#(
parameter CAP0_3  = 2   ,
	        CAP0_4  = 8   ,
	        CAP0_5  = 3   ,
	        CAP0_6  = 14  ,
	        CAP0_7  = 32  ,
	        CAP0_8  = 32  ,
	        CAP0_9  = 32  ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32  ,
          ADC0_1  = 56  ,
          CAP0_15 = 128
)(
input                     clk                ,
input                     rst                ,
input                     data_en            ,
output                    data_cmpt          ,
input      [CAP0_3 -1:0]  cap_phase_number   ,
input      [CAP0_6 -1:0]  cap_points         ,
input      [CAP0_7 -1:0]  cap_addr           ,
output     [CAP0_8 -1:0]  cap_crc32          ,
input      [CAP0_10-1:0]  cap_gain_cycle     ,
input      [CAP0_11-1:0]  cap_gain_Lddel     ,
output                    Gc_cap_trig        ,
input                     Gc_capr_rdy        ,
output                    Gc_cap_cmpt        ,
output     [CAP0_3-1:0]   Gc_cap_phase       ,
input      [ADC0_1-1:0]   Gc_merge_data      ,
input                     Gc_mereg_datv      ,
output                    Gc_mereg_datr      ,
output                    acp0_tx_en         ,
input                     acp0_tx_rdy        ,
output     [31:0]         acp0_tx_awaddr     ,
output     [2:0]          acp0_tx_awid       ,
output     [63:0]         acp0_tx_wdata      ,
input                     acp0_tx_wdreq
    );

wire    buff_en     ;
wire    buff_cmpt   ;
wire    tacp_en     ;
wire    tacp_cmpt   ;
Tc_PL_cap_data_ctl
Tc_PL_cap_data_ctl_ins0
(
.clk        (clk         ),
.rst        (rst         ),
.data_en    (data_en     ),
.data_cmpt  (data_cmpt   ),
.buff_en    (buff_en     ),
.buff_cmpt  (buff_cmpt   ),
.tacp_en    (tacp_en     ),
.tacp_cmpt  (tacp_cmpt   )
    );

wire                buff_empty    ;
wire [CAP0_15-1:0]  buff_dout     ;
wire                buff_dout_req ;
Tc_PL_cap_data_cap
#(
.CAP0_3  (CAP0_3  ),
.CAP0_6  (CAP0_6  ),
.CAP0_10 (CAP0_10 ),
.CAP0_11 (CAP0_11 ),
.ADC0_1  (ADC0_1  ),
.CAP0_15 (CAP0_15 )
)
Tc_PL_cap_data_cap_ins0
(
.clk              (clk              ),
.rst              (rst              ),
.buff_en          (buff_en          ),
.buff_cmpt        (buff_cmpt        ),
.cap_phase_number (cap_phase_number ),
.cap_points       (cap_points       ),
.cap_gain_cycle   (cap_gain_cycle   ),
.cap_gain_Lddel   (cap_gain_Lddel   ),
.Gc_cap_trig      (Gc_cap_trig      ),
.Gc_capr_rdy      (Gc_capr_rdy      ),
.Gc_cap_cmpt      (Gc_cap_cmpt      ),
.Gc_cap_phase     (Gc_cap_phase     ),
.Gc_merge_data    (Gc_merge_data    ),
.Gc_mereg_datv    (Gc_mereg_datv    ),
.Gc_mereg_datr    (Gc_mereg_datr    ),
.buff_empty       (buff_empty       ),
.buff_dout        (buff_dout        ),
.buff_dout_req    (buff_dout_req    )
    );

Tc_PL_cap_data_acptx
#(
.CAP0_7 (CAP0_7 ),
.CAP0_8 (CAP0_8 ),
.CAP0_15(CAP0_15)
)
Tc_PL_cap_data_acptx_ins0
(
.clk            (clk            ),
.rst            (rst            ),
.tacp_en        (tacp_en        ),
.tacp_cmpt      (tacp_cmpt      ),
.cap_addr       (cap_addr       ),
.cap_crc32      (cap_crc32      ),
.buff_empty     (buff_empty     ),
.buff_dout      (buff_dout      ),
.buff_dout_req  (buff_dout_req  ),
.acp0_tx_en     (acp0_tx_en     ),
.acp0_tx_rdy    (acp0_tx_rdy    ),
.acp0_tx_awaddr (acp0_tx_awaddr ),
.acp0_tx_awid   (acp0_tx_awid   ),
.acp0_tx_wdata  (acp0_tx_wdata  ),
.acp0_tx_wdreq  (acp0_tx_wdreq  )
    );

endmodule
