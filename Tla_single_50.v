`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 16:40:22
// Design Name:
// Module Name: Tla_single_50
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


module Tla_single_50(
input                    Gc_clk125        ,
input                    Gc_rst           ,
input                    Gc_cap_trig      ,
output                   Gc_capr_rdy      ,
input                    Ga_clk50         ,
output                   Ga_cap_trig      ,
input                    Ga_capr_rdy
    );

reg[1:0] Ga_capr_rdy_c=0;
always@(posedge Gc_clk125)begin
	Ga_capr_rdy_c <= {Ga_capr_rdy_c,Ga_capr_rdy};
end

reg t_Gc_capr_rdy=0;
always@(posedge Gc_clk125)begin
	if(Gc_rst)begin
		t_Gc_capr_rdy <= 0;
	end else begin
		if(&Ga_capr_rdy_c&Ga_capr_rdy)begin
			t_Gc_capr_rdy <= 1;
		end else begin
			t_Gc_capr_rdy <= 0;
		end
	end
end

assign Gc_capr_rdy = t_Gc_capr_rdy;

reg t_Ga_cap_trig=0;

reg      t_Gc_cap_trig  =0;
reg[2:0] Gc_cap_trig_cnt=0;
always@(posedge Gc_clk125)begin
	if(Gc_rst)begin
		t_Gc_cap_trig   <= 0;
		Gc_cap_trig_cnt <= 0;
	end else begin
		if(Gc_cap_trig)begin
			t_Gc_cap_trig <= 1;
		end else if(&Gc_cap_trig_cnt)begin
			t_Gc_cap_trig <= 0;
		end
		if(t_Gc_cap_trig)begin
			Gc_cap_trig_cnt <= Gc_cap_trig_cnt + 1;
		end else begin
			Gc_cap_trig_cnt <= 0;
		end
	end
end

reg[1:0] t_Gc_cap_trig_a=0;
always@(posedge Ga_clk50)begin
	t_Gc_cap_trig_a <= {t_Gc_cap_trig_a,t_Gc_cap_trig};
end

always@(posedge Ga_clk50)begin
	if(&t_Gc_cap_trig_a&t_Gc_cap_trig)begin
		t_Ga_cap_trig <= 1;
	end else begin
		t_Ga_cap_trig <= 0;
	end
end

endmodule
