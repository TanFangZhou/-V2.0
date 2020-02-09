`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:26
// Design Name: 
// Module Name: Ta_sync_trig
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


module Ta_sync_trig
#(
parameter CAP0_1 = 2 
)(
input                   rst         ,
input                   clk250      ,
input                   clk200      ,
input                   clk50       ,
input                   sync_trig   ,
output                  syncr_rdy   ,
input                   cap_cmpt    ,
input    [CAP0_1-1:0]   cap_phase   ,
output                  merge_en    ,
output                  ldd_trig    ,
input                   lddr_rdy
    );

localparam S_IDLE = 0,
           S_TRIG = 1,
           S_CAPC = 2,
           S_LDDC = 3;
reg[1:0] state       = S_LDDC;
reg      t_syncr_rdy = 0     ;
reg      sync_signal = 0     ;
always@(posedge clk50)begin
	if(rst)begin
		state       <= S_LDDC;
		t_syncr_rdy <= 0     ;
		sync_signal <= 0     ;
	end else begin
		case(state)
			S_IDLE:begin
				if(sync_trig)begin
					state       <= S_TRIG;
					t_syncr_rdy <= 0     ;
				end
			end
			S_TRIG:begin
				if(sync_signal)begin
					state       <= S_CAPC;
					sync_signal <= 0;
				end else begin
					sync_signal <= 1;
				end
			end
			S_CAPC:begin
				if(cap_cmpt)begin
					state <= S_LDDC;
				end
			end
			S_LDDC:begin
				if(lddr_rdy)begin
					state       <= S_IDLE;
					t_syncr_rdy <= 1     ;
				end
			end
		endcase
	end
end

reg             t_ldd_trig  =0;
reg             t_ldd_trig0 =0;
reg             t_ldd_trig1 =0;
reg[CAP0_1-1:0] ldd_phase   =0;
always@(posedge clk200)begin
	if(rst)begin
		t_ldd_trig  <= 0;
		t_ldd_trig0 <= 0;
		t_ldd_trig1 <= 0;
		ldd_phase   <= 0;
	end else begin
		if(sync_signal)begin
			ldd_phase <= ldd_phase + 1;
			if(ldd_phase==cap_phase)begin
				t_ldd_trig0 <= 1;
			end
		end else begin
			t_ldd_trig0 <= 0;
		end
		t_ldd_trig1 <= t_ldd_trig0;
		t_ldd_trig  <= t_ldd_trig0&(!t_ldd_trig1);
	end
end

reg             t_merge_en  =0;
reg[CAP0_1-1:0] merge_phase =0;
always@(posedge clk250)begin
	if(rst)begin
		t_merge_en  <= 0;
		merge_phase <= 0;
	end else begin
		if(sync_signal)begin
			merge_phase <= merge_phase + 1;
		end
		if(sync_signal&(merge_phase==cap_phase))begin
			t_merge_en <= 1;
		end else if(cap_cmpt)begin
			t_merge_en <= 0;
		end
	end
end

assign syncr_rdy = t_syncr_rdy ;
assign merge_en  = t_merge_en  ;
assign ldd_trig  = t_ldd_trig  ;

endmodule
