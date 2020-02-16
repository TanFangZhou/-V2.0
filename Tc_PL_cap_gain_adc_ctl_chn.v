`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 11:53:53
// Design Name:
// Module Name: Tc_PL_cap_gain_adc_ctl_chn
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


module Tc_PL_cap_gain_adc_ctl_chn
#(
parameter CAP0_12 = 32,
          GDAC0_0 = 24
)(
input                     clk                ,
input                     rst                ,
input                     gset_en            ,
output                    gset_adc_cmpt      ,
input      [CAP0_12-1:0]  gset_dacA          ,
input      [CAP0_12-1:0]  gset_dacB          ,
output     [GDAC0_0-1:0]  dac_value          ,
output                    dac_en             ,
input                     dac_cmpt
    );

wire[2:0]  DAC_CHA_CMD = 3'b011                                 ;
wire[2:0]  DAC_CHA_ADR = 3'b000                                 ;
wire[15:0] DAC_CHA_DAT = gset_dacA                              ;
wire[23:0] DAC_CHA     = {DAC_CHA_CMD,DAC_CHA_ADR,DAC_CHA_DAT}  ;
wire[2:0]  DAC_CHB_CMD = 3'b011                                 ;
wire[2:0]  DAC_CHB_ADR = 3'b001                                 ;
wire[15:0] DAC_CHB_DAT = gset_dacB                              ;
wire[23:0] DAC_CHB     = {DAC_CHB_CMD,DAC_CHB_ADR,DAC_CHB_DAT}  ;

reg                t_gset_adc_cmpt =0;
reg [GDAC0_0-1:0]  t_dac_value     =0;
reg                t_dac_en        =0;

reg [0:0] chn_cnt=0;

localparam S_DATA = 0,
           S_TXD  = 1,
           S_NEXT = 2,
           S_CMPT = 3;
reg[1:0] state = S_DATA;
always@(posedge clk)begin
	if(!gset_en)begin
		state           <= S_DATA;
		t_gset_adc_cmpt <= 0     ;
		t_dac_en        <= 0     ;
		chn_cnt         <= 0     ;
	end else begin
		case(state)
			S_DATA :begin
				t_dac_en <= 1    ;
				state    <= S_TXD;
			end
			S_TXD  :begin
				if(dac_cmpt)begin
					t_dac_en <= 0     ;
					state    <= S_NEXT;
				end
			end
			S_NEXT:begin
				if(chn_cnt==1)begin
					state <= S_CMPT;
				end else begin
					state <= S_DATA;
				end
				chn_cnt <= chn_cnt + 1;
			end
			S_CMPT:begin
				t_gset_adc_cmpt <= 1;
			end
		endcase
	end
end

always@(posedge clk)begin
	case(chn_cnt)
		0:t_dac_value <= DAC_CHA;
		1:t_dac_value <= DAC_CHB;
	endcase
end

assign gset_adc_cmpt = t_gset_adc_cmpt ;
assign dac_value     = t_dac_value     ;
assign dac_en        = t_dac_en        ;

endmodule
