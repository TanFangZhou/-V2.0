`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/10 15:04:23
// Design Name:
// Module Name: Tc_PS_ACP_rx
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


module Tc_PS_ACP_rx(
input                  clk                      ,
input                  rst                      ,
output      [31:0]     S_AXI_ACP_0_araddr       ,
output      [1:0]      S_AXI_ACP_0_arburst      ,
output      [3:0]      S_AXI_ACP_0_arcache      ,
output      [2:0]      S_AXI_ACP_0_arid         ,
output      [3:0]      S_AXI_ACP_0_arlen        ,
output      [1:0]      S_AXI_ACP_0_arlock       ,
output      [2:0]      S_AXI_ACP_0_arprot       ,
output      [3:0]      S_AXI_ACP_0_arqos        ,
input                  S_AXI_ACP_0_arready      ,
output      [2:0]      S_AXI_ACP_0_arsize       ,
output      [4:0]      S_AXI_ACP_0_aruser       ,
output                 S_AXI_ACP_0_arvalid      ,
input       [63:0]     S_AXI_ACP_0_rdata        ,
input       [2:0]      S_AXI_ACP_0_rid          ,
input                  S_AXI_ACP_0_rlast        ,
output                 S_AXI_ACP_0_rready       ,
input       [1:0]      S_AXI_ACP_0_rresp        ,
input                  S_AXI_ACP_0_rvalid
    );

assign S_AXI_ACP_0_araddr   = 0;
assign S_AXI_ACP_0_arburst  = 0;
assign S_AXI_ACP_0_arcache  = 0;
assign S_AXI_ACP_0_arid     = 0;
assign S_AXI_ACP_0_arlen    = 0;
assign S_AXI_ACP_0_arlock   = 0;
assign S_AXI_ACP_0_arprot   = 0;
assign S_AXI_ACP_0_arqos    = 0;

assign S_AXI_ACP_0_arsize   = 0;
assign S_AXI_ACP_0_aruser   = 0;
assign S_AXI_ACP_0_arvalid  = 0;

assign S_AXI_ACP_0_rready   = 0;

endmodule
