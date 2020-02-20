`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/11 17:08:13
// Design Name:
// Module Name: Tc_PS_GP_wr_ass
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


module Tc_PS_GP_wr_ass(
input                      clk                      ,
input                      rst                      ,
input       [31:0]         addr                     ,
input                      wren                     ,
output                     gp0_c0w                  ,
output                     gp0_b0w                  ,
output                     gp0_b2w  	              ,
output                     gp0_r7w
    );

localparam WTH_ADDR = 32,
           WTH_ADDL = 10,
           WTH_ADDH = WTH_ADDR-WTH_ADDL;
wire[WTH_ADDH-1:0] addr_H;
wire[WTH_ADDL-1:0] addr_L;
assign {addr_H,addr_L} = addr;

localparam ADDH_GLABOL  = 0,
           ADDH_CAPTURE = 1,
           ADDH_LASER   = 2,
           ADDH_BUS     = 3,
           ADDH_OTHER   = 4;
reg[4:0] add_sel=0;
always@(posedge clk)begin
	case(addr_H)
		ADDH_GLABOL  :add_sel <= 5'b10000;
		ADDH_CAPTURE :add_sel <= 5'b01000;
		ADDH_LASER   :add_sel <= 5'b00100;
		ADDH_BUS     :add_sel <= 5'b00010;
		ADDH_OTHER   :add_sel <= 5'b00001;
		default      :add_sel <= 5'b00000;
	endcase
end

wire add_g,add_c,add_d,add_b,add_r;
assign {add_g,add_c,add_d,add_b,add_r} = add_sel;

reg t_gp0_c0w =0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_c0w <= 0;
	end else if(add_c&wren)begin
		case(addr_L)
			0:t_gp0_c0w <= 1;
		endcase
	end else begin
		t_gp0_c0w <= 0;
	end
end

reg t_gp0_b0w =0;
reg t_gp0_b2w =0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_b0w <= 0;
		t_gp0_b2w <= 0;
	end else if(add_b&wren)begin
		case(addr_L)
			0:t_gp0_b0w <= 1;
			2:t_gp0_b2w <= 1;
		endcase
	end else begin
		t_gp0_b0w <= 0;
		t_gp0_b2w <= 0;
	end
end

reg t_gp0_r7w =0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_r7w <= 0;
	end else if(add_r&wren)begin
		case(addr_L)
			7:t_gp0_r7w <= 1;
		endcase
	end else begin
		t_gp0_r7w <= 0;
	end
end

assign gp0_c0w = t_gp0_c0w ;
assign gp0_b0w = t_gp0_b0w ;
assign gp0_b2w = t_gp0_b2w ;
assign gp0_r7w = t_gp0_r7w ;

endmodule
