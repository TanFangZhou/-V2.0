`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 13:23:39
// Design Name:
// Module Name: Tc_PL_cap_gain_data
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


module Tc_PL_cap_gain_data
#(
parameter CAP0_1  = 3   ,
	        CAP0_6  = 14  ,
	        CAP0_7  = 32  ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32
)(
input                     clk                ,
input                     rst                ,
input      [CAP0_1 -2:0]  gain_value	       ,
input                     gain_en            ,
input      [CAP0_6 -1:0]  cap_points         ,
input      [CAP0_7 -1:0]  cap_addr           ,
input      [CAP0_10-1:0]  cap_gain0_cycle    ,
input      [CAP0_10-1:0]  cap_gain1_cycle    ,
input      [CAP0_10-1:0]  cap_gain2_cycle    ,
input      [CAP0_10-1:0]  cap_gain3_cycle    ,
input      [CAP0_11-1:0]  cap_gain0_Lddel    ,
input      [CAP0_11-1:0]  cap_gain1_Lddel    ,
input      [CAP0_11-1:0]  cap_gain2_Lddel    ,
input      [CAP0_11-1:0]  cap_gain3_Lddel    ,
output     [CAP0_7 -1:0]  cap_gain_addr      ,
output     [CAP0_10-1:0]  cap_gain_cycle     ,
output     [CAP0_11-1:0]  cap_gain_Lddel
    );

reg [CAP0_7 -1:0]  t_cap_gain_addr  =0;
reg [CAP0_10-1:0]  t_cap_gain_cycle =0;
reg [CAP0_11-1:0]  t_cap_gain_Lddel =0;
always@(posedge clk)begin
	if(gain_en)begin
		case(gain_value)
			0:begin
				t_cap_gain_addr  <= cap_addr        ;
				t_cap_gain_cycle <= cap_gain0_cycle ;
				t_cap_gain_Lddel <= cap_gain0_Lddel ;
			end
			1:begin
				t_cap_gain_addr  <= cap_addr + cap_points<<4;
				t_cap_gain_cycle <= cap_gain1_cycle ;
				t_cap_gain_Lddel <= cap_gain1_Lddel ;
			end
			2:begin
				t_cap_gain_addr  <= cap_addr + cap_points<<5;
				t_cap_gain_cycle <= cap_gain2_cycle ;
				t_cap_gain_Lddel <= cap_gain2_Lddel ;
			end
			3:begin
				t_cap_gain_addr  <= cap_addr + cap_points<<5 + cap_points<<4;
				t_cap_gain_cycle <= cap_gain3_cycle ;
				t_cap_gain_Lddel <= cap_gain3_Lddel ;
			end
		endcase
	end
end

assign cap_gain_addr  = t_cap_gain_addr  ;
assign cap_gain_cycle = t_cap_gain_cycle ;
assign cap_gain_Lddel = t_cap_gain_Lddel ;

endmodule
