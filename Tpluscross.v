`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/19 14:50:49
// Design Name:
// Module Name: Tpluscross
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


module Tpluscross
#(
parameter VAL_DEL = 10 ,
          VAL_DEB = 3
)(
input        in_clk        ,
input        in_rst        ,
input        in_signal     ,
input        out_clk       ,
input        out_rst       ,
output       out_signal
    );

wire in_signal0,out_signal0;
Tplusadd
#(
.VAL_CNT(VAL_DEL)
)
Tplusadd_trig
(
.clk         (in_clk      ),
.rst         (in_rst      ),
.signal_in   (in_signal   ),
.signal_out  (in_signal0  )
    );

Tdebounce
#(
.VAL_CNT(VAL_DEB)
)
Tdebounce_trig
(
.clk         (out_clk      ),
.rst         (out_rst      ),
.signal_in   (in_signal0   ),
.signal_out  (out_signal0  )
    );

Tposedge
Tposedge_trig
(
.clk         (out_clk      ),
.rst         (out_rst      ),
.signal_in   (out_signal0  ),
.signal_out  (out_signal   )
    );

endmodule
