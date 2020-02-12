`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 16:40:22
// Design Name:
// Module Name: Tla_single_200
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


module Tla_single_200
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
input                    Gc_cap_mode      ,
input     [TOP0_0-1:0]   Gc_cap_wdis      ,
input     [LDD0_0-1:0]   Gc_cap_plus      ,
input     [TOP0_0-1:0]   Gc_com_wdis      ,
input     [LDD0_0-1:0]   Gc_com_plus      ,
input                    Gc_com_open      ,
input                    Gc_com_close     ,
output    [TOP0_0-1:0]   Gc_wdis          ,
input                    Ga_clk200        ,
output                   Ga_cap_mode      ,
output    [TOP0_0-1:0]   Ga_cap_wdis      ,
output    [LDD0_0-1:0]   Ga_cap_plus      ,
output    [TOP0_0-1:0]   Ga_com_wdis      ,
output    [LDD0_0-1:0]   Ga_com_plus      ,
output                   Ga_com_open      ,
output                   Ga_com_close     ,
input     [TOP0_0-1:0]   Ga_wdis
    );

reg t_Gc_com_open   =0;
reg t_Gc_com_close  =0;
reg t_Ga_com_open   =0;
reg t_Ga_com_close  =0;

reg[0:0] Gc_delcnt_open =0;
reg[0:0] Gc_delcnt_close=0;
always@(posedge Gc_clk125)begin
	if(Gc_rst)begin
		t_Gc_com_open   <= 0;
		Gc_delcnt_open  <= 0;
		t_Gc_com_close  <= 0;
		Gc_delcnt_close <= 0;
	end else begin
		if(Gc_com_open)begin
			t_Gc_com_open <= 1;
		end else if(&Gc_delcnt_open)begin
			t_Gc_com_open <= 0;
		end
		if(t_Gc_com_open)begin
			Gc_delcnt_open <= Gc_delcnt_open + 1;
		end else begin
			Gc_delcnt_open <= 0;
		end
		if(Gc_com_close)begin
			t_Gc_com_close <= 1;
		end else if(&Gc_delcnt_close)begin
			t_Gc_com_close <= 0;
		end
		if(t_Gc_com_close)begin
			Gc_delcnt_close <= Gc_delcnt_close + 1;
		end else begin
			Gc_delcnt_close <= 0;
		end
	end
end

reg[1:0] Ga_open   =0;
reg[1:0] Ga_close  =0;
reg      Ga_open_v =0;
reg      Ga_close_v=0;
always@(posedge Ga_clk200)begin
	Ga_open    <= {Ga_open ,t_Gc_com_open };
	Ga_close   <= {Ga_close,t_Gc_com_close};
	Ga_open_v  <= &Ga_open &t_Gc_com_open  ;
	Ga_close_v <= &Ga_close&t_Gc_com_close ;
end

reg      l_Ga_open_v =0;
reg      l_Ga_close_v=0;
always@(posedge Ga_clk200)begin
	l_Ga_open_v    <= Ga_open_v  ;
	l_Ga_close_v   <= Ga_close_v ;
	t_Ga_com_open  <= Ga_open_v  & l_Ga_open_v  ;
	t_Ga_com_close <= Ga_close_v & l_Ga_close_v ;
end

assign Gc_cap_mode  = Ga_cap_mode   ;
assign Gc_cap_wdis  = Ga_cap_wdis   ;
assign Gc_cap_plus  = Ga_cap_plus   ;
assign Gc_com_wdis  = Ga_com_wdis   ;
assign Gc_com_plus  = Ga_com_plus   ;
assign Gc_wdis      = Ga_wdis       ;
assign Ga_com_open  = t_Ga_com_open ;
assign Ga_com_close = t_Ga_com_close;

endmodule
