`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:27
// Design Name: 
// Module Name: Ta_ldd
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


module Ta_ldd
#(
parameter TOP0_0 = 3  ,
          LDD0_0 = 32
)(
input                   clk200        ,
input                   rst           ,
input                   cap_mode      ,
input    [TOP0_0-1:0]   cap_wdis      ,
input    [LDD0_0-1:0]   cap_plus      ,
input                   cap_trig      ,
output                  capr_rdy      ,
input    [TOP0_0-1:0]   com_wdis      ,
input    [LDD0_0-1:0]   com_plus      ,
input                   com_open      ,
input                   com_close     ,
output   [TOP0_0-1:0]   LDD0_WP       ,
output   [TOP0_0-1:0]   LDD0_WN
    );

wire             com_rst   ;
wire[TOP0_0-1:0] com_wdis_t;
Ta_ldd_com
#(
.TOP0_0 (TOP0_0 ),
.LDD0_0 (LDD0_0 )
)
Ta_ldd_com_ins0
(
.clk200     (clk200     ),
.rst        (com_rst    ),
.com_wdis   (com_wdis   ),
.com_plus   (com_plus   ),
.com_open   (com_open   ),
.com_close  (com_close  ),
.wdis       (com_wdis   )
    );

wire             cap_rst   ;
wire[TOP0_0-1:0] cap_wdis_t;
Ta_ldd_cap
#(
.TOP0_0 (TOP0_0 ),
.LDD0_0 (LDD0_0 )
)
Ta_ldd_cap_ins0
(
.clk200    (clk200    ),
.rst       (cap_rst   ),
.cap_wdis  (cap_wdis  ),
.cap_plus  (cap_plus  ),
.cap_trig  (cap_trig  ),
.capr_rdy  (capr_rdy  ),
.wdis      (cap_wdis  )
    );

Ta_ldd_out
#(
.TOP0_0 (TOP0_0 )
)
Ta_ldd_out_ins0
(
.clk200    (clk200     ),
.rst       (rst        ),
.cap_mode  (cap_mode   ),
.cap_wdis  (cap_wdis   ),
.com_wdis  (com_wdis   ),
.LDD0_WP   (LDD0_WP    ),
.LDD0_WN   (LDD0_WN    )
    );

assign com_rst = cap_mode ;
assign cap_rst = !cap_mode;

endmodule
