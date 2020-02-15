`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/15 11:17:54
// Design Name:
// Module Name: Tc_PL_cap_gp_ctl
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


module Tc_PL_cap_gp_ctl
#(
parameter AGP0_1  = 2
)(
input                     clk125             ,
input                     rst                ,
input                     cap_cing           ,
input                     cap_cmpt           ,
output                    cap_trig           ,
output     [AGP0_1 -1:0]  gp0_c0	           ,
input                     gp0_c1	           ,
input                     gp0_c0w
    );

reg cap_state_cmpt = 0;
always@(posedge clk125)begin
	if(rst)begin
		cap_state_cmpt <= 0;
	end else begin
		if(cap_cmpt)begin
			cap_state_cmpt <= 1;
		end else if(gp0_c0w)begin
			cap_state_cmpt <= 0;
		end
	end
end

assign cap_trig = gp0_c1;
assign gp0_c0   = {cap_cing,cap_state_cmpt};

endmodule
