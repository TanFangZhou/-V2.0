`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 16:40:22
// Design Name:
// Module Name: Tla_single_50
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


module Tla_single_50
#(
parameter ADC0_2  = 2
)(
input                    Gc_clk125        ,
input                    Gc_rst           ,
input                    Gc_cap_trig      ,
output                   Gc_capr_rdy      ,
input                    Gc_cap_cmpt        ,
input     [ADC0_2-1:0]   Gc_cap_phase       ,
input                    Ga_clk50         ,
output                   Ga_cap_trig      ,
input                    Ga_capr_rdy      ,
output                    Ga_cap_cmpt        ,
output     [ADC0_2-1:0]   Ga_cap_phase
    );

Tla_single_50_trig
Tla_single_50_trig_ins0
(
.Gc_clk125   (Gc_clk125       ),
.Gc_rst      (Gc_rst          ),
.Gc_cap_trig (Gc_cap_trig     ),
.Gc_cap_cmpt (Gc_cap_cmpt     ),
.Ga_clk50    (Ga_clk50        ),
.Ga_cap_trig (Ga_cap_trig     ),
.Ga_cap_cmpt (Ga_cap_cmpt     )
    );

Tdebounce
#(
.VAL_CNT(3)
)
Tdebounce_Ga_capr_rdy
(
.clk        (Gc_clk125),
.rst        (Gc_rst),
.signal_in  (Ga_capr_rdy),
.signal_out (Gc_capr_rdy)
    );

assign Ga_cap_phase = Gc_cap_phase;

endmodule
