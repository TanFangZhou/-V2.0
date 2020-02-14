`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 10:07:49
// Design Name:
// Module Name: Tc_PL_bus_tx_txd
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


module Tc_PL_bus_tx_txd
#(
parameter AGP0_23	= 9    ,
	        SPI0_0	= 8
)(
input                     clk          ,
input                     rst          ,
input                     txd_en       ,
output                    txd_cmpt     ,
output                    txb_req      ,
input      [AGP0_23-1:0]  txb_data     ,
input                     txb_empty    ,
input                     spit_idle    ,
input                     spit_dreq    ,
output                    spit_valid   ,
output     [SPI0_0-1:0]   spit_data
    );

reg              t_txd_cmpt   =0;
reg              t_txb_req    =0;
reg              t_spit_valid =0;
reg [SPI0_0-1:0] t_spit_data  =0;

localparam S_INIT = 0,
           S_DATA = 1,
           S_TXD  = 2,
           S_CMPT = 3;
reg[1:0] state = S_INIT;
always@(posedge clk)begin
	if(!txd_en)begin
		state        <= S_INIT;
		t_txd_cmpt   <= 0     ;
		t_txb_req    <= 0     ;
		t_spit_valid <= 0     ;
		t_spit_data  <= 0     ;
	end else begin
		case(state)
			S_INIT :begin
				state        <= S_DATA;
			end
			S_DATA :begin
				if(txb_empty|txb_data[AGP0_23-1])begin
					state        <= S_CMPT;
				end else begin
					state        <= S_TXD   ;
					t_txb_req    <= 1       ;
					t_spit_valid <= 1       ;
					t_spit_data  <= txb_data;
				end
			end
			S_TXD  :begin
				t_txb_req    <= 0       ;
				if(spit_dreq)begin
					state        <= S_DATA  ;
					t_spit_valid <= 0       ;
				end
			end
			S_CMPT :begin
				if(spit_idle)begin
					t_txd_cmpt   <= 1     ;
				end
			end
		endcase
	end
end

assign txd_cmpt   = t_txd_cmpt   ;
assign txb_req    = t_txb_req    ;
assign spit_valid = t_spit_valid ;
assign spit_data  = t_spit_data  ;

endmodule
