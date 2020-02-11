`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/11 14:48:21
// Design Name:
// Module Name: Tc_PS_GP_rd_data
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


module Tc_PS_GP_rd_data
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
input                      clk       ,
input                      rst       ,
input       [31:0]         addr      ,
output      [31:0]         data      ,
input       [AGP0_0 -1:0]  gp0_g0	   ,
input       [AGP0_1 -1:0]  gp0_c0	   ,
input                      gp0_c1	   ,
input       [AGP0_2 -1:0]  gp0_c2	   ,
input       [AGP0_3 -1:0]  gp0_c3	   ,
input       [AGP0_4 -1:0]  gp0_c4	   ,
input       [AGP0_5 -1:0]  gp0_c5	   ,
input       [AGP0_6 -1:0]  gp0_c6	   ,
input       [AGP0_7 -1:0]  gp0_c7	   ,
input       [AGP0_8 -1:0]  gp0_c8	   ,
input       [AGP0_9 -1:0]  gp0_c9	   ,
input       [AGP0_10-1:0]  gp0_c10	 ,
input       [AGP0_11-1:0]  gp0_c11	 ,
input       [AGP0_12-1:0]  gp0_c12	 ,
input       [AGP0_12-1:0]  gp0_c13	 ,
input       [AGP0_12-1:0]  gp0_c14	 ,
input       [AGP0_12-1:0]  gp0_c15	 ,
input       [AGP0_13-1:0]  gp0_c16	 ,
input       [AGP0_13-1:0]  gp0_c17	 ,
input       [AGP0_13-1:0]  gp0_c18	 ,
input       [AGP0_13-1:0]  gp0_c19	 ,
input       [AGP0_14-1:0]  gp0_c20	 ,
input       [AGP0_14-1:0]  gp0_c21	 ,
input       [AGP0_14-1:0]  gp0_c22	 ,
input       [AGP0_14-1:0]  gp0_c23	 ,
input       [AGP0_14-1:0]  gp0_c24	 ,
input       [AGP0_14-1:0]  gp0_c25	 ,
input       [AGP0_14-1:0]  gp0_c26	 ,
input       [AGP0_14-1:0]  gp0_c27	 ,
input       [AGP0_15-1:0]  gp0_c28	 ,
input       [AGP0_15-1:0]  gp0_c29	 ,
input       [AGP0_15-1:0]  gp0_c30	 ,
input       [AGP0_15-1:0]  gp0_c31	 ,
input       [AGP0_16-1:0]  gp0_c32	 ,
input       [AGP0_16-1:0]  gp0_c33	 ,
input       [AGP0_16-1:0]  gp0_c34	 ,
input       [AGP0_16-1:0]  gp0_c35	 ,
input       [AGP0_17-1:0]  gp0_d0	   ,
input       [AGP0_18-1:0]  gp0_d1	   ,
input       [AGP0_19-1:0]  gp0_d2	   ,
input       [AGP0_20-1:0]  gp0_d3	   ,
input                      gp0_d4	   ,
input                      gp0_d5	   ,
input       [AGP0_21-1:0]  gp0_b0	   ,
input       [AGP0_22-1:0]  gp0_b1	   ,
input       [AGP0_23-1:0]  gp0_b2	   ,
input       [AGP0_24-1:0]  gp0_b3	   ,
input       [AGP0_25-1:0]  gp0_b4	   ,
input       [AGP0_26-1:0]  gp0_b5	   ,
input       [AGP0_27-1:0]  gp0_b6	   ,
input       [AGP0_28-1:0]  gp0_r0	   ,
input       [AGP0_29-1:0]  gp0_r1	   ,
input       [AGP0_30-1:0]  gp0_r2	   ,
input       [AGP0_31-1:0]  gp0_r3	   ,
input       [AGP0_32-1:0]  gp0_r4	   ,
input       [AGP0_33-1:0]  gp0_r5	   ,
input       [AGP0_34-1:0]  gp0_r6	   ,
input       [AGP0_35-1:0]  gp0_r7
    );

localparam WTH_ADDR = 32,
           WTH_ADDL = 10,
           WTH_ADDH = WTH_ADDR-WTH_ADDL;
wire[WTH_ADDH-1:0] addr_H;
wire[WTH_ADDL-1:0] addr_L;

reg[31:0] data_g=0;
always@(posedge clk)begin
	case(addr_L)
		0      :data_g <= gp0_g0;
		default:data_g <= 0     ;
	endcase
end

reg[31:0] data_c=0;
always@(posedge clk)begin
	case(addr_L)
    0	     :data_c <= gp0_c0	 ;
    1	     :data_c <= gp0_c1	 ;
    2	     :data_c <= gp0_c2	 ;
    3	     :data_c <= gp0_c3	 ;
    4	     :data_c <= gp0_c4	 ;
    5	     :data_c <= gp0_c5	 ;
    6	     :data_c <= gp0_c6	 ;
    7	     :data_c <= gp0_c7	 ;
    8	     :data_c <= gp0_c8	 ;
    9	     :data_c <= gp0_c9	 ;
    10	   :data_c <= gp0_c10	 ;
    11	   :data_c <= gp0_c11	 ;
    12	   :data_c <= gp0_c12	 ;
    13	   :data_c <= gp0_c13	 ;
    14	   :data_c <= gp0_c14	 ;
    15	   :data_c <= gp0_c15	 ;
    16	   :data_c <= gp0_c16	 ;
    17	   :data_c <= gp0_c17	 ;
    18	   :data_c <= gp0_c18	 ;
    19	   :data_c <= gp0_c19	 ;
    20	   :data_c <= gp0_c20	 ;
    21	   :data_c <= gp0_c21	 ;
    22	   :data_c <= gp0_c22	 ;
    23	   :data_c <= gp0_c23	 ;
    24	   :data_c <= gp0_c24	 ;
    25	   :data_c <= gp0_c25	 ;
    26	   :data_c <= gp0_c26	 ;
    27	   :data_c <= gp0_c27	 ;
    28	   :data_c <= gp0_c28	 ;
    29	   :data_c <= gp0_c29	 ;
    30	   :data_c <= gp0_c30	 ;
    31	   :data_c <= gp0_c31	 ;
    32	   :data_c <= gp0_c32	 ;
    33	   :data_c <= gp0_c33	 ;
    34	   :data_c <= gp0_c34	 ;
    35	   :data_c <= gp0_c35	 ;
		default:data_c <= 0        ;
	endcase
end

reg[31:0] data_d=0;
always@(posedge clk)begin
	case(addr_L)
    0	     :data_d <= gp0_d0	 ;
    1	     :data_d <= gp0_d1	 ;
    2	     :data_d <= gp0_d2	 ;
    3	     :data_d <= gp0_d3	 ;
    4	     :data_d <= gp0_d4	 ;
    5	     :data_d <= gp0_d5	 ;
		default:data_d <= 0        ;
	endcase
end

reg[31:0] data_b=0;
always@(posedge clk)begin
	case(addr_L)
    0	     :data_b <= gp0_b0	 ;
    1	     :data_b <= gp0_b1	 ;
    2	     :data_b <= gp0_b2	 ;
    3	     :data_b <= gp0_b3	 ;
    4	     :data_b <= gp0_b4	 ;
    5	     :data_b <= gp0_b5	 ;
    6	     :data_b <= gp0_b6	 ;
		default:data_b <= 0        ;
	endcase
end

reg[31:0] data_r=0;
always@(posedge clk)begin
	case(addr_L)
    0	     :data_r <= gp0_r0	 ;
    1	     :data_r <= gp0_r1	 ;
    2	     :data_r <= gp0_r2	 ;
    3	     :data_r <= gp0_r3	 ;
    4	     :data_r <= gp0_r4	 ;
    5	     :data_r <= gp0_r5	 ;
    6	     :data_r <= gp0_r6	 ;
    7	     :data_r <= gp0_r7	 ;
		default:data_r <= 0        ;
	endcase
end

reg[31:0] out_data=0;
localparam ADDH_GLABOL  = 0,
           ADDH_CAPTURE = 1,
           ADDH_LASER   = 2,
           ADDH_BUS     = 3,
           ADDH_OTHER   = 4;
always@(posedge clk)begin
	case(addr_H)
		ADDH_GLABOL  :out_data <= data_g;
		ADDH_CAPTURE :out_data <= data_c;
		ADDH_LASER   :out_data <= data_d;
		ADDH_BUS     :out_data <= data_b;
		ADDH_OTHER   :out_data <= data_r;
		default      :out_data <= 0     ;
	endcase
end

assign {addr_H,addr_L} = addr    ;
assign data            = out_data;

endmodule
