`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 12:59:28
// Design Name:
// Module Name: Tc_PL_chips_opm
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


module Tc_PL_chips_opm
#(
parameter TOP0_4	= 4    ,
	        AGP0_35	= 16
)(
input                     clk125             ,
input                     rst                ,
input      [AGP0_35-1:0]  gp0_r7             ,
input                     gp0_r7w  	         ,
output     [TOP0_4-1:0]   OPM0_IO
    );

reg[TOP0_4-1:0]  t_OPM0_IO=0;
reg[AGP0_35-1:0] del_cnt  =0;

always@(posedge clk125)begin
	if(rst)begin
		t_OPM0_IO <= 0;
	end else begin
		if(t_OPM0_IO&(del_cnt==0))begin
			t_OPM0_IO <= 0;
		end else if(gp0_r7w)begin
			t_OPM0_IO <= 1;
		end
	end
end

always@(posedge clk125)begin
	if(rst)begin
		del_cnt <= 0;
	end else begin
		if(t_OPM0_IO[0])begin
			del_cnt <= del_cnt - 1;
		end else begin
			del_cnt <= gp0_r7;
		end
	end
end

assign OPM0_IO = t_OPM0_IO;

endmodule
