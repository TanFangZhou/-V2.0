`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 15:56:14
// Design Name:
// Module Name: Tc_PL_cap_data_acptx
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


module Tc_PL_cap_data_acptx
#(
parameter CAP0_7  = 32  ,
	        CAP0_8  = 32  ,
          CAP0_15 = 128
)(
input                     clk             ,
input                     rst             ,
input                     tacp_en         ,
output                    tacp_cmpt       ,
input                     cap_crc_en      ,
input      [CAP0_7 -1:0]  cap_addr        ,
output     [CAP0_8 -1:0]  cap_crc32       ,
input                     buff_empty      ,
input      [CAP0_15-1:0]  buff_dout       ,
output                    buff_dout_req   ,
output                    acp0_tx_en      ,
input                     acp0_tx_rdy     ,
output     [31:0]         acp0_tx_awaddr  ,
output     [2:0]          acp0_tx_awid    ,
output     [63:0]         acp0_tx_wdata   ,
input                     acp0_tx_wdreq
    );

wire  [63:0]    crc0_data       ;
wire            crc0_data_valid ;
Tc_PL_cap_data_acptx_tx
#(
.CAP0_7  (CAP0_7  ),
.CAP0_8  (CAP0_8  ),
.CAP0_15 (CAP0_15 )
)
Tc_PL_cap_data_acptx_tx_ins0
(
.clk               (clk              ),
.rst               (rst              ),
.tacp_en           (tacp_en          ),
.tacp_cmpt         (tacp_cmpt        ),
.cap_addr          (cap_addr         ),
.buff_empty        (buff_empty       ),
.buff_dout         (buff_dout        ),
.buff_dout_req     (buff_dout_req    ),
.acp0_tx_en        (acp0_tx_en       ),
.acp0_tx_rdy       (acp0_tx_rdy      ),
.acp0_tx_awaddr    (acp0_tx_awaddr   ),
.acp0_tx_awid      (acp0_tx_awid     ),
.acp0_tx_wdata     (acp0_tx_wdata    ),
.acp0_tx_wdreq     (acp0_tx_wdreq    ),
.crc0_data         (crc0_data        ),
.crc0_data_valid   (crc0_data_valid  )
    );

Tc_PL_cap_data_acptx_crc
#(
.CAP0_8(CAP0_8)
)
Tc_PL_cap_data_acptx_crc_ins0
(
.clk             (clk             ),
.rst             (rst             ),
.crc_en          (cap_crc_en      ),
.crc32           (cap_crc32       ),
.crc_data        (crc0_data       ),
.crc_data_valid  (crc0_data_valid )
    );

endmodule
