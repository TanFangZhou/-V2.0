`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 17:00:58
// Design Name:
// Module Name: Tc_PL_cap_ctl
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


module Tc_PL_cap_ctl
#(
parameter CAP0_1 = 2 ,
          CAP0_9 = 32
)(
input                     clk125       ,
input                     rst          ,
input                     cap_trig     ,
output                    cap_cing     ,
output                    cap_cmpt     ,
output     [CAP0_9 -1:0]  cap_time     ,
input      [CAP0_1 -1:0]  gain_number	 ,
output     [CAP0_1 -2:0]  gain_value	 ,
output                    gain_en      ,
input                     gain_cmpt    ,
output                    data_en      ,
input                     data_cmpt
    );

reg                t_cap_cing   =0;
reg                t_cap_cmpt   =0;
reg [CAP0_9 -1:0]  t_cap_time   =0;
reg [CAP0_1 -2:0]  t_gain_value =0;
reg                t_gain_en    =0;
reg                t_data_en    =0;

reg                gain_last =0;
reg [CAP0_9 -1:0]  time_cnt  =0;

localparam S_IDLE = 0,
           S_GAIN = 1,
           S_DATA = 2,
           S_CMPT = 3;
reg[1:0] state = S_CMPT;
always@(posedge clk125)begin
	if(rst)begin
		t_cap_cing   <= 0     ;
		t_cap_cmpt   <= 0     ;
		t_cap_time   <= 0     ;
		t_gain_value <= 0     ;
		t_gain_en    <= 0     ;
		t_data_en    <= 0     ;
		gain_last    <= 0     ;
		state        <= S_CMPT;
	end else begin
		case(state)
			S_IDLE :begin
				if(cap_trig)begin
					t_cap_cing   <= 1     ;
					t_gain_en    <= 1     ;
					state        <= S_GAIN;
				end
			end
			S_GAIN :begin
				if(gain_cmpt)begin
					t_gain_en    <= 0     ;
					t_data_en    <= 1     ;
					state        <= S_DATA;
					t_gain_value <= t_gain_value + 1;
					if(t_gain_value==gain_number)begin
						gain_last    <= 1     ;
					end
				end
			end
			S_DATA :begin
				if(data_cmpt)begin
					t_data_en    <= 0     ;
					if(gain_last)begin
						t_cap_cmpt   <= 1     ;
						state        <= S_CMPT;
					end else begin
						t_gain_en    <= 1     ;
						state        <= S_GAIN;
					end
				end
			end
			S_CMPT :begin
				t_cap_cing   <= 0       ;
				t_cap_cmpt   <= 0       ;
				t_cap_time   <= time_cnt;
				t_gain_value <= 0       ;
				gain_last    <= 0       ;
				state        <= S_IDLE  ;
			end
		endcase
	end
end

always@(posedge clk125)begin
	if(!t_cap_cing)begin
		time_cnt <= 0;
	end else begin
		time_cnt <= time_cnt + 1;
	end
end

assign cap_cing   = t_cap_cing   ;
assign cap_cmpt   = t_cap_cmpt   ;
assign cap_time   = t_cap_time   ;
assign gain_value = t_gain_value ;
assign gain_en    = t_gain_en    ;
assign data_en    = t_data_en    ;

endmodule
