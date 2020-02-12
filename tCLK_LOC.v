`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 11:45:27
// Design Name:
// Module Name: tCLK_LOC
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


module tCLK_LOC
#(
parameter TOP0_0	= 3    ,
          TOP0_1	= 7    ,
          TOP0_2	= 2    ,
          TOP0_3	= 12   ,
          TOP0_4	= 4    ,
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
output                    clk125             ,
output                    clk200             ,
output                    rst                ,
output                    ADC0_CSN           ,
output                    ADC0_SCK           ,
output                    ADC0_SDI           ,
input                     ADC0_SDO           ,
output                    FDA0_SCK           ,
output                    FDA0_CSN           ,
output                    FDA0_SDI           ,
input                     FDA0_SDO           ,
output                    LDD0_OUTEA         ,
output                    LDD0_DISEA         ,
output                    LDD0_OSCEA         ,
output                    LDD0_OLD2N         ,
output                    LDD0_RDISN         ,
output                    DAC0_SDI           ,
output                    DAC0_SCK           ,
output                    DAC0_CSN           ,
output                    DAC1_SDI           ,
output                    DAC1_SCK           ,
output                    DAC1_CSN           ,
output                    OPA0_10X1          ,
output                    OPA0_10X2          ,
output                    OPA0_OPX1          ,
output                    OPA0_OPX2          ,
output                    APD0_EN            ,
output                    LPL0_CSN           ,
input                     LPL0_SDO           ,
output                    LPL0_SCK           ,
output                    LPL0_SDI           ,
input                     LPL0_LOCK          ,
input                     LPL0_ERR           ,
output                    LPL0_SYNC          ,
input                     TEC0_GOOD          ,
input                     TEC1_GOOD          ,
output     [TOP0_2-1:0]   LED0_L             ,
output     [TOP0_4-1:0]   OPM0_IO            ,
inout      [63:0]         GPIO_0_0_tri_io    ,
input                     SPI0_MISO_I_0      ,
output                    SPI0_MOSI_O_0      ,
output                    SPI0_SCLK_O_0      ,
output                    SPI0_SS1_O_0       ,
output                    SPI0_SS2_O_0       ,
output                    SPI0_SS_O_0        ,
input                     UART_0_0_rxd       ,
output                    UART_0_0_txd       ,
inout      [14:0]         DDR_addr           ,
inout      [2:0]          DDR_ba             ,
inout                     DDR_cas_n          ,
inout                     DDR_ck_n           ,
inout                     DDR_ck_p           ,
inout                     DDR_cke            ,
inout                     DDR_cs_n           ,
inout      [3:0]          DDR_dm             ,
inout      [31:0]         DDR_dq             ,
inout      [3:0]          DDR_dqs_n          ,
inout      [3:0]          DDR_dqs_p          ,
inout                     DDR_odt            ,
inout                     DDR_ras_n          ,
inout                     DDR_reset_n        ,
inout                     DDR_we_n           ,
inout                     FIXED_IO_ddr_vrn   ,
inout                     FIXED_IO_ddr_vrp   ,
inout      [53:0]         FIXED_IO_mio       ,
inout                     FIXED_IO_ps_clk    ,
inout                     FIXED_IO_ps_porb   ,
inout                     FIXED_IO_ps_srstb
    );

wire FCLK_CLK0_0     ;
wire FCLK_RESET0_N_0 ;
Tc_clk
Tc_clk_ins0
(
.clki   (FCLK_CLK0_0     ),
.rsti   (FCLK_RESET0_N_0 ),
.clk125 (clk125          ),
.clk200 (clk200          ),
.rsto   (rst             )
    );

wire [AGP0_0 -1:0]  gp0_g0           ;
wire [AGP0_1 -1:0]  gp0_c0           ;
wire                gp0_c1           ;
wire [AGP0_2 -1:0]  gp0_c2           ;
wire [AGP0_3 -1:0]  gp0_c3           ;
wire [AGP0_4 -1:0]  gp0_c4           ;
wire [AGP0_5 -1:0]  gp0_c5           ;
wire [AGP0_6 -1:0]  gp0_c6           ;
wire [AGP0_7 -1:0]  gp0_c7           ;
wire [AGP0_8 -1:0]  gp0_c8           ;
wire [AGP0_9 -1:0]  gp0_c9           ;
wire [AGP0_10-1:0]  gp0_c10          ;
wire [AGP0_11-1:0]  gp0_c11          ;
wire [AGP0_12-1:0]  gp0_c12          ;
wire [AGP0_12-1:0]  gp0_c13          ;
wire [AGP0_12-1:0]  gp0_c14          ;
wire [AGP0_12-1:0]  gp0_c15          ;
wire [AGP0_13-1:0]  gp0_c16          ;
wire [AGP0_13-1:0]  gp0_c17          ;
wire [AGP0_13-1:0]  gp0_c18          ;
wire [AGP0_13-1:0]  gp0_c19          ;
wire [AGP0_14-1:0]  gp0_c20          ;
wire [AGP0_14-1:0]  gp0_c21          ;
wire [AGP0_14-1:0]  gp0_c22          ;
wire [AGP0_14-1:0]  gp0_c23          ;
wire [AGP0_14-1:0]  gp0_c24          ;
wire [AGP0_14-1:0]  gp0_c25          ;
wire [AGP0_14-1:0]  gp0_c26          ;
wire [AGP0_14-1:0]  gp0_c27          ;
wire [AGP0_15-1:0]  gp0_c28          ;
wire [AGP0_15-1:0]  gp0_c29          ;
wire [AGP0_15-1:0]  gp0_c30          ;
wire [AGP0_15-1:0]  gp0_c31          ;
wire [AGP0_16-1:0]  gp0_c32          ;
wire [AGP0_16-1:0]  gp0_c33          ;
wire [AGP0_16-1:0]  gp0_c34          ;
wire [AGP0_16-1:0]  gp0_c35          ;
wire [AGP0_17-1:0]  gp0_d0           ;
wire [AGP0_18-1:0]  gp0_d1           ;
wire [AGP0_19-1:0]  gp0_d2           ;
wire [AGP0_20-1:0]  gp0_d3           ;
wire                gp0_d4           ;
wire                gp0_d5           ;
wire [AGP0_21-1:0]  gp0_b0           ;
wire [AGP0_22-1:0]  gp0_b1           ;
wire [AGP0_23-1:0]  gp0_b2           ;
wire [AGP0_24-1:0]  gp0_b3           ;
wire [AGP0_25-1:0]  gp0_b4           ;
wire [AGP0_26-1:0]  gp0_b5           ;
wire [AGP0_27-1:0]  gp0_b6           ;
wire [AGP0_28-1:0]  gp0_r0           ;
wire [AGP0_29-1:0]  gp0_r1           ;
wire [AGP0_30-1:0]  gp0_r2           ;
wire [AGP0_31-1:0]  gp0_r3           ;
wire [AGP0_32-1:0]  gp0_r4           ;
wire [AGP0_33-1:0]  gp0_r5           ;
wire [AGP0_34-1:0]  gp0_r6           ;
wire [AGP0_35-1:0]  gp0_r7           ;
wire                gp0_c0w          ;
wire                gp0_b0w          ;
wire                gp0_b2w          ;
wire                gp0_b4r          ;
wire                gp0_r7w          ;
wire                acp0_tx_en       ;
wire                acp0_tx_rdy      ;
wire [31:0]         acp0_tx_awaddr   ;
wire [2:0]          acp0_tx_awid     ;
wire [63:0]         acp0_tx_wdata    ;
wire                acp0_tx_wdreq    ;
wire [15:0]         IRQ_F2P_0        ;
Tc_PS
#(
.AGP0_0     (AGP0_0   ),
.AGP0_1     (AGP0_1   ),
.AGP0_2     (AGP0_2   ),
.AGP0_3     (AGP0_3   ),
.AGP0_4     (AGP0_4   ),
.AGP0_5     (AGP0_5   ),
.AGP0_6     (AGP0_6   ),
.AGP0_7     (AGP0_7   ),
.AGP0_8     (AGP0_8   ),
.AGP0_9     (AGP0_9   ),
.AGP0_10    (AGP0_10  ),
.AGP0_11    (AGP0_11  ),
.AGP0_12    (AGP0_12  ),
.AGP0_13    (AGP0_13  ),
.AGP0_14    (AGP0_14  ),
.AGP0_15    (AGP0_15  ),
.AGP0_16    (AGP0_16  ),
.AGP0_17    (AGP0_17  ),
.AGP0_18    (AGP0_18  ),
.AGP0_19    (AGP0_19  ),
.AGP0_20    (AGP0_20  ),
.AGP0_21    (AGP0_21  ),
.AGP0_22    (AGP0_22  ),
.AGP0_23    (AGP0_23  ),
.AGP0_24    (AGP0_24  ),
.AGP0_25    (AGP0_25  ),
.AGP0_26    (AGP0_26  ),
.AGP0_27    (AGP0_27  ),
.AGP0_28    (AGP0_28  ),
.AGP0_29    (AGP0_29  ),
.AGP0_30    (AGP0_30  ),
.AGP0_31    (AGP0_31  ),
.AGP0_32    (AGP0_32  ),
.AGP0_33    (AGP0_33  ),
.AGP0_34    (AGP0_34  ),
.AGP0_35    (AGP0_35  )
)
Tc_PS_ins0
(
.clk                      (clk                      ),
.rst                      (rst                      ),
.gp0_g0                   (gp0_g0                   ),
.gp0_c0                   (gp0_c0                   ),
.gp0_c1                   (gp0_c1                   ),
.gp0_c2                   (gp0_c2                   ),
.gp0_c3                   (gp0_c3                   ),
.gp0_c4                   (gp0_c4                   ),
.gp0_c5                   (gp0_c5                   ),
.gp0_c6                   (gp0_c6                   ),
.gp0_c7                   (gp0_c7                   ),
.gp0_c8                   (gp0_c8                   ),
.gp0_c9                   (gp0_c9                   ),
.gp0_c10                  (gp0_c10                  ),
.gp0_c11                  (gp0_c11                  ),
.gp0_c12                  (gp0_c12                  ),
.gp0_c13                  (gp0_c13                  ),
.gp0_c14                  (gp0_c14                  ),
.gp0_c15                  (gp0_c15                  ),
.gp0_c16                  (gp0_c16                  ),
.gp0_c17                  (gp0_c17                  ),
.gp0_c18                  (gp0_c18                  ),
.gp0_c19                  (gp0_c19                  ),
.gp0_c20                  (gp0_c20                  ),
.gp0_c21                  (gp0_c21                  ),
.gp0_c22                  (gp0_c22                  ),
.gp0_c23                  (gp0_c23                  ),
.gp0_c24                  (gp0_c24                  ),
.gp0_c25                  (gp0_c25                  ),
.gp0_c26                  (gp0_c26                  ),
.gp0_c27                  (gp0_c27                  ),
.gp0_c28                  (gp0_c28                  ),
.gp0_c29                  (gp0_c29                  ),
.gp0_c30                  (gp0_c30                  ),
.gp0_c31                  (gp0_c31                  ),
.gp0_c32                  (gp0_c32                  ),
.gp0_c33                  (gp0_c33                  ),
.gp0_c34                  (gp0_c34                  ),
.gp0_c35                  (gp0_c35                  ),
.gp0_d0                   (gp0_d0                   ),
.gp0_d1                   (gp0_d1                   ),
.gp0_d2                   (gp0_d2                   ),
.gp0_d3                   (gp0_d3                   ),
.gp0_d4                   (gp0_d4                   ),
.gp0_d5                   (gp0_d5                   ),
.gp0_b0                   (gp0_b0                   ),
.gp0_b1                   (gp0_b1                   ),
.gp0_b2                   (gp0_b2                   ),
.gp0_b3                   (gp0_b3                   ),
.gp0_b4                   (gp0_b4                   ),
.gp0_b5                   (gp0_b5                   ),
.gp0_b6                   (gp0_b6                   ),
.gp0_r0                   (gp0_r0                   ),
.gp0_r1                   (gp0_r1                   ),
.gp0_r2                   (gp0_r2                   ),
.gp0_r3                   (gp0_r3                   ),
.gp0_r4                   (gp0_r4                   ),
.gp0_r5                   (gp0_r5                   ),
.gp0_r6                   (gp0_r6                   ),
.gp0_r7                   (gp0_r7                   ),
.gp0_c0w                  (gp0_c0w                  ),
.gp0_b0w                  (gp0_b0w                  ),
.gp0_b2w                  (gp0_b2w                  ),
.gp0_b4r                  (gp0_b4r                  ),
.gp0_r7w                  (gp0_r7w                  ),
.acp0_tx_en               (acp0_tx_en               ),
.acp0_tx_rdy              (acp0_tx_rdy              ),
.acp0_tx_awaddr           (acp0_tx_awaddr           ),
.acp0_tx_awid             (acp0_tx_awid             ),
.acp0_tx_wdata            (acp0_tx_wdata            ),
.acp0_tx_wdreq            (acp0_tx_wdreq            ),
.DDR_addr                 (DDR_addr                 ),
.DDR_ba                   (DDR_ba                   ),
.DDR_cas_n                (DDR_cas_n                ),
.DDR_ck_n                 (DDR_ck_n                 ),
.DDR_ck_p                 (DDR_ck_p                 ),
.DDR_cke                  (DDR_cke                  ),
.DDR_cs_n                 (DDR_cs_n                 ),
.DDR_dm                   (DDR_dm                   ),
.DDR_dq                   (DDR_dq                   ),
.DDR_dqs_n                (DDR_dqs_n                ),
.DDR_dqs_p                (DDR_dqs_p                ),
.DDR_odt                  (DDR_odt                  ),
.DDR_ras_n                (DDR_ras_n                ),
.DDR_reset_n              (DDR_reset_n              ),
.DDR_we_n                 (DDR_we_n                 ),
.FIXED_IO_ddr_vrn         (FIXED_IO_ddr_vrn         ),
.FIXED_IO_ddr_vrp         (FIXED_IO_ddr_vrp         ),
.FIXED_IO_mio             (FIXED_IO_mio             ),
.FIXED_IO_ps_clk          (FIXED_IO_ps_clk          ),
.FIXED_IO_ps_porb         (FIXED_IO_ps_porb         ),
.FIXED_IO_ps_srstb        (FIXED_IO_ps_srstb        ),
.FCLK_CLK0_0              (FCLK_CLK0_0              ),
.FCLK_RESET0_N_0          (FCLK_RESET0_N_0          ),
.GPIO_0_0_tri_io          (GPIO_0_0_tri_io          ),
.IRQ_F2P_0                (IRQ_F2P_0                ),
.SPI0_MISO_I_0            (SPI0_MISO_I_0            ),
.SPI0_MOSI_O_0            (SPI0_MOSI_O_0            ),
.SPI0_SCLK_O_0            (SPI0_SCLK_O_0            ),
.SPI0_SS1_O_0             (SPI0_SS1_O_0             ),
.SPI0_SS2_O_0             (SPI0_SS2_O_0             ),
.SPI0_SS_O_0              (SPI0_SS_O_0              ),
.UART_0_0_rxd             (UART_0_0_rxd             ),
.UART_0_0_txd             (UART_0_0_txd             )
    );

Tc_PL();

endmodule
