`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 17:59:27
// Design Name:
// Module Name: Tc_PL_cap_data_cap_buff_ctl_cnt
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


module Tc_PL_cap_data_cap_buff_ctl_cnt
#(
parameter CAP0_6  = 14  ,
          ADC0_1  = 56
)(
input                     clk               ,
input                     rst               ,
input                     add_en            ,
output                    add_cmpt          ,
input      [CAP0_6 -1:0]  cap_points        ,
output                    Gc_cap_cmpt       ,
input      [ADC0_1-1:0]   Gc_merge_data     ,
input                     Gc_mereg_datv     ,
output                    Gc_mereg_datr     ,
output     [ADC0_1 -1:0]  data              ,
output                    data_valid
    );

reg              t_add_cmpt      =0;
reg[CAP0_6 -1:0] points_cnt      =0;
reg              t_Gc_cap_cmpt   =0;
reg              t_Gc_mereg_datr =0;
reg[ADC0_1 -1:0] t_data          =0;
reg              t_data_valid    =0;

reg point_last=0;

localparam S_WAIT = 0,
           S_CNT  = 1,
           S_CMPT = 2;
reg[1:0] state=S_WAIT;
always@(posedge clk)begin
	if(!add_en)begin
		state           <= S_WAIT ;
		t_add_cmpt      <= 0      ;
		t_Gc_cap_cmpt   <= 0      ;
		t_Gc_mereg_datr <= 0      ;
	end else begin
		case(state)
			S_WAIT :begin
				if(Gc_mereg_datv)begin
					state           <= S_CNT  ;
					t_Gc_mereg_datr <= 1      ;
				end
			end
			S_CNT  :begin
				if(point_last)begin
					state           <= S_CMPT ;
					t_Gc_mereg_datr <= 0      ;
					t_add_cmpt      <= 1      ;
					t_Gc_cap_cmpt   <= 1      ;
				end else if(!Gc_mereg_datv)begin
					state           <= S_WAIT ;
					t_Gc_mereg_datr <= 0      ;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

always@(posedge clk)begin
	if(!add_en)begin
		points_cnt <= 0;
		point_last <= 0;
	end else begin
		if(Gc_mereg_datr)begin
			points_cnt <= points_cnt + 1;
		end
		if(points_cnt==(cap_points-1))begin
			point_last <= 1;
		end
	end
end

always@(posedge clk)begin
	if(!add_en)begin
		t_data_valid <= 0;
		t_data       <= 0;
	end else begin
		t_data_valid <= t_Gc_mereg_datr;
		t_data       <= Gc_merge_data  ;
	end
end

assign add_cmpt      = t_add_cmpt      ;
assign Gc_cap_cmpt   = t_Gc_cap_cmpt   ;
assign Gc_mereg_datr = t_Gc_mereg_datr ;
assign data          = t_data          ;
assign data_valid    = t_data_valid    ;

endmodule
