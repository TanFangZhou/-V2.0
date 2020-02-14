`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 10:07:49
// Design Name:
// Module Name: Tc_PL_bus_tx_ctl
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


module Tc_PL_bus_tx_ctl(
input                     clk          ,
input                     rst          ,
input                     tx_trig      ,
output                    tx_ting      ,
output                    tx_cmpt      ,
input                     txb_empty    ,
output                    txd_en       ,
input                     txd_cmpt     ,
output                    csn_en       ,
input                     csn_cmpt
    );

reg               t_tx_ting =0;
reg               t_tx_cmpt =0;
reg               t_txd_en  =0;
reg               t_csn_en  =0;

localparam S_IDLE = 0,
           S_CSN  = 1,
           S_TXD  = 2,
           S_CMPT = 3;
reg[1:0] state = S_CMPT;
always@(posedge clk)begin
	if(rst)begin
		state     <= S_CMPT;
		t_tx_ting <= 0     ;
		t_tx_cmpt <= 0     ;
		t_txd_en  <= 0     ;
		t_csn_en  <= 0     ;
	end else begin
		case(state)
			S_IDLE :begin
				if(tx_trig)begin
					state     <= S_CSN ;
					t_tx_ting <= 1     ;
					t_csn_en  <= 1     ;
				end
			end
			S_CSN  :begin
				if(txb_empty)begin
					state     <= S_CMPT;
					t_tx_cmpt <= 1     ;
				end else begin
					if(csn_cmpt)begin
						state     <= S_TXD ;
						t_csn_en  <= 0     ;
						t_txd_en  <= 1     ;
					end
				end
			end
			S_TXD  :begin
				if(txd_cmpt)begin
					state     <= S_CSN ;
					t_csn_en  <= 1     ;
					t_txd_en  <= 0     ;
				end
			end
			S_CMPT :begin
				state     <= S_IDLE;
				t_tx_cmpt <= 0     ;
				t_tx_ting <= 0     ;
			end
		endcase
	end
end

assign tx_ting = t_tx_ting ;
assign tx_cmpt = t_tx_cmpt ;
assign txd_en  = t_txd_en  ;
assign csn_en  = t_csn_en  ;

endmodule
