`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 12:03:14
// Design Name:
// Module Name: Tc_PL_bus_state
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


module Tc_PL_bus_state(
input                     clk         ,
input                     rst         ,
input                     tx_ting     ,
input                     tx_cmpt     ,
input                     tx_cmpt_clr ,
input                     txb_empty   ,
input                     txb_full    ,
input                     rxb_empty   ,
input                     rxb_full    ,
output  [5:0]             state
    );

reg l_tx_cmpt=0;
reg t_tx_cmpt=0;
always@(posedge clk)begin
	if(rst)begin
		t_tx_cmpt <= 0;
	end else begin
		if(tx_cmpt_clr)begin
			t_tx_cmpt <= 0;
		end else if(tx_cmpt&(!l_tx_cmpt))begin
			t_tx_cmpt <= 1;
		end
	end
	l_tx_cmpt <= tx_cmpt;
end

assign state = {rxb_full,!rxb_empty,txb_full,txb_empty,tx_ting,t_tx_cmpt};

endmodule
