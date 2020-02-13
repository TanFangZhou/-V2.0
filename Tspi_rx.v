`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 11:38:26
// Design Name:
// Module Name: Tspi_rx
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


module Tspi_rx
#(
parameter SPI0_0  = 8
)(
input                     clk         ,
input                     rst         ,
output  [SPI0_0-1:0]      rx_data     ,
output                    rx_valid    ,
input                     CSN         ,
input                     SCLK        ,
input                     MISO
    );

function integer f_msb (input integer value);
  begin
    value = value>>1;
    for(f_msb=0; value>0; f_msb=f_msb+1)
    value = value>>1;
  end
endfunction

localparam SPI0_00 = f_msb(SPI0_0-1)+1;

reg[SPI0_0-1:0] t_rx_data  =0;
reg             t_rx_valid =0;

reg[SPI0_0 -1:0] rx_shift       =0;
reg[SPI0_00-1:0] rx_shift_cnt   =0;
reg              rx_shift_valid =0;

reg l_CSN  =1;
reg l_SCLK =0;
reg l_MISO =0;
always@(posedge clk)begin
	l_CSN  <= CSN  ;
	l_SCLK <= SCLK ;
	l_MISO <= MISO ;
end

always@(posedge clk)begin
	if(l_CSN)begin
		rx_shift       <= 0;
		rx_shift_cnt   <= 0;
		rx_shift_valid <= 0;
	end else begin
		if((!SCLK)&l_SCLK)begin
			rx_shift     <= {l_MISO,rx_shift[0+:SPI0_0-1]};
			rx_shift_cnt <= rx_shift_cnt + 1;
		end
		if((!SCLK)&l_SCLK&(&rx_shift_cnt))begin
			rx_shift_valid <= 1;
		end else begin
			rx_shift_valid <= 0;
		end
	end
end

always@(posedge clk)begin
	if(rst)begin
		t_rx_data  <= 0;
		t_rx_valid <= 0;
	end else begin
		if(rx_shift_valid)begin
			t_rx_data  <= rx_shift;
			t_rx_valid <= 1       ;
		end else begin
			t_rx_valid <= 0       ;
		end
	end
end

assign rx_data  = t_rx_data  ;
assign rx_valid = t_rx_valid ;

endmodule
