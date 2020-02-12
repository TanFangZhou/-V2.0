`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 11:45:27
// Design Name:
// Module Name: Tc_clk
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


module Tc_clk(
input      clki   ,
input      rsti   ,
output     clk125 ,
output     clk200 ,
output     rsto
    );

wire clk_out1 ;
wire clk_out2 ;
wire reset    ;
wire locked   ;
wire clk_in1  ;
clk_wiz_1 instance_name
(
.clk_out1 (clk_out1 ), // output clk_out1
.clk_out2 (clk_out2 ), // output clk_out2
.reset    (reset    ), // input reset
.locked   (locked   ), // output locked
.clk_in1  (clk_in1  )  // input clk_in1
    );

localparam MSB_DEL = 10;
reg[MSB_DEL:0] del_cnt=0;
always@(posedge clk125)begin
	if(!locked)begin
		del_cnt <= 0;
	end else begin
		if(!del_cnt[MSB_DEL])begin
			del_cnt <= del_cnt + 1;
		end
	end
end

reg t_rsto=0;
always@(posedge clk125)begin
	if(!locked)begin
		t_rsto <= 1;
	end else begin
		if(del_cnt[MSB_DEL])begin
			t_rsto <= 0;
		end
	end
end

assign clk125   = clk_out1 ;
assign clk200   = clk_out2 ;
assign reset    = rsti     ;
assign clk_in1  = clki     ;

endmodule
