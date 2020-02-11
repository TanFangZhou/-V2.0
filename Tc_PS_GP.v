`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 12:20:59
// Design Name:
// Module Name: Tc_PS_GP
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


module Tc_PS_GP
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
output      [AGP0_0 -1:0]  gp0_g0	                  ,
input       [AGP0_1 -1:0]  gp0_c0	                  ,
output                     gp0_c1	                  ,
output      [AGP0_2 -1:0]  gp0_c2	                  ,
output      [AGP0_3 -1:0]  gp0_c3	                  ,
output      [AGP0_4 -1:0]  gp0_c4	                  ,
output      [AGP0_5 -1:0]  gp0_c5	                  ,
output      [AGP0_6 -1:0]  gp0_c6	                  ,
output      [AGP0_7 -1:0]  gp0_c7	                  ,
output      [AGP0_8 -1:0]  gp0_c8	                  ,
output      [AGP0_9 -1:0]  gp0_c9	                  ,
input       [AGP0_10-1:0]  gp0_c10	                ,
input       [AGP0_11-1:0]  gp0_c11	                ,
output      [AGP0_12-1:0]  gp0_c12	                ,
output      [AGP0_12-1:0]  gp0_c13	                ,
output      [AGP0_12-1:0]  gp0_c14	                ,
output      [AGP0_12-1:0]  gp0_c15	                ,
output      [AGP0_13-1:0]  gp0_c16	                ,
output      [AGP0_13-1:0]  gp0_c17	                ,
output      [AGP0_13-1:0]  gp0_c18	                ,
output      [AGP0_13-1:0]  gp0_c19	                ,
output      [AGP0_14-1:0]  gp0_c20	                ,
output      [AGP0_14-1:0]  gp0_c21	                ,
output      [AGP0_14-1:0]  gp0_c22	                ,
output      [AGP0_14-1:0]  gp0_c23	                ,
output      [AGP0_14-1:0]  gp0_c24	                ,
output      [AGP0_14-1:0]  gp0_c25	                ,
output      [AGP0_14-1:0]  gp0_c26	                ,
output      [AGP0_14-1:0]  gp0_c27	                ,
output      [AGP0_15-1:0]  gp0_c28	                ,
output      [AGP0_15-1:0]  gp0_c29	                ,
output      [AGP0_15-1:0]  gp0_c30	                ,
output      [AGP0_15-1:0]  gp0_c31	                ,
output      [AGP0_16-1:0]  gp0_c32	                ,
output      [AGP0_16-1:0]  gp0_c33	                ,
output      [AGP0_16-1:0]  gp0_c34	                ,
output      [AGP0_16-1:0]  gp0_c35	                ,
output      [AGP0_17-1:0]  gp0_d0	                  ,
input       [AGP0_18-1:0]  gp0_d1	                  ,
output      [AGP0_19-1:0]  gp0_d2	                  ,
output      [AGP0_20-1:0]  gp0_d3	                  ,
output                     gp0_d4	                  ,
output                     gp0_d5	                  ,
input       [AGP0_21-1:0]  gp0_b0	                  ,
output      [AGP0_22-1:0]  gp0_b1	                  ,
output      [AGP0_23-1:0]  gp0_b2	                  ,
input       [AGP0_24-1:0]  gp0_b3	                  ,
input       [AGP0_25-1:0]  gp0_b4	                  ,
input       [AGP0_26-1:0]  gp0_b5	                  ,
output      [AGP0_27-1:0]  gp0_b6	                  ,
input       [AGP0_28-1:0]  gp0_r0	                  ,
output      [AGP0_29-1:0]  gp0_r1	                  ,
output      [AGP0_30-1:0]  gp0_r2	                  ,
output      [AGP0_31-1:0]  gp0_r3	                  ,
input       [AGP0_32-1:0]  gp0_r4	                  ,
output      [AGP0_33-1:0]  gp0_r5	                  ,
input       [AGP0_34-1:0]  gp0_r6	                  ,
output      [AGP0_35-1:0]  gp0_r7                   ,
output                     gp0_c0w                  ,
output                     gp0_b0w                  ,
output                     gp0_b2w  	              ,
output                     gp0_b4r  	              ,
output                     gp0_r7w  	              ,
input       [31:0]         M_AXI_GP0_0_araddr       ,
input       [1:0]          M_AXI_GP0_0_arburst      ,
input       [3:0]          M_AXI_GP0_0_arcache      ,
input       [11:0]         M_AXI_GP0_0_arid         ,
input       [3:0]          M_AXI_GP0_0_arlen        ,
input       [1:0]          M_AXI_GP0_0_arlock       ,
input       [2:0]          M_AXI_GP0_0_arprot       ,
input       [3:0]          M_AXI_GP0_0_arqos        ,
output                     M_AXI_GP0_0_arready      ,
input       [2:0]          M_AXI_GP0_0_arsize       ,
input                      M_AXI_GP0_0_arvalid      ,
input       [31:0]         M_AXI_GP0_0_awaddr       ,
input       [1:0]          M_AXI_GP0_0_awburst      ,
input       [3:0]          M_AXI_GP0_0_awcache      ,
input       [11:0]         M_AXI_GP0_0_awid         ,
input       [3:0]          M_AXI_GP0_0_awlen        ,
input       [1:0]          M_AXI_GP0_0_awlock       ,
input       [2:0]          M_AXI_GP0_0_awprot       ,
input       [3:0]          M_AXI_GP0_0_awqos        ,
output                     M_AXI_GP0_0_awready      ,
input       [2:0]          M_AXI_GP0_0_awsize       ,
input                      M_AXI_GP0_0_awvalid      ,
output      [11:0]         M_AXI_GP0_0_bid          ,
input                      M_AXI_GP0_0_bready       ,
output      [1:0]          M_AXI_GP0_0_bresp        ,
output                     M_AXI_GP0_0_bvalid       ,
output      [31:0]         M_AXI_GP0_0_rdata        ,
output      [11:0]         M_AXI_GP0_0_rid          ,
output                     M_AXI_GP0_0_rlast        ,
input                      M_AXI_GP0_0_rready       ,
output      [1:0]          M_AXI_GP0_0_rresp        ,
output                     M_AXI_GP0_0_rvalid       ,
input       [31:0]         M_AXI_GP0_0_wdata        ,
input       [11:0]         M_AXI_GP0_0_wid          ,
input                      M_AXI_GP0_0_wlast        ,
output                     M_AXI_GP0_0_wready       ,
input       [3:0]          M_AXI_GP0_0_wstrb        ,
input                      M_AXI_GP0_0_wvalid
    );

Tc_PS_GP_wr
#(
.AGP0_0	  (AGP0_0	  ),
.AGP0_1	  (AGP0_1	  ),
.AGP0_2	  (AGP0_2	  ),
.AGP0_3	  (AGP0_3	  ),
.AGP0_4	  (AGP0_4	  ),
.AGP0_5	  (AGP0_5	  ),
.AGP0_6	  (AGP0_6	  ),
.AGP0_7	  (AGP0_7	  ),
.AGP0_8	  (AGP0_8	  ),
.AGP0_9	  (AGP0_9	  ),
.AGP0_10	(AGP0_10	),
.AGP0_11	(AGP0_11	),
.AGP0_12	(AGP0_12	),
.AGP0_13	(AGP0_13	),
.AGP0_14	(AGP0_14	),
.AGP0_15	(AGP0_15	),
.AGP0_16	(AGP0_16	),
.AGP0_17	(AGP0_17	),
.AGP0_18	(AGP0_18	),
.AGP0_19	(AGP0_19	),
.AGP0_20	(AGP0_20	),
.AGP0_21	(AGP0_21	),
.AGP0_22	(AGP0_22	),
.AGP0_23	(AGP0_23	),
.AGP0_24	(AGP0_24	),
.AGP0_25	(AGP0_25	),
.AGP0_26	(AGP0_26	),
.AGP0_27	(AGP0_27	),
.AGP0_28	(AGP0_28	),
.AGP0_29	(AGP0_29	),
.AGP0_30	(AGP0_30	),
.AGP0_31	(AGP0_31	),
.AGP0_32	(AGP0_32	),
.AGP0_33	(AGP0_33	),
.AGP0_34	(AGP0_34	),
.AGP0_35	(AGP0_35	)
)
Tc_PS_GP_wr_ins0
(
.clk                      (clk                      ),
.rst                      (rst                      ),
.gp0_g0	                  (gp0_g0	                  ),
.gp0_c1	                  (gp0_c1	                  ),
.gp0_c2	                  (gp0_c2	                  ),
.gp0_c3	                  (gp0_c3	                  ),
.gp0_c4	                  (gp0_c4	                  ),
.gp0_c5	                  (gp0_c5	                  ),
.gp0_c6	                  (gp0_c6	                  ),
.gp0_c7	                  (gp0_c7	                  ),
.gp0_c8	                  (gp0_c8	                  ),
.gp0_c9	                  (gp0_c9	                  ),
.gp0_c12	                (gp0_c12	                ),
.gp0_c13	                (gp0_c13	                ),
.gp0_c14	                (gp0_c14	                ),
.gp0_c15	                (gp0_c15	                ),
.gp0_c16	                (gp0_c16	                ),
.gp0_c17	                (gp0_c17	                ),
.gp0_c18	                (gp0_c18	                ),
.gp0_c19	                (gp0_c19	                ),
.gp0_c20	                (gp0_c20	                ),
.gp0_c21	                (gp0_c21	                ),
.gp0_c22	                (gp0_c22	                ),
.gp0_c23	                (gp0_c23	                ),
.gp0_c24	                (gp0_c24	                ),
.gp0_c25	                (gp0_c25	                ),
.gp0_c26	                (gp0_c26	                ),
.gp0_c27	                (gp0_c27	                ),
.gp0_c28	                (gp0_c28	                ),
.gp0_c29	                (gp0_c29	                ),
.gp0_c30	                (gp0_c30	                ),
.gp0_c31	                (gp0_c31	                ),
.gp0_c32	                (gp0_c32	                ),
.gp0_c33	                (gp0_c33	                ),
.gp0_c34	                (gp0_c34	                ),
.gp0_c35	                (gp0_c35	                ),
.gp0_d0	                  (gp0_d0	                  ),
.gp0_d2	                  (gp0_d2	                  ),
.gp0_d3	                  (gp0_d3	                  ),
.gp0_d4	                  (gp0_d4	                  ),
.gp0_d5	                  (gp0_d5	                  ),
.gp0_b1	                  (gp0_b1	                  ),
.gp0_b2	                  (gp0_b2	                  ),
.gp0_b6	                  (gp0_b6	                  ),
.gp0_r1	                  (gp0_r1	                  ),
.gp0_r2	                  (gp0_r2	                  ),
.gp0_r3	                  (gp0_r3	                  ),
.gp0_r5	                  (gp0_r5	                  ),
.gp0_r7                   (gp0_r7                   ),
.gp0_c0w                  (gp0_c0w                  ),
.gp0_b0w                  (gp0_b0w                  ),
.gp0_b2w  	              (gp0_b2w  	              ),
.gp0_r7w  	              (gp0_r7w  	              ),
.M_AXI_GP0_0_awaddr       (M_AXI_GP0_0_awaddr       ),
.M_AXI_GP0_0_awburst      (M_AXI_GP0_0_awburst      ),
.M_AXI_GP0_0_awcache      (M_AXI_GP0_0_awcache      ),
.M_AXI_GP0_0_awid         (M_AXI_GP0_0_awid         ),
.M_AXI_GP0_0_awlen        (M_AXI_GP0_0_awlen        ),
.M_AXI_GP0_0_awlock       (M_AXI_GP0_0_awlock       ),
.M_AXI_GP0_0_awprot       (M_AXI_GP0_0_awprot       ),
.M_AXI_GP0_0_awqos        (M_AXI_GP0_0_awqos        ),
.M_AXI_GP0_0_awready      (M_AXI_GP0_0_awready      ),
.M_AXI_GP0_0_awsize       (M_AXI_GP0_0_awsize       ),
.M_AXI_GP0_0_awvalid      (M_AXI_GP0_0_awvalid      ),
.M_AXI_GP0_0_bid          (M_AXI_GP0_0_bid          ),
.M_AXI_GP0_0_bready       (M_AXI_GP0_0_bready       ),
.M_AXI_GP0_0_bresp        (M_AXI_GP0_0_bresp        ),
.M_AXI_GP0_0_bvalid       (M_AXI_GP0_0_bvalid       ),
.M_AXI_GP0_0_wdata        (M_AXI_GP0_0_wdata        ),
.M_AXI_GP0_0_wid          (M_AXI_GP0_0_wid          ),
.M_AXI_GP0_0_wlast        (M_AXI_GP0_0_wlast        ),
.M_AXI_GP0_0_wready       (M_AXI_GP0_0_wready       ),
.M_AXI_GP0_0_wstrb        (M_AXI_GP0_0_wstrb        ),
.M_AXI_GP0_0_wvalid       (M_AXI_GP0_0_wvalid       )
    );

Tc_PS_GP_rd
#(
.AGP0_0	  (AGP0_0	  ),
.AGP0_1	  (AGP0_1	  ),
.AGP0_2	  (AGP0_2	  ),
.AGP0_3	  (AGP0_3	  ),
.AGP0_4	  (AGP0_4	  ),
.AGP0_5	  (AGP0_5	  ),
.AGP0_6	  (AGP0_6	  ),
.AGP0_7	  (AGP0_7	  ),
.AGP0_8	  (AGP0_8	  ),
.AGP0_9	  (AGP0_9	  ),
.AGP0_10	(AGP0_10	),
.AGP0_11	(AGP0_11	),
.AGP0_12	(AGP0_12	),
.AGP0_13	(AGP0_13	),
.AGP0_14	(AGP0_14	),
.AGP0_15	(AGP0_15	),
.AGP0_16	(AGP0_16	),
.AGP0_17	(AGP0_17	),
.AGP0_18	(AGP0_18	),
.AGP0_19	(AGP0_19	),
.AGP0_20	(AGP0_20	),
.AGP0_21	(AGP0_21	),
.AGP0_22	(AGP0_22	),
.AGP0_23	(AGP0_23	),
.AGP0_24	(AGP0_24	),
.AGP0_25	(AGP0_25	),
.AGP0_26	(AGP0_26	),
.AGP0_27	(AGP0_27	),
.AGP0_28	(AGP0_28	),
.AGP0_29	(AGP0_29	),
.AGP0_30	(AGP0_30	),
.AGP0_31	(AGP0_31	),
.AGP0_32	(AGP0_32	),
.AGP0_33	(AGP0_33	),
.AGP0_34	(AGP0_34	),
.AGP0_35	(AGP0_35	)
)
Tc_PS_GP_rd_ins0
(
.clk                      (clk                      ),
.rst                      (rst                      ),
.gp0_g0	                  (gp0_g0	                  ),
.gp0_c0	                  (gp0_c0	                  ),
.gp0_c1	                  (0     	                  ),
.gp0_c2	                  (gp0_c2	                  ),
.gp0_c3	                  (gp0_c3	                  ),
.gp0_c4	                  (gp0_c4	                  ),
.gp0_c5	                  (gp0_c5	                  ),
.gp0_c6	                  (gp0_c6	                  ),
.gp0_c7	                  (gp0_c7	                  ),
.gp0_c8	                  (gp0_c8	                  ),
.gp0_c9	                  (gp0_c9	                  ),
.gp0_c10	                (gp0_c10	                ),
.gp0_c11	                (gp0_c11	                ),
.gp0_c12	                (gp0_c12	                ),
.gp0_c13	                (gp0_c13	                ),
.gp0_c14	                (gp0_c14	                ),
.gp0_c15	                (gp0_c15	                ),
.gp0_c16	                (gp0_c16	                ),
.gp0_c17	                (gp0_c17	                ),
.gp0_c18	                (gp0_c18	                ),
.gp0_c19	                (gp0_c19	                ),
.gp0_c20	                (gp0_c20	                ),
.gp0_c21	                (gp0_c21	                ),
.gp0_c22	                (gp0_c22	                ),
.gp0_c23	                (gp0_c23	                ),
.gp0_c24	                (gp0_c24	                ),
.gp0_c25	                (gp0_c25	                ),
.gp0_c26	                (gp0_c26	                ),
.gp0_c27	                (gp0_c27	                ),
.gp0_c28	                (gp0_c28	                ),
.gp0_c29	                (gp0_c29	                ),
.gp0_c30	                (gp0_c30	                ),
.gp0_c31	                (gp0_c31	                ),
.gp0_c32	                (gp0_c32	                ),
.gp0_c33	                (gp0_c33	                ),
.gp0_c34	                (gp0_c34	                ),
.gp0_c35	                (gp0_c35	                ),
.gp0_d0	                  (gp0_d0	                  ),
.gp0_d1	                  (gp0_d1	                  ),
.gp0_d2	                  (gp0_d2	                  ),
.gp0_d3	                  (gp0_d3	                  ),
.gp0_d4	                  (0	                      ),
.gp0_d5	                  (0	                      ),
.gp0_b0	                  (gp0_b0	                  ),
.gp0_b1	                  (0    	                  ),
.gp0_b2	                  (gp0_b2	                  ),
.gp0_b3	                  (gp0_b3	                  ),
.gp0_b4	                  (gp0_b4	                  ),
.gp0_b5	                  (gp0_b5	                  ),
.gp0_b6	                  (gp0_b6	                  ),
.gp0_r0	                  (gp0_r0	                  ),
.gp0_r1	                  (gp0_r1	                  ),
.gp0_r2	                  (gp0_r2	                  ),
.gp0_r3	                  (gp0_r3	                  ),
.gp0_r4	                  (gp0_r4	                  ),
.gp0_r5	                  (gp0_r5	                  ),
.gp0_r6	                  (gp0_r6	                  ),
.gp0_r7                   (gp0_r7                   ),
.gp0_b4r                  (gp0_b4r                  ),
.M_AXI_GP0_0_araddr       (M_AXI_GP0_0_araddr       ),
.M_AXI_GP0_0_arburst      (M_AXI_GP0_0_arburst      ),
.M_AXI_GP0_0_arcache      (M_AXI_GP0_0_arcache      ),
.M_AXI_GP0_0_arid         (M_AXI_GP0_0_arid         ),
.M_AXI_GP0_0_arlen        (M_AXI_GP0_0_arlen        ),
.M_AXI_GP0_0_arlock       (M_AXI_GP0_0_arlock       ),
.M_AXI_GP0_0_arprot       (M_AXI_GP0_0_arprot       ),
.M_AXI_GP0_0_arqos        (M_AXI_GP0_0_arqos        ),
.M_AXI_GP0_0_arready      (M_AXI_GP0_0_arready      ),
.M_AXI_GP0_0_arsize       (M_AXI_GP0_0_arsize       ),
.M_AXI_GP0_0_arvalid      (M_AXI_GP0_0_arvalid      ),
.M_AXI_GP0_0_rdata        (M_AXI_GP0_0_rdata        ),
.M_AXI_GP0_0_rid          (M_AXI_GP0_0_rid          ),
.M_AXI_GP0_0_rlast        (M_AXI_GP0_0_rlast        ),
.M_AXI_GP0_0_rready       (M_AXI_GP0_0_rready       ),
.M_AXI_GP0_0_rresp        (M_AXI_GP0_0_rresp        ),
.M_AXI_GP0_0_rvalid       (M_AXI_GP0_0_rvalid       )
    );

endmodule
