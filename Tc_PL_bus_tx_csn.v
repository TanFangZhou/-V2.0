`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 10:44:29
// Design Name:
// Module Name: Tc_PL_bus_tx_csn
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


module Tc_PL_bus_tx_csn
#(
parameter AGP0_23	= 9    ,
	        AGP0_25	= 8
)(
input                     clk          ,
input                     rst          ,
input                     csn_en       ,
output                    csn_cmpt     ,
output     [AGP0_25-1:0]  tx_sel       ,
output                    txb_req      ,
input      [AGP0_23-1:0]  txb_data     ,
input                     txb_empty
    );

reg               t_csn_cmpt =0;
reg [AGP0_25-1:0] t_tx_sel   =0;
reg               t_txb_req  =0;

localparam S_INIT = 0,
           S_CSEL = 1,
           S_CMPT = 2;
reg[1:0] state = S_INIT;
always@(posedge clk)begin
	if(!csn_en)begin
		state      <= S_INIT;
		t_csn_cmpt <= 0     ;
		t_tx_sel   <= 0     ;
		t_txb_req  <= 0     ;
	end else begin
		case(state)
			S_INIT :begin
				state      <= S_CSEL;
				t_txb_req  <= 1     ;
			end
			S_CSEL :begin
				if(txb_data[AGP0_23-1]|txb_empty)begin
					state      <= S_CMPT;
					t_txb_req  <= 0     ;
				end
				t_tx_sel   <= txb_data;
			end
			S_CMPT :begin
				t_csn_cmpt <= 1     ;
			end
			default:begin
				state      <= S_CMPT;
			end
		endcase
	end
end

assign csn_cmpt = t_csn_cmpt ;
assign tx_sel   = t_tx_sel   ;
assign txb_req  = t_txb_req  ;

endmodule
