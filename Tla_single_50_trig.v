`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/19 12:33:01
// Design Name:
// Module Name: Tla_single_50_trig
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


module Tla_single_50_trig(
input                    Gc_clk125        ,
input                    Gc_rst           ,
input                    Gc_cap_trig      ,
input                    Gc_cap_cmpt      ,
input                    Ga_clk50         ,
output                   Ga_cap_trig      ,
output                   Ga_cap_cmpt
    );

localparam VAL_DEL = 10 ,
           VAL_DEB = 3  ;

Tpluscross
#(
.VAL_DEL (VAL_DEL),
.VAL_DEB (VAL_DEB)
)
Tpluscross_trig
(
.in_clk        (Gc_clk125    ),
.in_rst        (Gc_rst       ),
.in_signal     (Gc_cap_trig  ),
.out_clk       (Ga_clk50     ),
.out_rst       (Gc_rst       ),
.out_signal    (Ga_cap_trig  )
    );

Tpluscross
#(
.VAL_DEL (VAL_DEL),
.VAL_DEB (VAL_DEB)
)
Tpluscross_cmpt
(
.in_clk        (Gc_clk125    ),
.in_rst        (Gc_rst       ),
.in_signal     (Gc_cap_cmpt  ),
.out_clk       (Ga_clk50     ),
.out_rst       (Gc_rst       ),
.out_signal    (Ga_cap_cmpt  )
    );

endmodule
