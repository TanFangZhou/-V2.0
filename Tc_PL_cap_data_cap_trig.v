`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 16:16:36
// Design Name:
// Module Name: Tc_PL_cap_data_cap_trig
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


module Tc_PL_cap_data_cap_trig
#(
parameter CAP0_3  = 2   ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32
)(
input                     clk               ,
input                     rst               ,
input                     buff_en           ,
output                    buff_cmpt         ,
input      [CAP0_3 -1:0]  cap_phase_number  ,
input      [CAP0_10-1:0]  cap_gain_cycle    ,
input      [CAP0_11-1:0]  cap_gain_Lddel    ,
output                    Gc_cap_trig       ,
input                     Gc_capr_rdy       ,
output     [CAP0_3-1:0]   Gc_cap_phase      ,
output                    add_add           ,
output                    add_en            ,
input                     add_cmpt
    );

reg               t_buff_cmpt    =0;
reg               t_Gc_cap_trig  =0;
reg [CAP0_3-1:0]  t_Gc_cap_phase =0;
reg               t_add_add      =0;
reg               t_add_en       =0;

reg                cnt_Lddel_en   =0;
reg [CAP0_11-1:0]  cnt_Lddel      =0;
reg                cnt_Lddel_max  =0;
reg [CAP0_3 -1:0]  cnt_phase      =0;
reg [CAP0_10-1:0]  cnt_cycle      =0;
reg                cnt_phase_max  =0;
reg                cnt_cycle_max  =0;

localparam S_TRIG = 0,
           S_DADD = 1,
           S_LDEL = 2,
           S_CMPT = 3;
reg[1:0] state = S_TRIG;
always@(posedge clk)begin
	if(!buff_en)begin
		state          <= S_TRIG;
		t_buff_cmpt    <= 0     ;
		t_Gc_cap_trig  <= 0     ;
		t_Gc_cap_phase <= 0     ;
		t_add_en       <= 0     ;
		cnt_Lddel_en   <= 0     ;
	end else begin
		case(state)
			S_TRIG :begin
				state          <= S_DADD;
				t_Gc_cap_trig  <= 1     ;
				cnt_Lddel_en   <= 1     ;
			end
			S_DADD :begin
				if(Gc_capr_rdy)begin
					t_Gc_cap_trig  <= 0 ;
					t_add_en       <= 1 ;
				end
				if(add_cmpt)begin
					state <= S_LDEL;
					if(t_Gc_cap_phase==cap_phase_number)begin
						t_Gc_cap_phase <= 0;
					end else begin
						t_Gc_cap_phase <= t_Gc_cap_phase + 1;
					end
				end
			end
			S_LDEL :begin
				t_add_en <= 0 ;
				if(cnt_Lddel_max)begin
					cnt_Lddel_en <= 0;
					if(cnt_phase_max&cnt_cycle_max)begin
						state          <= S_CMPT;
						t_buff_cmpt    <= 1     ;
					end else begin
						state          <= S_TRIG;
					end
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

always@(posedge clk)begin
	if(!buff_en)begin
		cnt_phase     <= 0;
		cnt_cycle     <= 0;
		cnt_phase_max <= 0;
		cnt_cycle_max <= 0;
		t_add_add     <= 0;
	end else begin
		if(Gc_capr_rdy&t_Gc_cap_trig)begin
			if(cnt_phase==cap_phase_number)begin
				cnt_cycle <= cnt_cycle + 1;
				cnt_phase <= 0;
			end else begin
				cnt_phase <= cnt_phase + 1;
			end
			if(cnt_phase==cap_phase_number)begin
				t_add_add     <= 1;
				cnt_phase_max <= 1;
			end else begin
				cnt_phase_max <= 0;
			end
		end
		if(cnt_cycle>=cap_gain_cycle)begin
			cnt_cycle_max <= 1;
		end
	end
end

always@(posedge clk)begin
	if(!cnt_Lddel_en)begin
		cnt_Lddel     <= 0;
		cnt_Lddel_max <= 0;
	end else begin
		cnt_Lddel <= cnt_Lddel + 1;
		if(cnt_Lddel>=cap_gain_Lddel)begin
			cnt_Lddel_max <= 1;
		end
	end
end

assign buff_cmpt    = t_buff_cmpt    ;
assign Gc_cap_trig  = t_Gc_cap_trig  ;
assign Gc_cap_phase = t_Gc_cap_phase ;
assign add_add      = t_add_add      ;
assign add_en       = t_add_en       ;

endmodule
