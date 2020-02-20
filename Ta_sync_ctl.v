`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 11:45:27
// Design Name:
// Module Name: Ta_sync_ctl
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


module Ta_sync_ctl
#(
parameter CAP0_1 = 2
)(
input                   rst         ,
input                   clk50       ,
input                   cap_trig    ,
output                  capr_rdy    ,
output                  sync_trig   ,
input                   syncr_rdy   ,
output                  mem_reset
    );

localparam S_IDLE = 0,
           S_TRIG = 1,
           S_CLR  = 2,
           S_CMP  = 3;
reg[1:0] state          = S_CLR;
reg      t_capr_rdy     = 0    ;
reg      t_sync_trig    = 0    ;
reg      mem_reset_en   = 0    ;
reg      mem_reset_cmpt = 0    ;
always@(posedge clk50)begin
	if(rst)begin
		state        <= S_CLR;
		t_capr_rdy   <= 0    ;
		t_sync_trig  <= 0    ;
		mem_reset_en <= 0    ;
	end else begin
		case(state)
			S_IDLE :begin
				if(cap_trig)begin
					state       <= S_TRIG;
		    	t_capr_rdy  <= 0     ;
		    	t_sync_trig <= 1     ;
				end
			end
			S_TRIG :begin
				if(!syncr_rdy)begin
					t_sync_trig <= 0    ;
					state       <= S_CLR;
				end
			end
			S_CLR  :begin
				if(syncr_rdy)begin
					mem_reset_en <= 1    ;
					state        <= S_CMP;
				end
			end
			S_CMP  :begin
				if(mem_reset_cmpt)begin
					mem_reset_en <= 0     ;
		    	t_capr_rdy   <= 1     ;
					state        <= S_IDLE;
				end
			end
		endcase
	end
end

localparam MSB_DEL = 4;
localparam S1_IDLE = 0,
           S1_REST = 1,
           S1_RDEL = 2,
           S1_CMPT = 3;
reg[1:0]       state1      = S1_IDLE;
reg            t_mem_reset = 0      ;
reg[MSB_DEL:0] rdel_cnt    = 0      ;
always@(posedge clk50)begin
	if(!mem_reset_en)begin
		state1         <= S1_IDLE;
		mem_reset_cmpt <= 0      ;
		t_mem_reset    <= 0      ;
		rdel_cnt       <= 0      ;
	end else begin
		case(state1)
			S1_IDLE :begin
				t_mem_reset <= 1           ;
				rdel_cnt    <= rdel_cnt + 1;
				if(rdel_cnt[1])begin
					state1 <= S1_REST;
				end
			end
			S1_REST :begin
				t_mem_reset <= 0      ;
				rdel_cnt    <= 0      ;
				state1      <= S1_RDEL;
			end
			S1_RDEL :begin
				rdel_cnt <= rdel_cnt + 1;
				if(rdel_cnt[MSB_DEL])begin
					state1 <= S1_CMPT;
				end
			end
			S1_CMPT :begin
				mem_reset_cmpt <= 1;
			end
		endcase
	end
end

assign capr_rdy   = t_capr_rdy  ;
assign sync_trig  = t_sync_trig ;
assign mem_reset  = t_mem_reset ;

endmodule
