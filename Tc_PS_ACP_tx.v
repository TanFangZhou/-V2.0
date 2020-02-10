`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/10 10:17:22
// Design Name:
// Module Name: Tc_PS_ACP_tx
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


module Tc_PS_ACP_tx(
input                  clk                      ,
input                  rst                      ,
input                  tx_en                    ,
output                 tx_rdy                   ,
input       [31:0]     tx_awaddr                ,
input       [2:0]      tx_awid                  ,
input       [63:0]     tx_wdata                 ,
output                 tx_wdreq                 ,
output      [31:0]     S_AXI_ACP_0_awaddr       ,
output      [1:0]      S_AXI_ACP_0_awburst      ,
output      [3:0]      S_AXI_ACP_0_awcache      ,
output      [2:0]      S_AXI_ACP_0_awid         ,
output      [3:0]      S_AXI_ACP_0_awlen        ,
output      [1:0]      S_AXI_ACP_0_awlock       ,
output      [2:0]      S_AXI_ACP_0_awprot       ,
output      [3:0]      S_AXI_ACP_0_awqos        ,
input                  S_AXI_ACP_0_awready      ,
output      [2:0]      S_AXI_ACP_0_awsize       ,
output      [4:0]      S_AXI_ACP_0_awuser       ,
output                 S_AXI_ACP_0_awvalid      ,
input       [2:0]      S_AXI_ACP_0_bid          ,
output                 S_AXI_ACP_0_bready       ,
input       [1:0]      S_AXI_ACP_0_bresp        ,
input                  S_AXI_ACP_0_bvalid       ,
output      [63:0]     S_AXI_ACP_0_wdata        ,
output      [2:0]      S_AXI_ACP_0_wid          ,
output                 S_AXI_ACP_0_wlast        ,
input                  S_AXI_ACP_0_wready       ,
output      [7:0]      S_AXI_ACP_0_wstrb        ,
output                 S_AXI_ACP_0_wvalid
    );

reg         t_tx_rdy   =0;
wire        awready      ;
reg [31:0]  awaddr     =0;
reg [2:0]   awid       =0;
reg         awvalid    =0;
reg         wen        =0;
reg         wcmpt      =0;
localparam S_IDLE = 0,
           S_ADDR = 1,
           S_DATA = 2,
           S_CMPT = 3;
reg[1:0] state=S_CMPT;
always@(posedge clk)begin
	if(rst)begin
		state    <= S_CMPT;
		t_tx_rdy <= 0     ;
		awaddr   <= 0     ;
		awid     <= 0     ;
		awvalid  <= 0     ;
		wen      <= 0     ;
	end else begin
		case(state)
			S_IDLE :begin
				if(tx_en)begin
					t_tx_rdy <= 0         ;
					awaddr   <= tx_awaddr ;
					awid     <= tx_awid   ;
					awvalid  <= 1         ;
				end
			end
			S_ADDR :begin
				if(awready)begin
					awvalid <= 0;
					wen     <= 1;
				end
			end
			S_DATA :begin
				if(wcmpt)begin
					state <= S_CMPT;
					wen   <= 0     ;
				end
			end
			S_CMPT :begin
				state    <= S_IDLE;
				t_tx_rdy <= 1     ;
			end
		endcase
	end
end

wire        wready       ;
wire[2:0]   wid          ;
wire        t_tx_wdreq   ;
wire[63:0]  wdata        ;
reg         wlast      =0;
reg         wvalid     =0;
reg [3:0]   tx_wcnt    =0;
always@(posedge clk)begin
	if(!wen)begin
		wvalid <= 0;
		wcmpt  <= 0;
	end else begin
		if(wcmpt|wlast)begin
			wvalid <= 0;
		end else begin
			wvalid <= 1;
		end
		if(wlast)begin
			wcmpt <= 1;
		end
		if(wready&(&tx_wcnt[3:1]))begin
			wlast <= 1;
		end else begin
			wlast <= 0;
		end
	end
end

always@(posedge clk)begin
	if(!wvalid)begin
		tx_wcnt <= 0;
	end else begin
		if(wready)begin
			tx_wcnt <= tx_wcnt + 1;
		end
	end
end

assign wid        = awid         ;
assign tx_rdy     = t_tx_rdy     ;
assign tx_wdreq   = t_tx_wdreq   ;
assign t_tx_wdreq = wvalid&wready;
assign wdata      = tx_wdata     ;

assign awready  = S_AXI_ACP_0_awready  ;
assign S_AXI_ACP_0_awaddr   = awaddr   ;
assign S_AXI_ACP_0_awid     = awid     ;
assign S_AXI_ACP_0_awvalid  = awvalid  ;
assign wready   = S_AXI_ACP_0_wready   ;
assign S_AXI_ACP_0_wdata    = wdata    ;
assign S_AXI_ACP_0_wid      = wid      ;
assign S_AXI_ACP_0_wlast    = wlast    ;
assign S_AXI_ACP_0_wvalid   = wvalid   ;

assign S_AXI_ACP_0_awburst  = 0;
assign S_AXI_ACP_0_awcache  = 0;
assign S_AXI_ACP_0_awlen    = 0;
assign S_AXI_ACP_0_awlock   = 0;
assign S_AXI_ACP_0_awprot   = 0;
assign S_AXI_ACP_0_awqos    = 0;
assign S_AXI_ACP_0_awsize   = 0;
assign S_AXI_ACP_0_awuser   = 0;
assign S_AXI_ACP_0_wstrb    = 0;
assign S_AXI_ACP_0_bready   = 0;

endmodule
