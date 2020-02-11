`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/11 17:08:13
// Design Name:
// Module Name: Tc_PS_GP_wr_ctl
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


module Tc_PS_GP_wr_ctl(
input                      clk                      ,
input                      rst                      ,
output      [31:0]         addr                     ,
output      [31:0]         data                     ,
output                     wren                     ,
input       [31:0]         M_AXI_GP0_0_awaddr       ,
input       [1:0]          M_AXI_GP0_0_awburst      ,
input       [3:0]          M_AXI_GP0_0_awcache      ,
input       [11:0]         M_AXI_GP0_0_awid         ,
input       [3:0]          M_AXI_GP0_0_awlen        ,
input       [1:0]          M_AXI_GP0_0_awlock       ,
input       [2:0]          M_AXI_GP0_0_awprot       ,
input       [3:0]          M_AXI_GP0_0_awqos        ,
output                     M_AXI_GP0_0_awready      ,
input       [2:0]          M_AXI_GP0_0_awsize       ,
input                      M_AXI_GP0_0_awvalid      ,
output      [11:0]         M_AXI_GP0_0_bid          ,
input                      M_AXI_GP0_0_bready       ,
output      [1:0]          M_AXI_GP0_0_bresp        ,
output                     M_AXI_GP0_0_bvalid       ,
input       [31:0]         M_AXI_GP0_0_wdata        ,
input       [11:0]         M_AXI_GP0_0_wid          ,
input                      M_AXI_GP0_0_wlast        ,
output                     M_AXI_GP0_0_wready       ,
input       [3:0]          M_AXI_GP0_0_wstrb        ,
input                      M_AXI_GP0_0_wvalid
    );

reg        awready   =0;
reg        wready    =0;
reg        bvalid    =0;
reg [11:0] bid       =0;
wire[31:0] awaddr      ;
wire       awvalid     ;
wire[11:0] awid        ;
wire       bready      ;
wire[31:0] wdata       ;
wire       wvalid      ;
reg [31:0] t_addr    =0;
reg [31:0] t_data    =0;
reg        t_wren    =0;

localparam S_IDLE = 0,
           S_ADDR = 1,
           S_DATA = 2,
           S_CMPT = 3;
reg[1:0] state=S_CMPT;
always@(posedge clk)begin
	if(rst)begin
		state      <= S_CMPT;
		awready    <= 0     ;
		wready     <= 0     ;
		bvalid     <= 0     ;
		bid        <= 0     ;
		t_addr     <= 0     ;
		t_data     <= 0     ;
		t_wren     <= 0     ;
	end else begin
		case(state)
			S_IDLE :begin
				if(awvalid)begin
					awready <= 0      ;
					wready  <= 1      ;
					bid     <= awid   ;
					t_addr  <= awaddr ;
					state   <= S_ADDR ;
				end
			end
			S_ADDR :begin
				if(wvalid)begin
					wready <= 0       ;
					t_data <= wdata   ;
					t_wren <= 1       ;
					bvalid <= 1       ;
					state  <= S_DATA  ;
				end
			end
			S_DATA :begin
				if(bready)begin
					bvalid <= 0        ;
					state  <= S_CMPT   ;
				end
				t_wren <= 0;
			end
			S_CMPT :begin
				awready <= 1         ;
				state   <= S_IDLE    ;
			end
		endcase
	end
end

assign addr = t_addr ;
assign data = t_data ;
assign wren = t_wren ;

assign M_AXI_GP0_0_awready = awready             ;
assign M_AXI_GP0_0_wready  = wready              ;
assign M_AXI_GP0_0_bvalid  = bvalid              ;
assign M_AXI_GP0_0_bid     = bid                 ;
assign M_AXI_GP0_0_bresp   = 0                   ;
assign awaddr              = M_AXI_GP0_0_awaddr  ;
assign awvalid             = M_AXI_GP0_0_awvalid ;
assign awid                = M_AXI_GP0_0_awid    ;
assign bready              = M_AXI_GP0_0_bready  ;
assign wdata               = M_AXI_GP0_0_wdata   ;
assign wvalid              = M_AXI_GP0_0_wvalid  ;

endmodule
