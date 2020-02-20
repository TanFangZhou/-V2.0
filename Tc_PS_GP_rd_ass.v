`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/11 16:41:19
// Design Name:
// Module Name: Tc_PS_GP_rd_ass
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


module Tc_PS_GP_rd_ass(
input                 clk            ,
input                 rst            ,
input                 rden           ,
input       [31:0]    addr           ,
output                gp0_b4r
    );

localparam ADDH_GLABOL  = 0,
           ADDH_CAPTURE = 1,
           ADDH_LASER   = 2,
           ADDH_BUS     = 3,
           ADDH_OTHER   = 4;

localparam WTH_ADDR = 32,
           WTH_ADDL = 10,
           WTH_ADDH = WTH_ADDR-WTH_ADDL;
wire[WTH_ADDH-1:0] addr_H;
wire[WTH_ADDL-1:0] addr_L;

reg gp0_b4r_l=0;
reg gp0_b4r_h=0;
reg gp0_b4r_t=0;
always@(posedge clk)begin
	case(addr_L)
		4        :gp0_b4r_l <= 1;
		default  :gp0_b4r_l <= 0;
	endcase
	case(addr_H)
		ADDH_BUS :gp0_b4r_h <= 1;
		default  :gp0_b4r_h <= 0;
	endcase
	if(rden&gp0_b4r_l&gp0_b4r_h)begin
		gp0_b4r_t <= 1;
	end else begin
		gp0_b4r_t <= 0;
	end
end

assign {addr_H,addr_L} = addr     ;
assign gp0_b4r         = gp0_b4r_t;

endmodule
