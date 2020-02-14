`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 11:28:13
// Design Name:
// Module Name: Tc_PL_bus_buff
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


module Tc_PL_bus_buff
#(
parameter AGP0_21	= 6    ,
	        AGP0_22	= 2    ,
	        AGP0_23	= 9    ,
	        AGP0_24	= 8    ,
	        AGP0_25	= 8    ,
	        AGP0_26	= 8    ,
	        AGP0_27	= 16
)(
input                     clk            ,
input                     rst            ,
input      [AGP0_22-1:0]  gp0_b1         ,
input      [AGP0_23-1:0]  gp0_b2         ,
output     [AGP0_24-1:0]  gp0_b3         ,
output     [AGP0_25-1:0]  gp0_b4         ,
output     [AGP0_26-1:0]  gp0_b5         ,
input                     gp0_b2w        ,
input                     gp0_b4r        ,
input                     txbo_req       ,
output     [AGP0_23-1:0]  txbo_data      ,
output                    txb_full       ,
output                    txb_empty      ,
input      [AGP0_25-1:0]  rxbi_data      ,
input                     rxbi_valid     ,
output                    rxb_full       ,
output                    rxb_empty
    );

wire           ff0_clk     ;
wire           ff0_srst    ;
wire [8:0]     ff0_din     ;
wire           ff0_wr_en   ;
wire           ff0_rd_en   ;
wire [8:0]     ff0_dout    ;
wire           ff0_full    ;
wire           ff0_empty   ;
wire [9:0]     ff0_cnt     ;
fifo_generator_1 spi_tx (
.clk        (ff0_clk     ),// input wire clk
.srst       (ff0_srst    ),// input wire srst
.din        (ff0_din     ),// input wire [8 : 0] din
.wr_en      (ff0_wr_en   ),// input wire wr_en
.rd_en      (ff0_rd_en   ),// input wire rd_en
.dout       (ff0_dout    ),// output wire [8 : 0] dout
.full       (ff0_full    ),// output wire full
.empty      (ff0_empty   ),// output wire empty
.data_count (ff0_cnt     ) // output wire [9 : 0] data_count
);

assign ff0_clk   = clk        ;
assign ff0_srst  = gp0_b1[1]  ;
assign ff0_din   = gp0_b2     ;
assign ff0_wr_en = gp0_b2w    ;
assign ff0_rd_en = txbo_req   ;
assign txbo_data = ff0_dout   ;
assign txb_full  = ff0_full   ;
assign txb_empty = ff0_empty  ;
assign gp0_b3    = ff0_cnt    ;

wire           ff1_clk     ;
wire           ff1_srst    ;
wire [8:0]     ff1_din     ;
wire           ff1_wr_en   ;
wire           ff1_rd_en   ;
wire [8:0]     ff1_dout    ;
wire           ff1_full    ;
wire           ff1_empty   ;
wire [9:0]     ff1_cnt     ;
fifo_generator_1 spi_rx (
.clk        (ff1_clk     ),// input wire clk
.srst       (ff1_srst    ),// input wire srst
.din        (ff1_din     ),// input wire [8 : 0] din
.wr_en      (ff1_wr_en   ),// input wire wr_en
.rd_en      (ff1_rd_en   ),// input wire rd_en
.dout       (ff1_dout    ),// output wire [8 : 0] dout
.full       (ff1_full    ),// output wire full
.empty      (ff1_empty   ),// output wire empty
.data_count (ff1_cnt     ) // output wire [9 : 0] data_count
);

assign ff1_clk   = clk          ;
assign ff1_srst  = gp0_b1[2]    ;
assign ff1_din   = rxbi_data    ;
assign ff1_wr_en = rxbi_valid   ;
assign ff1_rd_en = gp0_b4r      ;
assign gp0_b4    = ff1_dout     ;
assign rxb_full  = ff1_full     ;
assign rxb_empty = ff1_empty    ;
assign gp0_b5    = ff1_cnt      ;

endmodule
