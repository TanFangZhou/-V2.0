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

wire Gc_cap_trig0;
Tplusadd
#(
.VAL_CNT(10)
)
Tplusadd_trig
(
.clk        (Gc_clk125),
.rst        (Gc_rst   ),
.signal_in  (Gc_cap_trig),
.signal_out (Gc_cap_trig0)
    );

wire Gc_cap_trig1;
Tdebounce
#(
.VAL_CNT(3)
)
Tdebounce_trig
(
.clk        (Ga_clk50),
.rst        (Gc_rst  ),
.signal_in  (Gc_cap_trig0),
.signal_out (Gc_cap_trig1)
    );

Tposedge
Tposedge_trig
(
.clk        (Ga_clk50),
.rst        (Gc_rst  ),
.signal_in  (Gc_cap_trig1),
.signal_out (Ga_cap_trig)
    );

wire Gc_cap_cmpt0,Gc_cap_cmpt1;
Tplusadd
#(
.VAL_CNT(10)
)
Tplusadd_cmpt
(
.clk        (Gc_clk125),
.rst        (Gc_rst   ),
.signal_in  (Gc_cap_cmpt),
.signal_out (Gc_cap_cmpt0)
    );

Tdebounce
#(
.VAL_CNT(3)
)
Tdebounce_cmpt
(
.clk        (Ga_clk50),
.rst        (Gc_rst  ),
.signal_in  (Gc_cap_cmpt0),
.signal_out (Gc_cap_cmpt1)
    );

Tposedge
Tposedge_cmpt
(
.clk        (Ga_clk50),
.rst        (Gc_rst  ),
.signal_in  (Gc_cap_cmpt1),
.signal_out (Ga_cap_cmpt)
    );


endmodule
