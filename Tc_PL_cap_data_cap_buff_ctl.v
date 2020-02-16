`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 17:33:01
// Design Name:
// Module Name: Tc_PL_cap_data_cap_buff_ctl
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


module Tc_PL_cap_data_cap_buff_ctl
#(
parameter CAP0_6  = 14  ,
          ADC0_1  = 56  ,
          CAP0_15 = 128
)(
input                     clk               ,
input                     rst               ,
input                     add_add           ,
input                     add_en            ,
output                    add_cmpt          ,
input      [CAP0_6 -1:0]  cap_points        ,
output                    Gc_cap_cmpt       ,
input      [ADC0_1-1:0]   Gc_merge_data     ,
input                     Gc_mereg_datv     ,
output                    Gc_mereg_datr     ,
output     [CAP0_15-1:0]  buff_din          ,
output                    buff_din_valid    ,
input      [CAP0_15-1:0]  buff_dout         ,
output                    buff_dout_req
    );

wire [ADC0_1 -1:0]  data        ;
wire                data_valid  ;
Tc_PL_cap_data_cap_buff_ctl_cnt
#(
.CAP0_6 (CAP0_6  ),
.ADC0_1 (ADC0_1  )
)
Tc_PL_cap_data_cap_buff_ctl_cnt_ins0
(
.clk            (clk            ),
.rst            (rst            ),
.add_en         (add_en         ),
.add_cmpt       (add_cmpt       ),
.cap_points     (cap_points     ),
.Gc_cap_cmpt    (Gc_cap_cmpt    ),
.Gc_merge_data  (Gc_merge_data  ),
.Gc_mereg_datv  (Gc_mereg_datv  ),
.Gc_mereg_datr  (Gc_mereg_datr  ),
.data           (data           ),
.data_valid     (data_valid     )
    );

Tc_PL_cap_data_cap_buff_ctl_add
#(
.ADC0_1  (ADC0_1  ),
.CAP0_15 (CAP0_15 )
)
Tc_PL_cap_data_cap_buff_ctl_add_ins0
(
.clk              (clk              ),
.rst              (rst              ),
.add_add          (add_add          ),
.data             (data             ),
.data_valid       (data_valid       ),
.buff_din         (buff_din         ),
.buff_din_valid   (buff_din_valid   ),
.buff_dout        (buff_dout        ),
.buff_dout_req    (buff_dout_req    )
    );

endmodule
