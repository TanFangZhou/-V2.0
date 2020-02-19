`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 12:20:59
// Design Name:
// Module Name: Tc_PL_chips
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


module Tc_PL_chips
#(
parameter TOP0_0	= 3    ,
          TOP0_1	= 7    ,
          TOP0_2	= 2    ,
          TOP0_3	= 12   ,
          TOP0_4	= 4    ,
          ADC0_0  = 14   ,
          ADC0_1  = 56   ,
          LDD0_0  = 32   ,
          AGP0_0	= 3    ,
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
input                     clk125             ,
input                     rst                ,
input                     Gc_adc_of          ,
input      [ADC0_0-1:0]   Gc_adc_data        ,
output     [TOP0_0-1:0]   Gc_com_wdis        ,
output     [LDD0_0-1:0]   Gc_com_plus        ,
output                    Gc_com_open        ,
output                    Gc_com_close       ,
input      [TOP0_0-1:0]   Gc_wdis            ,
input      [AGP0_17-1:0]  gp0_d0	           ,
output     [AGP0_18-1:0]  gp0_d1	           ,
input      [AGP0_19-1:0]  gp0_d2	           ,
input      [AGP0_20-1:0]  gp0_d3	           ,
input                     gp0_d4	           ,
input                     gp0_d5	           ,
output     [AGP0_28-1:0]  gp0_r0	           ,
input      [AGP0_29-1:0]  gp0_r1	           ,
input      [AGP0_30-1:0]  gp0_r2	           ,
input      [AGP0_31-1:0]  gp0_r3	           ,
output     [AGP0_32-1:0]  gp0_r4	           ,
input      [AGP0_33-1:0]  gp0_r5	           ,
output     [AGP0_34-1:0]  gp0_r6	           ,
input      [AGP0_35-1:0]  gp0_r7             ,
input                     gp0_r7w  	         ,
output                    LDD0_OUTEA         ,
output                    LDD0_DISEA         ,
output                    LDD0_OSCEA         ,
output                    LDD0_OLD2N         ,
output                    LDD0_RDISN         ,
output                    OPA0_10X1          ,
output                    OPA0_10X2          ,
output                    OPA0_OPX1          ,
output                    OPA0_OPX2          ,
output                    APD0_EN            ,
input                     LPL0_LOCK          ,
input                     LPL0_ERR           ,
output                    LPL0_SYNC          ,
input                     TEC0_GOOD          ,
input                     TEC1_GOOD          ,
output     [TOP0_2-1:0]   LED0_L             ,
output     [TOP0_4-1:0]   OPM0_IO
    );

Tc_PL_chips_ldd
#(
.TOP0_0   (TOP0_0   ),
.TOP0_1   (TOP0_1   ),
.TOP0_2   (TOP0_2   ),
.TOP0_3   (TOP0_3   ),
.TOP0_4   (TOP0_4   ),
.ADC0_0   (ADC0_0   ),
.ADC0_1   (ADC0_1   ),
.LDD0_0   (LDD0_0   ),
.AGP0_17  (AGP0_17  ),
.AGP0_18  (AGP0_18  ),
.AGP0_19  (AGP0_19  ),
.AGP0_20  (AGP0_20  )
)
Tc_PL_chips_ldd_ins0
(
.clk125         (clk125          ),
.rst            (rst             ),
.Gc_com_wdis    (Gc_com_wdis     ),
.Gc_com_plus    (Gc_com_plus     ),
.Gc_com_open    (Gc_com_open     ),
.Gc_com_close   (Gc_com_close    ),
.Gc_wdis        (Gc_wdis         ),
.gp0_d0         (gp0_d0          ),
.gp0_d1         (gp0_d1          ),
.gp0_d2         (gp0_d2          ),
.gp0_d3         (gp0_d3          ),
.gp0_d4         (gp0_d4          ),
.gp0_d5         (gp0_d5          ),
.LDD0_OUTEA     (LDD0_OUTEA      ),
.LDD0_DISEA     (LDD0_DISEA      ),
.LDD0_OSCEA     (LDD0_OSCEA      ),
.LDD0_OLD2N     (LDD0_OLD2N      ),
.LDD0_RDISN     (LDD0_RDISN      )
    );

Tc_PL_chips_opm
#(
.TOP0_4  (TOP0_4  ),
.AGP0_35 (AGP0_35 )
)
Tc_PL_chips_opm_ins0
(
.clk125  (clk125   ),
.rst     (rst      ),
.gp0_r7  (gp0_r7   ),
.gp0_r7w (gp0_r7w  ),
.OPM0_IO (OPM0_IO  )
    );

assign gp0_r0                                    = {Gc_adc_of,Gc_adc_data} ;
assign {OPA0_OPX2,OPA0_OPX1,OPA0_10X2,OPA0_10X1} = gp0_r1                  ;
assign LED0_L                                    = gp0_r2                  ;
assign APD0_EN                                   = gp0_r3                  ;
assign gp0_r4                                    = {TEC1_GOOD,TEC0_GOOD}   ;
assign LPL0_SYNC                                 = gp0_r5                  ;
assign gp0_r6                                    = {LPL0_ERR,LPL0_LOCK}    ;

endmodule
