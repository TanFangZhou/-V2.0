`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:27
// Design Name: 
// Module Name: Ta_sync
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


module Ta_sync
#(
parameter CAP0_1 = 2  
)(
input                   rst         ,
input                   clk250      ,
input                   clk200      ,
input                   clk50       ,
input                   cap_trig    ,
input                   cap_cmpt    ,
output                  capr_rdy    ,
input    [CAP0_1-1:0]   cap_phase   ,
output                  merge_en    ,
output                  ldd_trig    ,
input                   lddr_rdy    ,
output                  mem_reset
    );

wire sync_trig ;
wire syncr_rdy ;
Ta_sync_ctl
#(
.CAP0_1 (CAP0_1)
)
Ta_sync_ctl_ins0
(
.rst        (rst        ),
.clk50      (clk50      ),
.cap_trig   (cap_trig   ),
.capr_rdy   (capr_rdy   ),
.sync_trig  (sync_trig  ),
.syncr_rdy  (syncr_rdy  ),
.mem_reset  (mem_reset  )
    );

Ta_sync_trig
#(
.CAP0_1 (CAP0_1)
)
Ta_sync_trig_ins0
(
.rst        (rst        ),
.clk250     (clk250     ),
.clk200     (clk200     ),
.clk50      (clk50      ),
.sync_trig  (sync_trig  ),
.syncr_rdy  (syncr_rdy  ),
.cap_cmpt   (cap_cmpt   ),
.cap_phase  (cap_phase  ),
.merge_en   (merge_en   ),
.ldd_trig   (ldd_trig   ),
.lddr_rdy   (lddr_rdy   )
    );

endmodule
