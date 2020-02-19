`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/15 11:17:54
// Design Name:
// Module Name: Tc_PL_cap_gp_config
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


module Tc_PL_cap_gp_config
#(
parameter AGP0_2  = 1   ,
					AGP0_3  = 3   ,
					AGP0_5  = 32  ,
					AGP0_4  = 3   ,
					AGP0_6  = 8   ,
					AGP0_7  = 3   ,
					AGP0_8  = 14  ,
					AGP0_9  = 32  ,
					AGP0_10 = 32  ,
					AGP0_11 = 32  ,
					AGP0_12 = 18  ,
					AGP0_13 = 32  ,
					AGP0_14 = 32  ,
					AGP0_15 = 6   ,
          AGP0_16 = 4   ,
          CAP0_0  = 1   ,
	        CAP0_1  = 3   ,
	        CAP0_2  = 32  ,
	        CAP0_3  = 3   ,
	        CAP0_4  = 8   ,
	        CAP0_5  = 3   ,
	        CAP0_6  = 14  ,
	        CAP0_7  = 32  ,
	        CAP0_8  = 32  ,
	        CAP0_9  = 32  ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32  ,
	        CAP0_12 = 32  ,
	        CAP0_13 = 6   ,
          CAP0_14 = 4
)(
input                     clk125             ,
input                     rst                ,
input                     cap_cing           ,
input      [AGP0_2 -1:0]  gp0_c2	           ,
input      [AGP0_3 -1:0]  gp0_c3	           ,
input      [AGP0_4 -1:0]  gp0_c4	           ,
input      [AGP0_5 -1:0]  gp0_c5	           ,
input      [AGP0_6 -1:0]  gp0_c6	           ,
input      [AGP0_7 -1:0]  gp0_c7	           ,
input      [AGP0_8 -1:0]  gp0_c8	           ,
input      [AGP0_9 -1:0]  gp0_c9	           ,
output     [AGP0_10-1:0]  gp0_c10	           ,
output     [AGP0_11-1:0]  gp0_c11	           ,
input      [AGP0_12-1:0]  gp0_c12	           ,
input      [AGP0_12-1:0]  gp0_c13	           ,
input      [AGP0_12-1:0]  gp0_c14	           ,
input      [AGP0_12-1:0]  gp0_c15	           ,
input      [AGP0_13-1:0]  gp0_c16	           ,
input      [AGP0_13-1:0]  gp0_c17	           ,
input      [AGP0_13-1:0]  gp0_c18	           ,
input      [AGP0_13-1:0]  gp0_c19	           ,
input      [AGP0_14-1:0]  gp0_c20	           ,
input      [AGP0_14-1:0]  gp0_c21	           ,
input      [AGP0_14-1:0]  gp0_c22	           ,
input      [AGP0_14-1:0]  gp0_c23	           ,
input      [AGP0_14-1:0]  gp0_c24	           ,
input      [AGP0_14-1:0]  gp0_c25	           ,
input      [AGP0_14-1:0]  gp0_c26	           ,
input      [AGP0_14-1:0]  gp0_c27	           ,
input      [AGP0_15-1:0]  gp0_c28	           ,
input      [AGP0_15-1:0]  gp0_c29	           ,
input      [AGP0_15-1:0]  gp0_c30	           ,
input      [AGP0_15-1:0]  gp0_c31	           ,
input      [AGP0_16-1:0]  gp0_c32	           ,
input      [AGP0_16-1:0]  gp0_c33	           ,
input      [AGP0_16-1:0]  gp0_c34	           ,
input      [AGP0_16-1:0]  gp0_c35	           ,
output     [CAP0_0 -1:0]  cap_irq_en         ,
output     [CAP0_1 -1:0]  cap_gain_number    ,
output     [CAP0_2 -1:0]  cap_gain_del       ,
output     [CAP0_3 -1:0]  cap_phase_number   ,
output     [CAP0_4 -1:0]  cap_ld_plus        ,
output     [CAP0_5 -1:0]  cap_ld_wdis        ,
output     [CAP0_6 -1:0]  cap_points         ,
output     [CAP0_7 -1:0]  cap_addr           ,
input      [CAP0_8 -1:0]  cap_crc32          ,
input      [CAP0_9 -1:0]  cap_time           ,
output     [CAP0_10-1:0]  cap_gain0_cycle    ,
output     [CAP0_10-1:0]  cap_gain1_cycle    ,
output     [CAP0_10-1:0]  cap_gain2_cycle    ,
output     [CAP0_10-1:0]  cap_gain3_cycle    ,
output     [CAP0_11-1:0]  cap_gain0_Lddel    ,
output     [CAP0_11-1:0]  cap_gain1_Lddel    ,
output     [CAP0_11-1:0]  cap_gain2_Lddel    ,
output     [CAP0_11-1:0]  cap_gain3_Lddel    ,
output     [CAP0_12-1:0]  cap_gain0_dacA     ,
output     [CAP0_12-1:0]  cap_gain0_dacB     ,
output     [CAP0_12-1:0]  cap_gain1_dacA     ,
output     [CAP0_12-1:0]  cap_gain1_dacB     ,
output     [CAP0_12-1:0]  cap_gain2_dacA     ,
output     [CAP0_12-1:0]  cap_gain2_dacB     ,
output     [CAP0_12-1:0]  cap_gain3_dacA     ,
output     [CAP0_12-1:0]  cap_gain3_dacB     ,
output     [CAP0_13-1:0]  cap_gain0_lmh      ,
output     [CAP0_13-1:0]  cap_gain1_lmh      ,
output     [CAP0_13-1:0]  cap_gain2_lmh      ,
output     [CAP0_13-1:0]  cap_gain3_lmh      ,
output     [CAP0_14-1:0]  cap_gain0_relay    ,
output     [CAP0_14-1:0]  cap_gain1_relay    ,
output     [CAP0_14-1:0]  cap_gain2_relay    ,
output     [CAP0_14-1:0]  cap_gain3_relay
    );

reg [AGP0_2 -1:0]  t_gp0_c2   =0;
reg [AGP0_3 -1:0]  t_gp0_c3   =0;
reg [AGP0_4 -1:0]  t_gp0_c4   =0;
reg [AGP0_5 -1:0]  t_gp0_c5   =0;
reg [AGP0_6 -1:0]  t_gp0_c6   =0;
reg [AGP0_7 -1:0]  t_gp0_c7   =0;
reg [AGP0_8 -1:0]  t_gp0_c8   =0;
reg [AGP0_9 -1:0]  t_gp0_c9   =0;
reg [AGP0_12-1:0]  t_gp0_c12  =0;
reg [AGP0_12-1:0]  t_gp0_c13  =0;
reg [AGP0_12-1:0]  t_gp0_c14  =0;
reg [AGP0_12-1:0]  t_gp0_c15  =0;
reg [AGP0_13-1:0]  t_gp0_c16  =0;
reg [AGP0_13-1:0]  t_gp0_c17  =0;
reg [AGP0_13-1:0]  t_gp0_c18  =0;
reg [AGP0_13-1:0]  t_gp0_c19  =0;
reg [AGP0_14-1:0]  t_gp0_c20  =0;
reg [AGP0_14-1:0]  t_gp0_c21  =0;
reg [AGP0_14-1:0]  t_gp0_c22  =0;
reg [AGP0_14-1:0]  t_gp0_c23  =0;
reg [AGP0_14-1:0]  t_gp0_c24  =0;
reg [AGP0_14-1:0]  t_gp0_c25  =0;
reg [AGP0_14-1:0]  t_gp0_c26  =0;
reg [AGP0_14-1:0]  t_gp0_c27  =0;
reg [AGP0_15-1:0]  t_gp0_c28  =0;
reg [AGP0_15-1:0]  t_gp0_c29  =0;
reg [AGP0_15-1:0]  t_gp0_c30  =0;
reg [AGP0_15-1:0]  t_gp0_c31  =0;
reg [AGP0_16-1:0]  t_gp0_c32  =0;
reg [AGP0_16-1:0]  t_gp0_c33  =0;
reg [AGP0_16-1:0]  t_gp0_c34  =0;
reg [AGP0_16-1:0]  t_gp0_c35  =0;
always@(posedge clk125)begin
	if(rst)begin
		t_gp0_c2   <=0;
		t_gp0_c3   <=0;
		t_gp0_c4   <=0;
		t_gp0_c5   <=0;
		t_gp0_c6   <=0;
		t_gp0_c7   <=0;
		t_gp0_c8   <=0;
		t_gp0_c9   <=0;
		t_gp0_c12  <=0;
		t_gp0_c13  <=0;
		t_gp0_c14  <=0;
		t_gp0_c15  <=0;
		t_gp0_c16  <=0;
		t_gp0_c17  <=0;
		t_gp0_c18  <=0;
		t_gp0_c19  <=0;
		t_gp0_c20  <=0;
		t_gp0_c21  <=0;
		t_gp0_c22  <=0;
		t_gp0_c23  <=0;
		t_gp0_c24  <=0;
		t_gp0_c25  <=0;
		t_gp0_c26  <=0;
		t_gp0_c27  <=0;
		t_gp0_c28  <=0;
		t_gp0_c29  <=0;
		t_gp0_c30  <=0;
		t_gp0_c31  <=0;
		t_gp0_c32  <=0;
		t_gp0_c33  <=0;
		t_gp0_c34  <=0;
		t_gp0_c35  <=0;
	end else if(!cap_cing)begin
		t_gp0_c2   <= gp0_c2  ;
		t_gp0_c3   <= gp0_c3  ;
		t_gp0_c4   <= gp0_c4  ;
		t_gp0_c5   <= gp0_c5  ;
		t_gp0_c6   <= gp0_c6  ;
		t_gp0_c7   <= gp0_c7  ;
		t_gp0_c8   <= gp0_c8  ;
		t_gp0_c9   <= gp0_c9  ;
		t_gp0_c12  <= gp0_c12 ;
		t_gp0_c13  <= gp0_c13 ;
		t_gp0_c14  <= gp0_c14 ;
		t_gp0_c15  <= gp0_c15 ;
		t_gp0_c16  <= gp0_c16 ;
		t_gp0_c17  <= gp0_c17 ;
		t_gp0_c18  <= gp0_c18 ;
		t_gp0_c19  <= gp0_c19 ;
		t_gp0_c20  <= gp0_c20 ;
		t_gp0_c21  <= gp0_c21 ;
		t_gp0_c22  <= gp0_c22 ;
		t_gp0_c23  <= gp0_c23 ;
		t_gp0_c24  <= gp0_c24 ;
		t_gp0_c25  <= gp0_c25 ;
		t_gp0_c26  <= gp0_c26 ;
		t_gp0_c27  <= gp0_c27 ;
		t_gp0_c28  <= gp0_c28 ;
		t_gp0_c29  <= gp0_c29 ;
		t_gp0_c30  <= gp0_c30 ;
		t_gp0_c31  <= gp0_c31 ;
		t_gp0_c32  <= gp0_c32 ;
		t_gp0_c33  <= gp0_c33 ;
		t_gp0_c34  <= gp0_c34 ;
		t_gp0_c35  <= gp0_c35 ;
	end
end

assign cap_irq_en       = t_gp0_c2 ;
assign cap_gain_number  = t_gp0_c3 -1;
assign cap_phase_number = t_gp0_c4 -1;
assign cap_gain_del     = t_gp0_c5 ;
assign cap_ld_plus      = t_gp0_c6 ;
assign cap_ld_wdis      = t_gp0_c7 ;
assign cap_points       = t_gp0_c8 ;
assign cap_addr         = t_gp0_c9 ;
assign gp0_c10          = cap_crc32;
assign gp0_c11          = cap_time ;
assign cap_gain0_cycle  = t_gp0_c12;
assign cap_gain1_cycle  = t_gp0_c13;
assign cap_gain2_cycle  = t_gp0_c14;
assign cap_gain3_cycle  = t_gp0_c15;
assign cap_gain0_Lddel  = t_gp0_c16;
assign cap_gain1_Lddel  = t_gp0_c17;
assign cap_gain2_Lddel  = t_gp0_c18;
assign cap_gain3_Lddel  = t_gp0_c19;
assign cap_gain0_dacA   = t_gp0_c20;
assign cap_gain0_dacB   = t_gp0_c21;
assign cap_gain1_dacA   = t_gp0_c22;
assign cap_gain1_dacB   = t_gp0_c23;
assign cap_gain2_dacA   = t_gp0_c24;
assign cap_gain2_dacB   = t_gp0_c25;
assign cap_gain3_dacA   = t_gp0_c26;
assign cap_gain3_dacB   = t_gp0_c27;
assign cap_gain0_lmh    = t_gp0_c28;
assign cap_gain1_lmh    = t_gp0_c29;
assign cap_gain2_lmh    = t_gp0_c30;
assign cap_gain3_lmh    = t_gp0_c31;
assign cap_gain0_relay  = t_gp0_c32;
assign cap_gain1_relay  = t_gp0_c33;
assign cap_gain2_relay  = t_gp0_c34;
assign cap_gain3_relay  = t_gp0_c35;

endmodule
