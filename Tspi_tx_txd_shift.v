`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/13 15:30:19
// Design Name:
// Module Name: Tspi_tx_txd_shift
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


module Tspi_tx_txd_shift
#(
parameter SPI0_0  = 8 ,
          SPI0_1  = 32
)(
input                     clk         ,
input                     rst         ,
input                     shift_en    ,
output                    shift_cmpt  ,
input    [SPI0_0-1:0]     tx_data     ,
input    [SPI0_1-1:0]     tx_div      ,
output                    SCLK        ,
output                    MOSI
    );

function integer f_msb (input integer value);
  begin
    value = value>>1;
    for(f_msb=0; value>0; f_msb=f_msb+1)
    value = value>>1;
  end
endfunction

localparam SPI0_00 = f_msb(SPI0_0-1)+1;

reg t_shift_cmpt=0;
reg t_SCLK      =0;
reg t_MOSI      =0;

reg[SPI0_0 -1:0] tx_shift     =0;
reg[SPI0_00-1:0] tx_shift_cnt =0;
reg[SPI0_1 -1:0] tx_div_cnt   =0;
reg              tx_div_cnt_e =0;

localparam S_DOUT = 0,
           S_CMPT = 1;
reg[0:0] state=S_DOUT;
always@(posedge clk)begin
	if(!shift_en)begin
		state        <= S_DOUT;
		t_shift_cmpt <= 0     ;
	end else begin
		case(state)
			S_DOUT :begin
				if(&tx_shift_cnt&t_SCLK&tx_div_cnt_e)begin
					state        <= S_CMPT;
					t_shift_cmpt <= 1     ;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

always@(posedge clk)begin
	if(!shift_en)begin
		t_SCLK       <= 0      ;
		tx_shift_cnt <= 0      ;
		tx_div_cnt   <= 0      ;
		tx_div_cnt_e <= 0      ;
	end else begin
		case(state)
			S_DOUT :begin
				if(tx_div_cnt_e)begin
					t_SCLK <= !t_SCLK;
				end
				if(t_SCLK&tx_div_cnt_e)begin
					tx_shift_cnt <= tx_shift_cnt + 1;
				end
			end
			S_CMPT :begin

			end
		endcase
		if(tx_div_cnt>=tx_div)begin
			tx_div_cnt   <= 0;
			tx_div_cnt_e <= 1;
		end else begin
			tx_div_cnt   <= tx_div_cnt + 1;
			tx_div_cnt_e <= 0             ;
		end
	end
end

always@(posedge clk)begin
	if(!shift_en)begin
		t_MOSI   <= 0       ;
		tx_shift <= tx_data ;
	end else begin
		case(state)
			S_DOUT :begin
				if((!t_SCLK)&tx_div_cnt_e)begin
					{t_MOSI,tx_shift} <= {tx_shift,1'd0};
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

assign shift_cmpt = t_shift_cmpt  ;
assign SCLK       = t_SCLK        ;
assign MOSI       = t_MOSI        ;

endmodule
