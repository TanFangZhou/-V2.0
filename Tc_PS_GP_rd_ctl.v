`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/11 14:48:21
// Design Name:
// Module Name: Tc_PS_GP_rd_ctl
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


module Tc_PS_GP_rd_ctl(
input                 clk                      ,
input                 rst                      ,
output      [31:0]    addr                     ,
input       [31:0]    data                     ,
output                rden                     ,
input       [31:0]    M_AXI_GP0_0_araddr       ,
input       [1:0]     M_AXI_GP0_0_arburst      ,
input       [3:0]     M_AXI_GP0_0_arcache      ,
input       [11:0]    M_AXI_GP0_0_arid         ,
input       [3:0]     M_AXI_GP0_0_arlen        ,
input       [1:0]     M_AXI_GP0_0_arlock       ,
input       [2:0]     M_AXI_GP0_0_arprot       ,
input       [3:0]     M_AXI_GP0_0_arqos        ,
output                M_AXI_GP0_0_arready      ,
input       [2:0]     M_AXI_GP0_0_arsize       ,
input                 M_AXI_GP0_0_arvalid      ,
output      [31:0]    M_AXI_GP0_0_rdata        ,
output      [11:0]    M_AXI_GP0_0_rid          ,
output                M_AXI_GP0_0_rlast        ,
input                 M_AXI_GP0_0_rready       ,
output      [1:0]     M_AXI_GP0_0_rresp        ,
output                M_AXI_GP0_0_rvalid
    );

reg [31:0] t_addr    =0;
reg        t_rden    =0;

reg        arready   =0;
reg [31:0] rdata     =0;
reg [11:0] rid       =0;
reg        rvalid    =0;
wire[31:0] araddr      ;
wire[11:0] arid        ;
wire       arvalid     ;
wire       rready      ;

localparam S_IDLE = 0,
           S_ADDR = 1,
           S_DATA = 2,
           S_CMPT = 3;
reg[1:0] state    = S_CMPT;
reg[1:0] rdel_cnt = 0     ;
always@(posedge clk)begin
	if(rst)begin
		state    <= S_CMPT;
		rdel_cnt <= 0     ;
		arready  <= 0     ;
		rdata    <= 0     ;
		rid      <= 0     ;
		rvalid   <= 0     ;
		t_addr   <= 0     ;
		t_rden   <= 0     ;
	end else begin
		case(state)
			S_IDLE :begin
				if(arvalid)begin
					state   <= S_ADDR  ;
					arready <= 0       ;
					rid     <= arid    ;
					t_addr  <= araddr  ;
				end
			end
			S_ADDR :begin
				rdel_cnt <= rdel_cnt + 1;
				if(&rdel_cnt)begin
					state  <= S_DATA;
					rdata  <= data  ;
					rvalid <= 1     ;
				end
			end
			S_DATA :begin
				if(rready)begin
					state  <= S_CMPT;
					rvalid <= 0     ;
					t_rden <= 1     ;
				end
			end
			S_CMPT :begin
				state   <= S_IDLE;
				arready <= 1     ;
				t_rden  <= 0     ;
			end
		endcase
	end
end

assign addr = t_addr ;
assign rden = t_rden ;

assign M_AXI_GP0_0_arready = arready             ;
assign M_AXI_GP0_0_rdata   = rdata               ;
assign M_AXI_GP0_0_rid     = rid                 ;
assign M_AXI_GP0_0_rvalid  = rvalid              ;
assign araddr              = M_AXI_GP0_0_araddr  ;
assign arid                = M_AXI_GP0_0_arid    ;
assign arvalid             = M_AXI_GP0_0_arvalid ;
assign rready              = M_AXI_GP0_0_rready  ;
assign M_AXI_GP0_0_rlast   = 0                   ;
assign M_AXI_GP0_0_rresp   = 0                   ;

endmodule
