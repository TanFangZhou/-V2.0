`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 12:02:55
// Design Name:
// Module Name: Tspi_tx_ctl
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


module Tspi_tx_ctl
#(
parameter SPI0_2 = 32
)(
input                     clk         ,
input                     rst         ,
input    [SPI0_2-1:0]     del_csh     ,
output                    tx_idle     ,
input                     tx_valid    ,
output                    csn_en      ,
input                     csn_cmpt    ,
output                    CSN
    );

reg t_tx_idle=0;
reg t_csn_en =0;
reg t_CSN    =1;

reg[SPI0_2-1:0] del_csh_cnt     =0;
reg             del_csh_cnt_en  =0;
reg             del_csh_cnt_cmpt=0;

localparam S_IDLE = 0,
           S_CSN  = 1,
           S_DEL  = 2,
           S_CMPT = 3;
reg[1:0] state=S_CMPT;
always@(posedge clk)begin
	if(rst)begin
		state          <= S_CMPT;
		t_tx_idle      <= 0     ;
		t_csn_en       <= 0     ;
		t_CSN          <= 1     ;
		del_csh_cnt_en <= 0     ;
	end else begin
		case(state)
			S_IDLE :begin
				if(tx_valid)begin
					t_tx_idle <= 0     ;
					t_csn_en  <= 1     ;
					t_CSN     <= 0     ;
					state     <= S_CSN ;
				end
			end
			S_CSN  :begin
				if(csn_cmpt)begin
					t_csn_en       <= 0     ;
					t_CSN          <= 1     ;
					del_csh_cnt_en <= 1     ;
					state          <= S_DEL ;
				end
			end
			S_DEL  :begin
				if(del_csh_cnt_cmpt)begin
					del_csh_cnt_en <= 0      ;
					state          <= S_CMPT ;
				end
			end
		  S_CMPT :begin
		  	t_tx_idle <= 1     ;
				state     <= S_IDLE;
		  end
		endcase
	end
end

always@(posedge clk)begin
	if(!del_csh_cnt_en)begin
		del_csh_cnt      <= 0;
		del_csh_cnt_cmpt <= 0;
	end else begin
		del_csh_cnt <= del_csh_cnt + 1;
		if(del_csh_cnt>=del_csh)begin
			del_csh_cnt_cmpt <= 1;
		end
	end
end

assign tx_idle = t_tx_idle;
assign csn_en  = t_csn_en ;
assign CSN     = t_CSN    ;

endmodule
