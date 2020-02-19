`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 16:40:22
// Design Name:
// Module Name: Tla_single_200
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


module Tla_single_200
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
          CAP0_1  = 2
)(
input                    Gc_clk125        ,
input                    Gc_rst           ,
input                    Gc_cap_mode      ,
input     [TOP0_0-1:0]   Gc_cap_wdis      ,
input     [LDD0_0-1:0]   Gc_cap_plus      ,
input     [TOP0_0-1:0]   Gc_com_wdis      ,
input     [LDD0_0-1:0]   Gc_com_plus      ,
input                    Gc_com_open      ,
input                    Gc_com_close     ,
output    [TOP0_0-1:0]   Gc_wdis          ,
input                    Ga_clk200        ,
output                   Ga_cap_mode      ,
output    [TOP0_0-1:0]   Ga_cap_wdis      ,
output    [LDD0_0-1:0]   Ga_cap_plus      ,
output    [TOP0_0-1:0]   Ga_com_wdis      ,
output    [LDD0_0-1:0]   Ga_com_plus      ,
output                   Ga_com_open      ,
output                   Ga_com_close     ,
input     [TOP0_0-1:0]   Ga_wdis
    );

localparam VAL_DEL = 4  ,
           VAL_DEB = 3  ;

Tpluscross
#(
.VAL_DEL (VAL_DEL ),
.VAL_DEB (VAL_DEB )
)
Tpluscross_com_open
(
.in_clk        (Gc_clk125   ),
.in_rst        (Gc_rst      ),
.in_signal     (Gc_com_open ),
.out_clk       (Ga_clk200   ),
.out_rst       (Gc_rst      ),
.out_signal    (Ga_com_open )
    );

Tpluscross
#(
.VAL_DEL (VAL_DEL ),
.VAL_DEB (VAL_DEB )
)
Tpluscross_com_close
(
.in_clk        (Gc_clk125   ),
.in_rst        (Gc_rst      ),
.in_signal     (Gc_com_close ),
.out_clk       (Ga_clk200   ),
.out_rst       (Gc_rst      ),
.out_signal    (Ga_com_close )
    );

assign Gc_cap_mode  = Ga_cap_mode   ;
assign Gc_cap_wdis  = Ga_cap_wdis   ;
assign Gc_cap_plus  = Ga_cap_plus   ;
assign Gc_com_wdis  = Ga_com_wdis   ;
assign Gc_com_plus  = Ga_com_plus   ;
assign Gc_wdis      = Ga_wdis       ;

endmodule
