`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/11 17:08:13
// Design Name:
// Module Name: Tc_PS_GP_wr_data
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


module Tc_PS_GP_wr_data
#(
parameter AGP0_0	= 3    ,
	        AGP0_1	= 2    ,
	        AGP0_2	= 1    ,
	        AGP0_3	= 3    ,
	        AGP0_4	= 3    ,
	        AGP0_5	= 32   ,
	        AGP0_6	= 8    ,
	        AGP0_7	= 3    ,
	        AGP0_8	= 14   ,
	        AGP0_9	= 32   ,
	        AGP0_10	= 32   ,
	        AGP0_11	= 32   ,
	        AGP0_12	= 18   ,
	        AGP0_13	= 32   ,
	        AGP0_14	= 32   ,
	        AGP0_15	= 6    ,
	        AGP0_16	= 4    ,
	        AGP0_17	= 4    ,
	        AGP0_18	= 5    ,
	        AGP0_19	= 3    ,
	        AGP0_20	= 32   ,
	        AGP0_21	= 6    ,
	        AGP0_22	= 2    ,
	        AGP0_23	= 9    ,
	        AGP0_24	= 8    ,
	        AGP0_25	= 8    ,
	        AGP0_26	= 8    ,
	        AGP0_27	= 16   ,
	        AGP0_28	= 15   ,
	        AGP0_29	= 4    ,
	        AGP0_30	= 2    ,
	        AGP0_31	= 1    ,
	        AGP0_32	= 2    ,
	        AGP0_33	= 1    ,
	        AGP0_34	= 2    ,
	        AGP0_35	= 16
)(
input                      clk                      ,
input                      rst                      ,
input       [31:0]         addr                     ,
input       [31:0]         data                     ,
input                      wren                     ,
output      [AGP0_0 -1:0]  gp0_g0                   ,
output                     gp0_c1                   ,
output      [AGP0_2 -1:0]  gp0_c2                   ,
output      [AGP0_3 -1:0]  gp0_c3                   ,
output      [AGP0_4 -1:0]  gp0_c4                   ,
output      [AGP0_5 -1:0]  gp0_c5                   ,
output      [AGP0_6 -1:0]  gp0_c6                   ,
output      [AGP0_7 -1:0]  gp0_c7                   ,
output      [AGP0_8 -1:0]  gp0_c8                   ,
output      [AGP0_9 -1:0]  gp0_c9                   ,
output      [AGP0_12-1:0]  gp0_c12                  ,
output      [AGP0_12-1:0]  gp0_c13                  ,
output      [AGP0_12-1:0]  gp0_c14                  ,
output      [AGP0_12-1:0]  gp0_c15                  ,
output      [AGP0_13-1:0]  gp0_c16                  ,
output      [AGP0_13-1:0]  gp0_c17                  ,
output      [AGP0_13-1:0]  gp0_c18                  ,
output      [AGP0_13-1:0]  gp0_c19                  ,
output      [AGP0_14-1:0]  gp0_c20                  ,
output      [AGP0_14-1:0]  gp0_c21                  ,
output      [AGP0_14-1:0]  gp0_c22                  ,
output      [AGP0_14-1:0]  gp0_c23                  ,
output      [AGP0_14-1:0]  gp0_c24                  ,
output      [AGP0_14-1:0]  gp0_c25                  ,
output      [AGP0_14-1:0]  gp0_c26                  ,
output      [AGP0_14-1:0]  gp0_c27                  ,
output      [AGP0_15-1:0]  gp0_c28                  ,
output      [AGP0_15-1:0]  gp0_c29                  ,
output      [AGP0_15-1:0]  gp0_c30                  ,
output      [AGP0_15-1:0]  gp0_c31                  ,
output      [AGP0_16-1:0]  gp0_c32                  ,
output      [AGP0_16-1:0]  gp0_c33                  ,
output      [AGP0_16-1:0]  gp0_c34                  ,
output      [AGP0_16-1:0]  gp0_c35                  ,
output      [AGP0_17-1:0]  gp0_d0                   ,
output      [AGP0_19-1:0]  gp0_d2                   ,
output      [AGP0_20-1:0]  gp0_d3                   ,
output                     gp0_d4                   ,
output                     gp0_d5                   ,
output      [AGP0_22-1:0]  gp0_b1                   ,
output      [AGP0_23-1:0]  gp0_b2                   ,
output      [AGP0_27-1:0]  gp0_b6                   ,
output      [AGP0_29-1:0]  gp0_r1                   ,
output      [AGP0_30-1:0]  gp0_r2                   ,
output      [AGP0_31-1:0]  gp0_r3                   ,
output      [AGP0_33-1:0]  gp0_r5                   ,
output      [AGP0_35-1:0]  gp0_r7
    );

localparam WTH_ADDR = 32,
           WTH_ADDL = 10,
           WTH_ADDH = WTH_ADDR-WTH_ADDL;
wire[WTH_ADDH-1:0] addr_H;
wire[WTH_ADDL-1:0] addr_L;

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

reg [AGP0_0 -1:0]  t_gp0_g0   =0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_g0 <= 0;
	end else if(add_g&wren)begin
		case(addr_L)
			0:begin
				t_gp0_g0[0] <= data[0]    ;
				t_gp0_g0[1] <= |data[1:0] ;
				t_gp0_g0[2] <= |data[2:0] ;
			end
		endcase
	end
end

reg                t_gp0_c1   =0;
reg [AGP0_2 -1:0]  t_gp0_c2   =0;
reg [AGP0_3 -1:0]  t_gp0_c3   =0;
reg [AGP0_4 -1:0]  t_gp0_c4   =0;
reg [AGP0_5 -1:0]  t_gp0_c5   =0;
reg [AGP0_6 -1:0]  t_gp0_c6   =0;
reg [AGP0_7 -1:0]  t_gp0_c7   =0;
reg [AGP0_8 -1:0]  t_gp0_c8   =0;
reg [AGP0_9 -1:0]  t_gp0_c9   =0;
reg [AGP0_12-1:0]  t_gp0_c12	=0;
reg [AGP0_12-1:0]  t_gp0_c13	=0;
reg [AGP0_12-1:0]  t_gp0_c14	=0;
reg [AGP0_12-1:0]  t_gp0_c15	=0;
reg [AGP0_13-1:0]  t_gp0_c16	=0;
reg [AGP0_13-1:0]  t_gp0_c17	=0;
reg [AGP0_13-1:0]  t_gp0_c18	=0;
reg [AGP0_13-1:0]  t_gp0_c19	=0;
reg [AGP0_14-1:0]  t_gp0_c20	=0;
reg [AGP0_14-1:0]  t_gp0_c21	=0;
reg [AGP0_14-1:0]  t_gp0_c22	=0;
reg [AGP0_14-1:0]  t_gp0_c23	=0;
reg [AGP0_14-1:0]  t_gp0_c24	=0;
reg [AGP0_14-1:0]  t_gp0_c25	=0;
reg [AGP0_14-1:0]  t_gp0_c26	=0;
reg [AGP0_14-1:0]  t_gp0_c27	=0;
reg [AGP0_15-1:0]  t_gp0_c28	=0;
reg [AGP0_15-1:0]  t_gp0_c29	=0;
reg [AGP0_15-1:0]  t_gp0_c30	=0;
reg [AGP0_15-1:0]  t_gp0_c31	=0;
reg [AGP0_16-1:0]  t_gp0_c32	=0;
reg [AGP0_16-1:0]  t_gp0_c33	=0;
reg [AGP0_16-1:0]  t_gp0_c34	=0;
reg [AGP0_16-1:0]  t_gp0_c35	=0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_c1  <= 0;
		t_gp0_c2  <= 0;
		t_gp0_c3  <= 0;
		t_gp0_c4  <= 0;
		t_gp0_c5  <= 0;
		t_gp0_c6  <= 0;
		t_gp0_c7  <= 0;
		t_gp0_c8  <= 0;
		t_gp0_c9  <= 0;
		t_gp0_c12 <= 0;
		t_gp0_c13 <= 0;
		t_gp0_c14 <= 0;
		t_gp0_c15 <= 0;
		t_gp0_c16 <= 0;
		t_gp0_c17 <= 0;
		t_gp0_c18 <= 0;
		t_gp0_c19 <= 0;
		t_gp0_c20 <= 0;
		t_gp0_c21 <= 0;
		t_gp0_c22 <= 0;
		t_gp0_c23 <= 0;
		t_gp0_c24 <= 0;
		t_gp0_c25 <= 0;
		t_gp0_c26 <= 0;
		t_gp0_c27 <= 0;
		t_gp0_c28 <= 0;
		t_gp0_c29 <= 0;
		t_gp0_c30 <= 0;
		t_gp0_c31 <= 0;
		t_gp0_c32 <= 0;
		t_gp0_c33 <= 0;
		t_gp0_c34 <= 0;
		t_gp0_c35 <= 0;
	end else if(add_c&wren)begin
		case(addr_L)
			1  :t_gp0_c1  <= 1   ;
			2  :t_gp0_c2  <= data;
			3  :t_gp0_c3  <= data-1;
			4  :t_gp0_c4  <= data-1;
			5  :t_gp0_c5  <= data;
			6  :t_gp0_c6  <= data;
			7  :t_gp0_c7  <= data;
			8  :t_gp0_c8  <= data;
			9  :t_gp0_c9  <= data;
			12 :t_gp0_c12 <= data;
			13 :t_gp0_c13 <= data;
			14 :t_gp0_c14 <= data;
			15 :t_gp0_c15 <= data;
			16 :t_gp0_c16 <= data;
			17 :t_gp0_c17 <= data;
			18 :t_gp0_c18 <= data;
			19 :t_gp0_c19 <= data;
			20 :t_gp0_c20 <= data;
			21 :t_gp0_c21 <= data;
			22 :t_gp0_c22 <= data;
			23 :t_gp0_c23 <= data;
			24 :t_gp0_c24 <= data;
			25 :t_gp0_c25 <= data;
			26 :t_gp0_c26 <= data;
			27 :t_gp0_c27 <= data;
			28 :t_gp0_c28 <= data;
			29 :t_gp0_c29 <= data;
			30 :t_gp0_c30 <= data;
			31 :t_gp0_c31 <= data;
			32 :t_gp0_c32 <= data;
			33 :t_gp0_c33 <= data;
			34 :t_gp0_c34 <= data;
			35 :t_gp0_c35 <= data;
		endcase
	end else begin
		t_gp0_c1  <= 0;
	end
end

reg [AGP0_17-1:0]  t_gp0_d0   =0;
reg [AGP0_19-1:0]  t_gp0_d2   =0;
reg [AGP0_20-1:0]  t_gp0_d3   =0;
reg                t_gp0_d4   =0;
reg                t_gp0_d5   =0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_d0 <= 0;
		t_gp0_d2 <= 0;
		t_gp0_d3 <= 0;
		t_gp0_d4 <= 0;
		t_gp0_d5 <= 0;
	end else if(add_d&wren)begin
		case(addr_L)
			0 :t_gp0_d0 <= data;
			2 :t_gp0_d2 <= data;
			3 :t_gp0_d3 <= data;
			4 :t_gp0_d4 <= 1   ;
			5 :t_gp0_d5 <= 1   ;
		endcase
	end else begin
		t_gp0_d4 <= 0;
		t_gp0_d5 <= 0;
	end
end

reg [AGP0_22-1:0]  t_gp0_b1   =0;
reg [AGP0_23-1:0]  t_gp0_b2   =0;
reg [AGP0_27-1:0]  t_gp0_b6   =0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_b1 <= 0;
		t_gp0_b2 <= 0;
		t_gp0_b6 <= 0;
	end else if(add_b&wren)begin
		case(addr_L)
			1 :t_gp0_b1 <= data;
			2 :t_gp0_b2 <= data;
			6 :t_gp0_b6 <= data;
		endcase
	end else begin
		t_gp0_b1 <= 0;
	end
end

reg [AGP0_29-1:0]  t_gp0_r1   =0;
reg [AGP0_30-1:0]  t_gp0_r2   =0;
reg [AGP0_31-1:0]  t_gp0_r3   =0;
reg [AGP0_33-1:0]  t_gp0_r5   =0;
reg [AGP0_35-1:0]  t_gp0_r7   =0;
always@(posedge clk)begin
	if(rst)begin
		t_gp0_r1 <= 0;
		t_gp0_r2 <= 0;
		t_gp0_r3 <= 0;
		t_gp0_r5 <= 0;
		t_gp0_r7 <= 0;
	end else if(add_r&wren)begin
		case(addr_L)
			1 :t_gp0_r1 <= data;
			2 :t_gp0_r2 <= data;
			3 :t_gp0_r3 <= data;
			5 :t_gp0_r5 <= data;
			7 :t_gp0_r7 <= data;
		endcase
	end
end

assign gp0_g0  = t_gp0_g0   ;
assign gp0_c1  = t_gp0_c1   ;
assign gp0_c2  = t_gp0_c2   ;
assign gp0_c3  = t_gp0_c3   ;
assign gp0_c4  = t_gp0_c4   ;
assign gp0_c5  = t_gp0_c5   ;
assign gp0_c6  = t_gp0_c6   ;
assign gp0_c7  = t_gp0_c7   ;
assign gp0_c8  = t_gp0_c8   ;
assign gp0_c9  = t_gp0_c9   ;
assign gp0_c12 = t_gp0_c12	;
assign gp0_c13 = t_gp0_c13	;
assign gp0_c14 = t_gp0_c14	;
assign gp0_c15 = t_gp0_c15	;
assign gp0_c16 = t_gp0_c16	;
assign gp0_c17 = t_gp0_c17	;
assign gp0_c18 = t_gp0_c18	;
assign gp0_c19 = t_gp0_c19	;
assign gp0_c20 = t_gp0_c20	;
assign gp0_c21 = t_gp0_c21	;
assign gp0_c22 = t_gp0_c22	;
assign gp0_c23 = t_gp0_c23	;
assign gp0_c24 = t_gp0_c24	;
assign gp0_c25 = t_gp0_c25	;
assign gp0_c26 = t_gp0_c26	;
assign gp0_c27 = t_gp0_c27	;
assign gp0_c28 = t_gp0_c28	;
assign gp0_c29 = t_gp0_c29	;
assign gp0_c30 = t_gp0_c30	;
assign gp0_c31 = t_gp0_c31	;
assign gp0_c32 = t_gp0_c32	;
assign gp0_c33 = t_gp0_c33	;
assign gp0_c34 = t_gp0_c34	;
assign gp0_c35 = t_gp0_c35	;
assign gp0_d0  = t_gp0_d0   ;
assign gp0_d2  = t_gp0_d2   ;
assign gp0_d3  = t_gp0_d3   ;
assign gp0_d4  = t_gp0_d4   ;
assign gp0_d5  = t_gp0_d5   ;
assign gp0_b1  = t_gp0_b1   ;
assign gp0_b2  = t_gp0_b2   ;
assign gp0_b6  = t_gp0_b6   ;
assign gp0_r1  = t_gp0_r1   ;
assign gp0_r2  = t_gp0_r2   ;
assign gp0_r3  = t_gp0_r3   ;
assign gp0_r5  = t_gp0_r5   ;
assign gp0_r7  = t_gp0_r7   ;

assign {addr_H,addr_L} = addr;

endmodule
