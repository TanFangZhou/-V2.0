`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/15 16:57:45
// Design Name:
// Module Name: Tc_PL_cap_gain_relay
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


module Tc_PL_cap_gain_relay
#(
parameter CAP0_14 = 4
)(
input                     clk                ,
input                     rst                ,
input                     gset_en            ,
output                    gset_relay_cmpt    ,
input      [CAP0_14-1:0]  gset_relay         ,
output                    OPA0_10X1          ,
output                    OPA0_10X2          ,
output                    OPA0_OPX1          ,
output                    OPA0_OPX2
    );

reg               t_gset_relay_cmpt =0;
reg [CAP0_14-1:0] relay             =0;
always@(posedge clk)begin
	if(rst)begin
		relay             <= 0;
		t_gset_relay_cmpt <= 0;
	end else if(gset_en)begin
		relay             <= gset_relay;
		t_gset_relay_cmpt <= 1         ;
	end else begin
		t_gset_relay_cmpt <= 0         ;
	end
end

assign gset_relay_cmpt = t_gset_relay_cmpt;
assign {OPA0_OPX2,OPA0_OPX1,OPA0_10X2,OPA0_10X1} = relay;

endmodule
