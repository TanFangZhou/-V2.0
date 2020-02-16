`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/15 16:57:45
// Design Name:
// Module Name: Tc_PL_cap_gain_ctl
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


module Tc_PL_cap_gain_ctl
#(
parameter CAP0_1  = 3   ,
	        CAP0_2  = 32  ,
	        CAP0_12 = 32  ,
	        CAP0_13 = 6   ,
          CAP0_14 = 4
)(
input                     clk                ,
input                     rst                ,
input      [CAP0_1 -2:0]  gain_value	       ,
input                     gain_en            ,
output                    gain_cmpt          ,
input      [CAP0_2 -1:0]  cap_gain_del       ,
input      [CAP0_12-1:0]  cap_gain0_dacA     ,
input      [CAP0_12-1:0]  cap_gain0_dacB     ,
input      [CAP0_12-1:0]  cap_gain1_dacA     ,
input      [CAP0_12-1:0]  cap_gain1_dacB     ,
input      [CAP0_12-1:0]  cap_gain2_dacA     ,
input      [CAP0_12-1:0]  cap_gain2_dacB     ,
input      [CAP0_12-1:0]  cap_gain3_dacA     ,
input      [CAP0_12-1:0]  cap_gain3_dacB     ,
input      [CAP0_13-1:0]  cap_gain0_lmh      ,
input      [CAP0_13-1:0]  cap_gain1_lmh      ,
input      [CAP0_13-1:0]  cap_gain2_lmh      ,
input      [CAP0_13-1:0]  cap_gain3_lmh      ,
input      [CAP0_14-1:0]  cap_gain0_relay    ,
input      [CAP0_14-1:0]  cap_gain1_relay    ,
input      [CAP0_14-1:0]  cap_gain2_relay    ,
input      [CAP0_14-1:0]  cap_gain3_relay    ,
output                    gset_en            ,
input                     gset_adc_cmpt      ,
input                     gset_lmh_cmpt      ,
input                     gset_relay_cmpt    ,
output     [CAP0_12-1:0]  gset_dacA          ,
output     [CAP0_12-1:0]  gset_dacB          ,
output     [CAP0_13-1:0]  gset_lmh           ,
output     [CAP0_14-1:0]  gset_relay
    );

reg                t_gain_cmpt  =0;
reg                t_gset_en    =0;
reg [CAP0_12-1:0]  t_gset_dacA  =0;
reg [CAP0_12-1:0]  t_gset_dacB  =0;
reg [CAP0_13-1:0]  t_gset_lmh   =0;
reg [CAP0_14-1:0]  t_gset_relay =0;

reg [CAP0_2 -1:0]  gain_del_cnt =0;
reg                gain_del_max =0;

localparam S_INIT = 0,
           S_GSET = 1,
           S_GDEL = 2,
           S_CMPT = 3;
reg[1:0] state = S_INIT;
always@(posedge clk)begin
	if(!gain_en)begin
		t_gain_cmpt  <= 0          ;
		t_gset_en    <= 0          ;
		state        <= S_INIT     ;
	end else begin
		case(state)
			S_INIT :begin
				t_gset_en    <= 1          ;
				state        <= S_GSET     ;
			end
			S_GSET :begin
				if(gset_adc_cmpt&gset_lmh_cmpt&gset_relay_cmpt)begin
					t_gset_en    <= 0          ;
					state        <= S_GDEL     ;
				end
			end
			S_GDEL :begin
				if(gain_del_max)begin
					t_gain_cmpt  <= 1          ;
					state        <= S_CMPT     ;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

always@(posedge clk)begin
	if(!gain_en)begin
		gain_del_cnt <= 0;
		gain_del_max <= 0;
	end else begin
		gain_del_cnt <= gain_del_cnt + 1;
		if(gain_del_cnt>=cap_gain_del)begin
			gain_del_max <= 1;
		end
	end
end

always@(posedge clk)begin
	case(gain_value)
		0 :begin
			t_gset_dacA  <= cap_gain0_dacA  ;
			t_gset_dacB  <= cap_gain0_dacB  ;
			t_gset_lmh   <= cap_gain0_lmh   ;
			t_gset_relay <= cap_gain0_relay ;
		end
		1 :begin
			t_gset_dacA  <= cap_gain1_dacA  ;
			t_gset_dacB  <= cap_gain1_dacB  ;
			t_gset_lmh   <= cap_gain1_lmh   ;
			t_gset_relay <= cap_gain1_relay ;
		end
		2 :begin
			t_gset_dacA  <= cap_gain2_dacA  ;
			t_gset_dacB  <= cap_gain2_dacB  ;
			t_gset_lmh   <= cap_gain2_lmh   ;
			t_gset_relay <= cap_gain2_relay ;
		end
		3 :begin
			t_gset_dacA  <= cap_gain3_dacA  ;
			t_gset_dacB  <= cap_gain3_dacB  ;
			t_gset_lmh   <= cap_gain3_lmh   ;
			t_gset_relay <= cap_gain3_relay ;
		end
	endcase
end

assign gain_cmpt  = t_gain_cmpt   ;
assign gset_en    = t_gset_en     ;
assign gset_dacA  = t_gset_dacA   ;
assign gset_dacB  = t_gset_dacB   ;
assign gset_lmh   = t_gset_lmh    ;
assign gset_relay = t_gset_relay  ;

endmodule