`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 16:16:36
// Design Name:
// Module Name: Tc_PL_cap_data_cap_buff
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


module Tc_PL_cap_data_cap_buff
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
output                    buff_empty        ,
output     [CAP0_15-1:0]  buff_dout         ,
input                     buff_dout_req     
    );

wire [CAP0_15-1:0]  ctl_buff_din        ;
wire                ctl_buff_din_valid  ;
wire [CAP0_15-1:0]  ctl_buff_dout       ;
wire                ctl_buff_dout_req   ;
Tc_PL_cap_data_cap_buff_ctl
#(
.CAP0_6  (CAP0_6  ),
.ADC0_1  (ADC0_1  ),
.CAP0_15 (CAP0_15 )
)
Tc_PL_cap_data_cap_buff_ctl_ins0
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
.buff_din         (ctl_buff_din         ),
.buff_din_valid   (ctl_buff_din_valid   ),
.buff_dout        (ctl_buff_dout        ),
.buff_dout_req    (ctl_buff_dout_req    )
    );

wire [CAP0_15-1:0] ff_din    ;
wire               ff_wr_en  ;
wire               ff_rd_en  ;
wire [CAP0_15-1:0] ff_dout   ;
wire               ff_full   ;
wire               ff_empty  ;
fifo_generator_2 your_instance_name (
.clk   (   clk   ),// input wire clk
.rst   (   rst   ),// input wire rst
.din   (ff_din   ),// input wire [127 : 0] din
.wr_en (ff_wr_en ),// input wire wr_en
.rd_en (ff_rd_en ),// input wire rd_en
.dout  (ff_dout  ),// output wire [127 : 0] dout
.full  (ff_full  ),// output wire full
.empty (ff_empty )// output wire empty
);

assign ff_din        = ctl_buff_din                     ;
assign ff_wr_en      = ctl_buff_din_valid               ;
assign ff_rd_en      = ctl_buff_dout_req|buff_dout_req  ;
assign ctl_buff_dout = ff_dout                          ;
assign buff_dout     = ff_dout                          ;
assign buff_empty    = ff_empty                         ;

endmodule



