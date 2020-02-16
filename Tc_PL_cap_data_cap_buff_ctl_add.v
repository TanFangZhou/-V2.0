`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 17:59:27
// Design Name:
// Module Name: Tc_PL_cap_data_cap_buff_ctl_add
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


module Tc_PL_cap_data_cap_buff_ctl_add
#(
parameter ADC0_1  = 56  ,
          CAP0_15 = 128
)(
input                     clk               ,
input                     rst               ,
input                     add_add           ,
input      [ADC0_1 -1:0]  data              ,
input                     data_valid        ,
output     [CAP0_15-1:0]  buff_din          ,
output                    buff_din_valid    ,
input      [CAP0_15-1:0]  buff_dout         ,
output                    buff_dout_req
    );

localparam WTH_BEAT = 5,
           DATA_NUM = 4;
localparam ADD0_0 = ADC0_1/DATA_NUM ,
           ADD0_1 = CAP0_15/DATA_NUM;

reg [CAP0_15-1:0]  t_buff_din        =0;
reg                t_buff_din_valid  =0;
reg                t_buff_dout_req   =0;

reg [ADC0_1 -1:0] t_data=0;
always@(posedge clk)begin
	if(rst)begin
		t_data <= 0;
	end else begin
		t_data <= data;
	end
end

always@(posedge clk)begin
	if(rst)begin
		t_buff_dout_req <= 0;
	end else begin
		if(add_add)begin
			if(data_valid)begin
				t_buff_dout_req <= 1;
			end else begin
				t_buff_dout_req <= 0;
			end
		end
	end
end

reg [ADC0_1 -1:0]  add0=0;
reg [CAP0_15-1:0]  add1=0;
always@(posedge clk)begin
	if(rst)begin
		add0 <= 0;
		add1 <= 0;
	end else begin
		add0 <= t_data;
		if(!add_add)begin
			add1 <= 0;
		end else begin
			add1 <= buff_dout;
		end
	end
end

wire[CAP0_15-1:0] add_out;
genvar Gen_add;
generate
  for (Gen_add=0; Gen_add < DATA_NUM; Gen_add=Gen_add+1)
  begin
		xbip_dsp48_macro_0 your_instance_name (
		.CLK (clk                                ),// input wire CLK
		.A   (add0   [(Gen_add*ADD0_0)+:ADD0_0]  ),// input wire [13 : 0] A
		.C   (add1   [(Gen_add*ADD0_1)+:ADD0_1]  ),// input wire [31 : 0] C
		.P   (add_out[(Gen_add*ADD0_1)+:ADD0_1]  ) // output wire [32 : 0] P
		);
  end
endgenerate

reg[WTH_BEAT-1:0] beat =0;
always@(posedge clk)begin
	if(rst)begin
		beat <= 0;
	end else begin
		beat <= {data_valid,beat[WTH_BEAT-1:1]};
	end
end

always@(posedge clk)begin
	if(rst)begin
		t_buff_din       <=0;
		t_buff_din_valid <=0;
	end else begin
		if(beat[0])begin
			t_buff_din       <=add_out;
			t_buff_din_valid <=1      ;
		end else begin
			t_buff_din_valid <=0;
		end
	end
end

assign buff_din       = t_buff_din       ;
assign buff_din_valid = t_buff_din_valid ;
assign buff_dout_req  = t_buff_dout_req  ;

endmodule
