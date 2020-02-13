`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 15:30:19
// Design Name:
// Module Name: Tspi_tx_txd_ctl
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


module Tspi_tx_txd_ctl
(
input                     clk         ,
input                     rst         ,
input                     txd_en      ,
output                    txd_cmpt    ,
output                    tx_dreq     ,
input                     tx_valid    ,
output                    shift_en    ,
input                     shift_cmpt
    );

reg t_txd_cmpt  =0;
reg t_tx_dreq   =0;
reg t_shift_en  =0;

localparam S_INIT = 0,
           S_DATA = 1,
           S_TX   = 2,
           S_CMPT = 3;
reg[1:0] state=S_INIT;
always@(posedge clk)begin
	if(!txd_en)begin
		state      <= S_INIT;
		t_txd_cmpt <= 0     ;
		t_tx_dreq  <= 0     ;
		t_shift_en <= 0     ;
	end else begin
		case(state)
			S_INIT :begin
				state      <= S_DATA;
				t_tx_dreq  <= 1     ;
			end
			S_DATA :begin
				if(tx_valid)begin
					state      <= S_TX  ;
					t_tx_dreq  <= 0     ;
					t_shift_en <= 1     ;
				end else begin
					state      <= S_CMPT;
					t_tx_dreq  <= 0     ;
				end
			end
			S_TX   :begin
				if(shift_cmpt)begin
					state      <= S_INIT ;
					t_shift_en <= 0      ;
				end
			end
			S_CMPT :begin
				t_txd_cmpt <= 1;
			end
		endcase
	end
end

assign txd_cmpt = t_txd_cmpt ;
assign tx_dreq  = t_tx_dreq  ;
assign shift_en = t_shift_en ;

endmodule
