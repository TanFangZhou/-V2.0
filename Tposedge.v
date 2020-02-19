`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/19 12:24:23
// Design Name:
// Module Name: Tposedge
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


module Tposedge(
input        clk        ,
input        rst        ,
input        signal_in  ,
output       signal_out
    );

reg reg_signal_out=0;

reg signal_in_l=0;
always@(posedge clk)begin
	signal_in_l <= signal_in;
end

always@(posedge clk)begin
	if(rst)begin
		reg_signal_out <= 0;
	end else if(signal_in&(!signal_in_l))begin
		reg_signal_out <= 1;
	end else begin
		reg_signal_out <= 0;
	end
end

assign signal_out = reg_signal_out;

endmodule
