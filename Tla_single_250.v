`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 16:40:22
// Design Name:
// Module Name: Tla_single_250
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


module Tla_single_250
#(
parameter TOP0_0  = 3         ,
          TOP0_1  = 7         ,
          TOP0_2  = 2         ,
          TOP0_3  = 12        ,
          TOP0_4  = 4         ,
          ADC0_0  = TOP0_1*2  ,
          ADC0_1  = ADC0_0*4  ,
          LDD0_0  = 32        ,
          CAP0_0  = 4         ,
          CAP0_1  = 2
)(
input                    Gc_clk125        ,
input                    Gc_rst           ,
output                   Gc_adc_of        ,
output    [ADC0_0-1:0]   Gc_adc_data      ,
input                    Ga_clk250        ,
input                    Ga_adc_of        ,
input     [ADC0_0-1:0]   Ga_adc_data
    );

reg                t_Gc_adc_of      =0;
reg [ADC0_0-1:0]   t_Gc_adc_data    =0;
reg                t_Ga_adc_of      =0;
reg [ADC0_0-1:0]   t_Ga_adc_data    =0;

reg      Gc_req    =0;
reg[1:0] Gc_req_cnt=0;
always@(posedge Gc_clk125)begin
	if(Gc_rst)begin
		Gc_req     <= 0;
		Gc_req_cnt <= 0;
	end else begin
		if(Gc_req_cnt==0)begin
			Gc_req <= 1;
		end else begin
			Gc_req <= 0;
		end
		Gc_req_cnt <= Gc_req_cnt + 1;
	end
end

always@(posedge Gc_clk125)begin
	if(Gc_rst)begin
		t_Gc_adc_of   <= 0;
		t_Gc_adc_data <= 0;
	end else begin
		if(&Gc_req_cnt)begin
			t_Gc_adc_of   <= t_Ga_adc_of  ;
			t_Gc_adc_data <= t_Ga_adc_data;
		end
	end
end

always@(posedge Ga_clk250)begin
	if(Gc_req)begin
		t_Ga_adc_of   <= Ga_adc_of   ;
		t_Ga_adc_data <= Ga_adc_data ;
	end
end

assign Gc_adc_of   = t_Gc_adc_of   ;
assign Gc_adc_data = t_Gc_adc_data ;

endmodule
