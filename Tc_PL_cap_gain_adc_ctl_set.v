`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 11:53:53
// Design Name:
// Module Name: Tc_PL_cap_gain_adc_ctl_set
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


module Tc_PL_cap_gain_adc_ctl_set
#(
parameter GDAC0_0 = 24,
          SPI0_0  = 8
)(
input                     clk                ,
input                     rst                ,
input      [GDAC0_0-1:0]  dac_value          ,
input                     dac_en             ,
output                    dac_cmpt           ,
input                     stx_idle           ,
input                     stx_dreq           ,
output                    stx_valid          ,
output     [SPI0_0-1:0]   stx_data
    );

reg              t_dac_cmpt  =0;
reg              t_stx_valid =0;
reg [SPI0_0-1:0] t_stx_data  =0;

reg[1:0] tx_cnt=0;

localparam S_INIT = 0,
           S_TXD  = 1,
           S_DEL  = 2,
           S_CMPT = 3;
reg[1:0] state = S_INIT;
always@(posedge clk)begin
	if(!dac_en)begin
		state       <= S_INIT ;
		t_dac_cmpt  <= 0      ;
		t_stx_valid <= 0      ;
	end else begin
		case(state)
			S_INIT :begin
				state       <= S_TXD  ;
				t_stx_valid <= 1      ;
			end
			S_TXD :begin
				if(tx_cnt==3)begin
					state       <= S_DEL  ;
					t_stx_valid <= 0      ;
				end
			end
			S_DEL  :begin
				if(stx_idle)begin
					state       <= S_CMPT ;
					t_dac_cmpt  <= 1      ;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

always@(posedge clk)begin
	if(!dac_en)begin
		tx_cnt <= 0;
	end else begin
		if(stx_valid&stx_dreq)begin
			tx_cnt <= tx_cnt + 1;
		end
	end
end

always@(posedge clk)begin
	case(tx_cnt)
		0:t_stx_data <= dac_value[(SPI0_0*0)+:SPI0_0];
		1:t_stx_data <= dac_value[(SPI0_0*1)+:SPI0_0];
		2:t_stx_data <= dac_value[(SPI0_0*2)+:SPI0_0];
	endcase
end

assign dac_cmpt  = t_dac_cmpt  ;
assign stx_valid = t_stx_valid ;
assign stx_data  = t_stx_data  ;

endmodule
