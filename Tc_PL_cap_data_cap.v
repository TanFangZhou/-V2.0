`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 16:14:25
// Design Name:
// Module Name: Tc_PL_cap_data_cap
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


module Tc_PL_cap_data_cap
#(
parameter CAP0_3  = 2   ,
	        CAP0_6  = 14  ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32  ,
          ADC0_1  = 56  ,
          CAP0_15 = 128
)(
input                     clk               ,
input                     rst               ,
input                     buff_en           ,
output                    buff_cmpt         ,
input      [CAP0_3 -1:0]  cap_phase_number  ,
input      [CAP0_6 -1:0]  cap_points        ,
input      [CAP0_10-1:0]  cap_gain_cycle    ,
input      [CAP0_11-1:0]  cap_gain_Lddel    ,
output                    Gc_cap_trig       ,
input                     Gc_capr_rdy       ,
output                    Gc_cap_cmpt       ,
output     [CAP0_3-1:0]   Gc_cap_phase      ,
input      [ADC0_1-1:0]   Gc_merge_data     ,
input                     Gc_mereg_datv     ,
output                    Gc_mereg_datr     ,
output                    buff_empty        ,
output     [CAP0_15-1:0]  buff_dout         ,
input                     buff_dout_req
    );

wire add_add   ;
wire add_en    ;
wire add_cmpt  ;
Tc_PL_cap_data_cap_trig
#(
.CAP0_3  (CAP0_3  ),
.CAP0_10 (CAP0_10 ),
.CAP0_11 (CAP0_11 )
)
Tc_PL_cap_data_cap_trig_ins0
(
.clk               (clk               ),
.rst               (rst               ),
.buff_en           (buff_en           ),
.buff_cmpt         (buff_cmpt         ),
.cap_phase_number  (cap_phase_number  ),
.cap_gain_cycle    (cap_gain_cycle    ),
.cap_gain_Lddel    (cap_gain_Lddel    ),
.Gc_cap_trig       (Gc_cap_trig       ),
.Gc_capr_rdy       (Gc_capr_rdy       ),
.Gc_cap_phase      (Gc_cap_phase      ),
.add_add           (add_add           ),
.add_en            (add_en            ),
.add_cmpt          (add_cmpt          )
    );

Tc_PL_cap_data_cap_buff
#(
.CAP0_6  (CAP0_6  ),
.ADC0_1  (ADC0_1  ),
.CAP0_15 (CAP0_15 )
)
Tc_PL_cap_data_cap_buff_ins0
(
.clk              (clk              ),
.rst              (rst              ),
.add_add          (add_add          ),
.add_en           (add_en           ),
.add_cmpt         (add_cmpt         ),
.cap_points       (cap_points       ),
.Gc_cap_cmpt      (Gc_cap_cmpt      ),
.Gc_merge_data    (Gc_merge_data    ),
.Gc_mereg_datv    (Gc_mereg_datv    ),
.Gc_mereg_datr    (Gc_mereg_datr    ),
.buff_empty       (buff_empty       ),
.buff_dout        (buff_dout        ),
.buff_dout_req    (buff_dout_req    )
    );

endmodule
