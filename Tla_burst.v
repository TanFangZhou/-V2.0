`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 16:09:27
// Design Name:
// Module Name: Tla_burst
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


module Tla_burst
#(
parameter TOP0_0  = 3         ,
          TOP0_1  = 7         ,
          TOP0_2  = 2         ,
          TOP0_3  = 12        ,
          TOP0_4  = 4         ,
          ADC0_0  = TOP0_1*2  ,
          ADC0_1  = ADC0_0*4
)(
input                    Gc_clk125        ,
input                    Gc_rst           ,
output    [ADC0_1-1:0]   Gc_merge_data    ,
output                   Gc_merge_datv    ,
input                    Gc_merge_datr    ,
input                    Ga_clk62         ,
input     [ADC0_1-1:0]   Ga_merge_data    ,
input                    Ga_merge_datv    ,
input                    Ga_clk50         ,
input                    Ga_mem_reset
    );

wire              ff0_rst       ;
wire              ff0_wr_clk    ;
wire              ff0_rd_clk    ;
wire[ADC0_1-1:0]  ff0_din       ;
wire              ff0_wr_en     ;
wire              ff0_rd_en     ;
wire[ADC0_1-1:0]  ff0_dout      ;
wire              ff0_full      ;
wire              ff0_empty     ;
wire              ff0_prog_full ;
fifo_generator_0 your_instance_name (
.rst        (ff0_rst      ),// input wire rst
.wr_clk     (ff0_wr_clk   ),// input wire wr_clk
.rd_clk     (ff0_rd_clk   ),// input wire rd_clk
.din        (ff0_din      ),// input wire [55 : 0] din
.wr_en      (ff0_wr_en    ),// input wire wr_en
.rd_en      (ff0_rd_en    ),// input wire rd_en
.dout       (ff0_dout     ),// output wire [55 : 0] dout
.full       (ff0_full     ),// output wire full
.empty      (ff0_empty    ),// output wire empty
.prog_full  (ff0_prog_full) // output wire prog_full
);

assign ff0_rst       = Ga_mem_reset   ;
assign ff0_wr_clk    = Ga_clk62       ;
assign ff0_rd_clk    = Gc_clk125      ;
assign ff0_din       = Ga_merge_data  ;
assign ff0_wr_en     = Ga_merge_datv  ;
assign ff0_rd_en     = Gc_merge_datr  ;
assign Gc_merge_data = ff0_dout       ;
assign Gc_merge_datv = ff0_prog_full  ;

endmodule
