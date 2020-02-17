`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/17 10:08:51
// Design Name:
// Module Name: Tc_PL_cap_data_acptx_tx
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


module Tc_PL_cap_data_acptx_tx
#(
parameter CAP0_7  = 32  ,
	        CAP0_8  = 32  ,
          CAP0_15 = 128
)(
input                     clk                  ,
input                     rst                  ,
input                     tacp_en              ,
output                    tacp_cmpt            ,
input      [CAP0_7 -1:0]  cap_addr             ,
input                     buff_empty           ,
input      [CAP0_15-1:0]  buff_dout            ,
output                    buff_dout_req        ,
output                    acp0_tx_en           ,
input                     acp0_tx_rdy          ,
output     [31:0]         acp0_tx_awaddr       ,
output     [2:0]          acp0_tx_awid         ,
output     [63:0]         acp0_tx_wdata        ,
input                     acp0_tx_wdreq        ,
output     [63:0]         crc0_data            ,
output                    crc0_data_valid
    );

reg                reg_tacp_cmpt           =0;
reg                reg_buff_dout_req       =0;
reg                reg_acp0_tx_en          =0;
reg [31:0]         reg_acp0_tx_awaddr      =0;
reg [2:0]          reg_acp0_tx_awid        =0;
reg [63:0]         reg_acp0_tx_wdata       =0;
reg [63:0]         reg_crc0_data           =0;
reg                reg_crc0_data_valid     =0;

reg [CAP0_15-1:0]  buff_dout_l       = 0;
reg                buff_tag          = 0;
reg                buff_dout_l_valid = 0;

localparam S_JUDG = 0,
           S_ADDR = 1,
           S_TXD  = 2,
           S_CMPT = 3;
reg[1:0] state = S_JUDG;
always@(posedge clk)begin
	if(!tacp_en)begin
		state              <= S_JUDG  ;
		reg_tacp_cmpt      <= 0       ;
		reg_acp0_tx_en     <= 0       ;
		reg_acp0_tx_awaddr <= cap_addr;
		reg_acp0_tx_awid   <= 0       ;
	end else begin
		case(state)
			S_JUDG :begin
				if(buff_empty)begin
					state              <= S_CMPT;
					reg_tacp_cmpt      <= 1     ;
				end else begin
					state              <= S_ADDR;
					reg_acp0_tx_en     <= 1     ;
					reg_acp0_tx_awid   <= reg_acp0_tx_awaddr ;
				end
			end
			S_ADDR :begin
				if(acp0_tx_rdy)begin
					state              <= S_TXD ;
					reg_acp0_tx_en     <= 0     ;
				end
			end
			S_TXD  :begin
				if(acp0_tx_rdy)begin
					state              <= S_JUDG ;
					reg_acp0_tx_awaddr <= reg_acp0_tx_awaddr + 8*16;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

always@(posedge clk)begin
	if(!tacp_en)begin
		reg_buff_dout_req  <= 0     ;
		reg_acp0_tx_wdata  <= 0     ;
		buff_dout_l        <= 0     ;
		buff_tag           <= 0     ;
	end else begin
		case(state)
			S_JUDG :begin
				if(buff_empty)begin

				end else begin
					reg_buff_dout_req  <= 1         ;
					buff_dout_l        <= buff_dout ;
				end
			end
			S_ADDR :begin
				reg_buff_dout_req  <= 0                  ;
				reg_acp0_tx_wdata  <= buff_dout_l[0+:64] ;
				buff_tag           <= 0                  ;
			end
			S_TXD  :begin
				if(acp0_tx_wdreq)begin
					buff_tag <= !buff_tag;
					if(buff_tag)begin
						reg_acp0_tx_wdata <= buff_dout_l[0+:64];
					end else begin
						reg_acp0_tx_wdata <= buff_dout_l[64+:64];
					end
					if(!buff_tag)begin
						buff_dout_l <= buff_dout;
					end
				end
				if(acp0_tx_wdreq&(!buff_tag))begin
					reg_buff_dout_req <= 1;
				end else begin
					reg_buff_dout_req <= 0;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

always@(posedge clk)begin
	if(!tacp_en)begin
		reg_crc0_data       <= 0;
		reg_crc0_data_valid <= 0;
		buff_dout_l_valid   <= 0;
	end else begin
		case(state)
			S_JUDG :begin

			end
			S_ADDR :begin
				buff_dout_l_valid <= 1;
			end
			S_TXD  :begin
				if(acp0_tx_wdreq&buff_dout_l_valid)begin
					reg_crc0_data       <= reg_acp0_tx_wdata;
					reg_crc0_data_valid <= 1                ;
				end else begin
					reg_crc0_data_valid <= 0                ;
				end
				if(acp0_tx_wdreq&buff_tag&buff_empty)begin
					buff_dout_l_valid <= 0;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

assign tacp_cmpt       = reg_tacp_cmpt       ;
assign buff_dout_req   = reg_buff_dout_req   ;
assign acp0_tx_en      = reg_acp0_tx_en      ;
assign acp0_tx_awaddr  = reg_acp0_tx_awaddr  ;
assign acp0_tx_awid    = reg_acp0_tx_awid    ;
assign acp0_tx_wdata   = reg_acp0_tx_wdata   ;
assign crc0_data       = reg_crc0_data       ;
assign crc0_data_valid = reg_crc0_data_valid ;

endmodule
