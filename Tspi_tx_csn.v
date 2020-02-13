`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 12:02:55
// Design Name:
// Module Name: Tspi_tx_csn
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


module Tspi_tx_csn
#(
parameter SPI0_2  = 32
)(
input                     clk         ,
input                     rst         ,
input                     csn_en      ,
output                    csn_cmpt    ,
input    [SPI0_2-1:0]     del_csn     ,
input    [SPI0_2-1:0]     del_csp     ,
output                    txd_en      ,
input                     txd_cmpt
    );

reg t_csn_cmpt =0;
reg t_txd_en   =0;

reg[SPI0_2-1:0] del_csn_cnt     =0;
reg             del_csn_cnt_cmpt=0;
reg[SPI0_2-1:0] del_csp_cnt     =0;
reg             del_csp_cnt_en  =0;
reg             del_csp_cnt_cmpt=0;

localparam S_CSN = 0,
           S_TXD = 1,
           S_CSP = 2,
           S_CMP = 3;
reg[1:0] state=S_CSN;
always@(posedge clk)begin
	if(!csn_en)begin
		state          <= S_CSN;
		t_csn_cmpt     <= 0    ;
		t_txd_en       <= 0    ;
		del_csp_cnt_en <= 0    ;
	end else begin
		case(state)
			S_CSN :begin
				if(del_csn_cnt_cmpt)begin
					t_txd_en <= 1    ;
					state    <= S_TXD;
				end
			end
			S_TXD :begin
				if(txd_cmpt)begin
					t_txd_en       <= 0    ;
					del_csp_cnt_en <= 1    ;
					state          <= S_CSP;
				end
			end
			S_CSP :begin
				if(del_csp_cnt_cmpt)begin
					del_csp_cnt_en <= 0    ;
					state          <= S_CMP;
				end
			end
			S_CMP :begin
				t_csn_cmpt <= 1;
			end
		endcase
	end
end

always@(posedge clk)begin
	if(!csn_en)begin
		del_csn_cnt      <= 0;
		del_csn_cnt_cmpt <= 0;
	end else begin
		del_csn_cnt <= del_csn_cnt + 1;
		if(del_csn_cnt>=del_csn)begin
			del_csn_cnt_cmpt <= 1;
		end
	end
end

always@(posedge clk)begin
	if(!del_csp_cnt_en)begin
		del_csp_cnt      <= 0;
		del_csp_cnt_cmpt <= 0;
	end else begin
		del_csp_cnt <= del_csp_cnt + 1;
		if(del_csp_cnt>=del_csp)begin
			del_csp_cnt_cmpt <= 1;
		end
	end
end

assign csn_cmpt = t_csn_cmpt;
assign txd_en   = t_txd_en  ;

endmodule
