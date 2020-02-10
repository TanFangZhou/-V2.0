`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 12:20:59
// Design Name:
// Module Name: Tc_PS_ACP
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


module Tc_PS_ACP(
input                  clk                      ,
input                  rst                      ,
input                  tx_en                    ,
output                 tx_rdy                   ,
input       [31:0]     tx_awaddr                ,
input       [2:0]      tx_awid                  ,
input       [63:0]     tx_wdata                 ,
output                 tx_wdreq                 ,
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
input       [63:0]     S_AXI_ACP_0_rdata        ,
input       [2:0]      S_AXI_ACP_0_rid          ,
input                  S_AXI_ACP_0_rlast        ,
output                 S_AXI_ACP_0_rready       ,
input       [1:0]      S_AXI_ACP_0_rresp        ,
input                  S_AXI_ACP_0_rvalid       ,
output      [63:0]     S_AXI_ACP_0_wdata        ,
output      [2:0]      S_AXI_ACP_0_wid          ,
output                 S_AXI_ACP_0_wlast        ,
input                  S_AXI_ACP_0_wready       ,
output      [7:0]      S_AXI_ACP_0_wstrb        ,
output                 S_AXI_ACP_0_wvalid
    );

Tc_PS_ACP_tx
Tc_PS_ACP_tx_ins0
(
.clk                     (clk                     ),
.rst                     (rst                     ),
.tx_en                   (tx_en                   ),
.tx_rdy                  (tx_rdy                  ),
.tx_awaddr               (tx_awaddr               ),
.tx_awid                 (tx_awid                 ),
.tx_wdata                (tx_wdata                ),
.tx_wdreq                (tx_wdreq                ),
.S_AXI_ACP_0_awaddr      (S_AXI_ACP_0_awaddr      ),
.S_AXI_ACP_0_awburst     (S_AXI_ACP_0_awburst     ),
.S_AXI_ACP_0_awcache     (S_AXI_ACP_0_awcache     ),
.S_AXI_ACP_0_awid        (S_AXI_ACP_0_awid        ),
.S_AXI_ACP_0_awlen       (S_AXI_ACP_0_awlen       ),
.S_AXI_ACP_0_awlock      (S_AXI_ACP_0_awlock      ),
.S_AXI_ACP_0_awprot      (S_AXI_ACP_0_awprot      ),
.S_AXI_ACP_0_awqos       (S_AXI_ACP_0_awqos       ),
.S_AXI_ACP_0_awready     (S_AXI_ACP_0_awready     ),
.S_AXI_ACP_0_awsize      (S_AXI_ACP_0_awsize      ),
.S_AXI_ACP_0_awuser      (S_AXI_ACP_0_awuser      ),
.S_AXI_ACP_0_awvalid     (S_AXI_ACP_0_awvalid     ),
.S_AXI_ACP_0_bid         (S_AXI_ACP_0_bid         ),
.S_AXI_ACP_0_bready      (S_AXI_ACP_0_bready      ),
.S_AXI_ACP_0_bresp       (S_AXI_ACP_0_bresp       ),
.S_AXI_ACP_0_bvalid      (S_AXI_ACP_0_bvalid      ),
.S_AXI_ACP_0_wdata       (S_AXI_ACP_0_wdata       ),
.S_AXI_ACP_0_wid         (S_AXI_ACP_0_wid         ),
.S_AXI_ACP_0_wlast       (S_AXI_ACP_0_wlast       ),
.S_AXI_ACP_0_wready      (S_AXI_ACP_0_wready      ),
.S_AXI_ACP_0_wstrb       (S_AXI_ACP_0_wstrb       ),
.S_AXI_ACP_0_wvalid      (S_AXI_ACP_0_wvalid      )
    );

Tc_PS_ACP_rx
Tc_PS_ACP_rx_ins0
(
.clk                   (clk                  ),
.rst                   (rst                  ),
.S_AXI_ACP_0_araddr    (S_AXI_ACP_0_araddr   ),
.S_AXI_ACP_0_arburst   (S_AXI_ACP_0_arburst  ),
.S_AXI_ACP_0_arcache   (S_AXI_ACP_0_arcache  ),
.S_AXI_ACP_0_arid      (S_AXI_ACP_0_arid     ),
.S_AXI_ACP_0_arlen     (S_AXI_ACP_0_arlen    ),
.S_AXI_ACP_0_arlock    (S_AXI_ACP_0_arlock   ),
.S_AXI_ACP_0_arprot    (S_AXI_ACP_0_arprot   ),
.S_AXI_ACP_0_arqos     (S_AXI_ACP_0_arqos    ),
.S_AXI_ACP_0_arready   (S_AXI_ACP_0_arready  ),
.S_AXI_ACP_0_arsize    (S_AXI_ACP_0_arsize   ),
.S_AXI_ACP_0_aruser    (S_AXI_ACP_0_aruser   ),
.S_AXI_ACP_0_arvalid   (S_AXI_ACP_0_arvalid  ),
.S_AXI_ACP_0_rdata     (S_AXI_ACP_0_rdata    ),
.S_AXI_ACP_0_rid       (S_AXI_ACP_0_rid      ),
.S_AXI_ACP_0_rlast     (S_AXI_ACP_0_rlast    ),
.S_AXI_ACP_0_rready    (S_AXI_ACP_0_rready   ),
.S_AXI_ACP_0_rresp     (S_AXI_ACP_0_rresp    ),
.S_AXI_ACP_0_rvalid    (S_AXI_ACP_0_rvalid   )
    );

endmodule
