`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 12:20:59
// Design Name:
// Module Name: Tc_PL_cap
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


module Tc_PL_cap
#(
parameter AGP0_1  = 2   ,
					AGP0_2  = 1   ,
					AGP0_3  = 3   ,
					AGP0_5  = 32  ,
					AGP0_4  = 3   ,
					AGP0_6  = 8   ,
					AGP0_7  = 3   ,
					AGP0_8  = 14  ,
					AGP0_9  = 32  ,
					AGP0_10 = 32  ,
					AGP0_11 = 32  ,
					AGP0_12 = 18  ,
					AGP0_13 = 32  ,
					AGP0_14 = 32  ,
					AGP0_15 = 6   ,
          AGP0_16 = 4   ,
          CAP0_0  = 1   ,
	        CAP0_1  = 3   ,
	        CAP0_2  = 32  ,
	        CAP0_3  = 3   ,
	        CAP0_4  = 8   ,
	        CAP0_5  = 3   ,
	        CAP0_6  = 14  ,
	        CAP0_7  = 32  ,
	        CAP0_8  = 32  ,
	        CAP0_9  = 32  ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32  ,
	        CAP0_12 = 32  ,
	        CAP0_13 = 6   ,
          CAP0_14 = 4   ,
          TOP0_0	= 3   ,
          LDD0_0  = 32  ,
          ADC0_1  = 56
)(
input                     clk125             ,
input                     rst                ,
output     [AGP0_1 -1:0]  gp0_c0	           ,
input                     gp0_c1	           ,
input                     gp0_c0w            ,
input      [AGP0_2 -1:0]  gp0_c2	           ,
input      [AGP0_3 -1:0]  gp0_c3	           ,
input      [AGP0_4 -1:0]  gp0_c4	           ,
input      [AGP0_5 -1:0]  gp0_c5	           ,
input      [AGP0_6 -1:0]  gp0_c6	           ,
input      [AGP0_7 -1:0]  gp0_c7	           ,
input      [AGP0_8 -1:0]  gp0_c8	           ,
input      [AGP0_9 -1:0]  gp0_c9	           ,
output     [AGP0_10-1:0]  gp0_c10	           ,
output     [AGP0_11-1:0]  gp0_c11	           ,
input      [AGP0_12-1:0]  gp0_c12	           ,
input      [AGP0_12-1:0]  gp0_c13	           ,
input      [AGP0_12-1:0]  gp0_c14	           ,
input      [AGP0_12-1:0]  gp0_c15	           ,
input      [AGP0_13-1:0]  gp0_c16	           ,
input      [AGP0_13-1:0]  gp0_c17	           ,
input      [AGP0_13-1:0]  gp0_c18	           ,
input      [AGP0_13-1:0]  gp0_c19	           ,
input      [AGP0_14-1:0]  gp0_c20	           ,
input      [AGP0_14-1:0]  gp0_c21	           ,
input      [AGP0_14-1:0]  gp0_c22	           ,
input      [AGP0_14-1:0]  gp0_c23	           ,
input      [AGP0_14-1:0]  gp0_c24	           ,
input      [AGP0_14-1:0]  gp0_c25	           ,
input      [AGP0_14-1:0]  gp0_c26	           ,
input      [AGP0_14-1:0]  gp0_c27	           ,
input      [AGP0_15-1:0]  gp0_c28	           ,
input      [AGP0_15-1:0]  gp0_c29	           ,
input      [AGP0_15-1:0]  gp0_c30	           ,
input      [AGP0_15-1:0]  gp0_c31	           ,
input      [AGP0_16-1:0]  gp0_c32	           ,
input      [AGP0_16-1:0]  gp0_c33	           ,
input      [AGP0_16-1:0]  gp0_c34	           ,
input      [AGP0_16-1:0]  gp0_c35	           ,
input                     Gc_cap_mode        ,
output     [TOP0_0-1:0]   Gc_cap_wdis        ,
output     [LDD0_0-1:0]   Gc_cap_plus        ,
output                    Gc_cap_trig        ,
input                     Gc_capr_rdy        ,
output                    Gc_cap_cmpt        ,
output     [CAP0_3-1:0]   Gc_cap_phase       ,
input      [ADC0_1-1:0]   Gc_merge_data      ,
input                     Gc_mereg_datv      ,
output                    Gc_mereg_datr      ,
output                    acp0_tx_en         ,
input                     acp0_tx_rdy        ,
output     [31:0]         acp0_tx_awaddr     ,
output     [2:0]          acp0_tx_awid       ,
output     [63:0]         acp0_tx_wdata      ,
input                     acp0_tx_wdreq      ,
output                    cap_irq            ,
output                    FDA0_SCK           ,
output                    FDA0_CSN           ,
output                    FDA0_SDI           ,
output                    DAC0_SDI           ,
output                    DAC0_SCK           ,
output                    DAC0_CSN           ,
output                    OPA0_10X1          ,
output                    OPA0_10X2          ,
output                    OPA0_OPX1          ,
output                    OPA0_OPX2
    );

wire                Ps_cap_cing                ;
wire                Ps_cap_cmpt                ;
wire                Ps_cap_trig                ;
wire [CAP0_0 -1:0]  Ps_cap_irq_en              ;
wire [CAP0_1 -1:0]  Ps_cap_gain_number         ;
wire [CAP0_2 -1:0]  Ps_cap_gain_del            ;
wire [CAP0_3 -1:0]  Ps_cap_phase_number        ;
wire [CAP0_4 -1:0]  Ps_cap_ld_plus             ;
wire [CAP0_5 -1:0]  Ps_cap_ld_wdis             ;
wire [CAP0_6 -1:0]  Ps_cap_points              ;
wire [CAP0_7 -1:0]  Ps_cap_addr                ;
wire [CAP0_8 -1:0]  Ps_cap_crc32               ;
wire [CAP0_9 -1:0]  Ps_cap_time                ;
wire [CAP0_10-1:0]  Ps_cap_gain0_cycle         ;
wire [CAP0_10-1:0]  Ps_cap_gain1_cycle         ;
wire [CAP0_10-1:0]  Ps_cap_gain2_cycle         ;
wire [CAP0_10-1:0]  Ps_cap_gain3_cycle         ;
wire [CAP0_11-1:0]  Ps_cap_gain0_Lddel         ;
wire [CAP0_11-1:0]  Ps_cap_gain1_Lddel         ;
wire [CAP0_11-1:0]  Ps_cap_gain2_Lddel         ;
wire [CAP0_11-1:0]  Ps_cap_gain3_Lddel         ;
wire [CAP0_12-1:0]  Ps_cap_gain0_dacA          ;
wire [CAP0_12-1:0]  Ps_cap_gain0_dacB          ;
wire [CAP0_12-1:0]  Ps_cap_gain1_dacA          ;
wire [CAP0_12-1:0]  Ps_cap_gain1_dacB          ;
wire [CAP0_12-1:0]  Ps_cap_gain2_dacA          ;
wire [CAP0_12-1:0]  Ps_cap_gain2_dacB          ;
wire [CAP0_12-1:0]  Ps_cap_gain3_dacA          ;
wire [CAP0_12-1:0]  Ps_cap_gain3_dacB          ;
wire [CAP0_13-1:0]  Ps_cap_gain0_lmh           ;
wire [CAP0_13-1:0]  Ps_cap_gain1_lmh           ;
wire [CAP0_13-1:0]  Ps_cap_gain2_lmh           ;
wire [CAP0_13-1:0]  Ps_cap_gain3_lmh           ;
wire [CAP0_14-1:0]  Ps_cap_gain0_relay         ;
wire [CAP0_14-1:0]  Ps_cap_gain1_relay         ;
wire [CAP0_14-1:0]  Ps_cap_gain2_relay         ;
wire [CAP0_14-1:0]  Ps_cap_gain3_relay         ;
Tc_PL_cap_gp
#(
.AGP0_1     (AGP0_1     ),
.AGP0_2     (AGP0_2     ),
.AGP0_3     (AGP0_3     ),
.AGP0_5     (AGP0_5     ),
.AGP0_4     (AGP0_4     ),
.AGP0_6     (AGP0_6     ),
.AGP0_7     (AGP0_7     ),
.AGP0_8     (AGP0_8     ),
.AGP0_9     (AGP0_9     ),
.AGP0_10    (AGP0_10    ),
.AGP0_11    (AGP0_11    ),
.AGP0_12    (AGP0_12    ),
.AGP0_13    (AGP0_13    ),
.AGP0_14    (AGP0_14    ),
.AGP0_15    (AGP0_15    ),
.AGP0_16    (AGP0_16    ),
.CAP0_0     (CAP0_0     ),
.CAP0_1     (CAP0_1     ),
.CAP0_2     (CAP0_2     ),
.CAP0_3     (CAP0_3     ),
.CAP0_4     (CAP0_4     ),
.CAP0_5     (CAP0_5     ),
.CAP0_6     (CAP0_6     ),
.CAP0_7     (CAP0_7     ),
.CAP0_8     (CAP0_8     ),
.CAP0_9     (CAP0_9     ),
.CAP0_10    (CAP0_10    ),
.CAP0_11    (CAP0_11    ),
.CAP0_12    (CAP0_12    ),
.CAP0_13    (CAP0_13    ),
.CAP0_14    (CAP0_14    )
)
Tc_PL_cap_gp_ins0
(
.clk125            (clk125            ),
.rst               (rst               ),
.cap_cing          (Ps_cap_cing          ),
.cap_cmpt          (Ps_cap_cmpt          ),
.cap_trig          (Ps_cap_trig          ),
.gp0_c0            (gp0_c0            ),
.gp0_c1            (gp0_c1            ),
.gp0_c0w           (gp0_c0w           ),
.gp0_c2            (gp0_c2            ),
.gp0_c3            (gp0_c3            ),
.gp0_c4            (gp0_c4            ),
.gp0_c5            (gp0_c5            ),
.gp0_c6            (gp0_c6            ),
.gp0_c7            (gp0_c7            ),
.gp0_c8            (gp0_c8            ),
.gp0_c9            (gp0_c9            ),
.gp0_c10           (gp0_c10           ),
.gp0_c11           (gp0_c11           ),
.gp0_c12           (gp0_c12           ),
.gp0_c13           (gp0_c13           ),
.gp0_c14           (gp0_c14           ),
.gp0_c15           (gp0_c15           ),
.gp0_c16           (gp0_c16           ),
.gp0_c17           (gp0_c17           ),
.gp0_c18           (gp0_c18           ),
.gp0_c19           (gp0_c19           ),
.gp0_c20           (gp0_c20           ),
.gp0_c21           (gp0_c21           ),
.gp0_c22           (gp0_c22           ),
.gp0_c23           (gp0_c23           ),
.gp0_c24           (gp0_c24           ),
.gp0_c25           (gp0_c25           ),
.gp0_c26           (gp0_c26           ),
.gp0_c27           (gp0_c27           ),
.gp0_c28           (gp0_c28           ),
.gp0_c29           (gp0_c29           ),
.gp0_c30           (gp0_c30           ),
.gp0_c31           (gp0_c31           ),
.gp0_c32           (gp0_c32           ),
.gp0_c33           (gp0_c33           ),
.gp0_c34           (gp0_c34           ),
.gp0_c35           (gp0_c35           ),
.cap_irq_en        (Ps_cap_irq_en        ),
.cap_gain_number   (Ps_cap_gain_number   ),
.cap_gain_del      (Ps_cap_gain_del      ),
.cap_phase_number  (Ps_cap_phase_number  ),
.cap_ld_plus       (Ps_cap_ld_plus       ),
.cap_ld_wdis       (Ps_cap_ld_wdis       ),
.cap_points        (Ps_cap_points        ),
.cap_addr          (Ps_cap_addr          ),
.cap_crc32         (Ps_cap_crc32         ),
.cap_time          (Ps_cap_time          ),
.cap_gain0_cycle   (Ps_cap_gain0_cycle   ),
.cap_gain1_cycle   (Ps_cap_gain1_cycle   ),
.cap_gain2_cycle   (Ps_cap_gain2_cycle   ),
.cap_gain3_cycle   (Ps_cap_gain3_cycle   ),
.cap_gain0_Lddel   (Ps_cap_gain0_Lddel   ),
.cap_gain1_Lddel   (Ps_cap_gain1_Lddel   ),
.cap_gain2_Lddel   (Ps_cap_gain2_Lddel   ),
.cap_gain3_Lddel   (Ps_cap_gain3_Lddel   ),
.cap_gain0_dacA    (Ps_cap_gain0_dacA    ),
.cap_gain0_dacB    (Ps_cap_gain0_dacB    ),
.cap_gain1_dacA    (Ps_cap_gain1_dacA    ),
.cap_gain1_dacB    (Ps_cap_gain1_dacB    ),
.cap_gain2_dacA    (Ps_cap_gain2_dacA    ),
.cap_gain2_dacB    (Ps_cap_gain2_dacB    ),
.cap_gain3_dacA    (Ps_cap_gain3_dacA    ),
.cap_gain3_dacB    (Ps_cap_gain3_dacB    ),
.cap_gain0_lmh     (Ps_cap_gain0_lmh     ),
.cap_gain1_lmh     (Ps_cap_gain1_lmh     ),
.cap_gain2_lmh     (Ps_cap_gain2_lmh     ),
.cap_gain3_lmh     (Ps_cap_gain3_lmh     ),
.cap_gain0_relay   (Ps_cap_gain0_relay   ),
.cap_gain1_relay   (Ps_cap_gain1_relay   ),
.cap_gain2_relay   (Ps_cap_gain2_relay   ),
.cap_gain3_relay   (Ps_cap_gain3_relay   )
    );

wire                ctl_cap_trig     ;
wire                ctl_cap_cing     ;
wire                ctl_cap_cmpt     ;
wire [CAP0_9 -1:0]  ctl_cap_time     ;
wire [CAP0_1 -1:0]  ctl_gain_number  ;
wire [CAP0_1 -2:0]  ctl_gain_value   ;
wire                ctl_gain_en      ;
wire                ctl_gain_cmpt    ;
wire                ctl_data_en      ;
wire                ctl_data_cmpt    ;
Tc_PL_cap_ctl
#(
.CAP0_1(CAP0_1),
.CAP0_9(CAP0_9)
)
Tc_PL_cap_ctl_ins0
(
.clk125        (clk125       ),
.rst           (rst          ),
.cap_trig      (ctl_cap_trig     ),
.cap_cing      (ctl_cap_cing     ),
.cap_cmpt      (ctl_cap_cmpt     ),
.cap_time      (ctl_cap_time     ),
.gain_number   (ctl_gain_number  ),
.gain_value    (ctl_gain_value   ),
.gain_en       (ctl_gain_en      ),
.gain_cmpt     (ctl_gain_cmpt    ),
.data_en       (ctl_data_en      ),
.data_cmpt     (ctl_data_cmpt    )
    );

wire [CAP0_7 -1:0]  cap_gain_addr   ;
wire [CAP0_10-1:0]  cap_gain_cycle  ;
wire [CAP0_11-1:0]  cap_gain_Lddel  ;
Tc_PL_cap_gain
#(
.CAP0_1  (CAP0_1  ),
.CAP0_2  (CAP0_2  ),
.CAP0_6 (CAP0_6 ),
.CAP0_7 (CAP0_7 ),
.CAP0_10 (CAP0_10 ),
.CAP0_11 (CAP0_11 ),
.CAP0_12 (CAP0_12 ),
.CAP0_13 (CAP0_13 ),
.CAP0_14 (CAP0_14 )
)
Tc_PL_cap_gain_ins0
(
.clk             (clk125           ),
.rst              (rst              ),
.gain_value       (ctl_gain_value       ),
.gain_en          (ctl_gain_en          ),
.gain_cmpt        (ctl_gain_cmpt        ),
.cap_gain_del     (Ps_cap_gain_del     ),
.cap_gain0_dacA   (Ps_cap_gain0_dacA   ),
.cap_gain0_dacB   (Ps_cap_gain0_dacB   ),
.cap_gain1_dacA   (Ps_cap_gain1_dacA   ),
.cap_gain1_dacB   (Ps_cap_gain1_dacB   ),
.cap_gain2_dacA   (Ps_cap_gain2_dacA   ),
.cap_gain2_dacB   (Ps_cap_gain2_dacB   ),
.cap_gain3_dacA   (Ps_cap_gain3_dacA   ),
.cap_gain3_dacB   (Ps_cap_gain3_dacB   ),
.cap_gain0_lmh    (Ps_cap_gain0_lmh    ),
.cap_gain1_lmh    (Ps_cap_gain1_lmh    ),
.cap_gain2_lmh    (Ps_cap_gain2_lmh    ),
.cap_gain3_lmh    (Ps_cap_gain3_lmh    ),
.cap_gain0_relay  (Ps_cap_gain0_relay  ),
.cap_gain1_relay  (Ps_cap_gain1_relay  ),
.cap_gain2_relay  (Ps_cap_gain2_relay  ),
.cap_gain3_relay  (Ps_cap_gain3_relay  ),
.cap_points         (Ps_cap_points         ),
.cap_addr           (Ps_cap_addr           ),
.cap_gain0_cycle    (Ps_cap_gain0_cycle    ),
.cap_gain1_cycle    (Ps_cap_gain1_cycle    ),
.cap_gain2_cycle    (Ps_cap_gain2_cycle    ),
.cap_gain3_cycle    (Ps_cap_gain3_cycle    ),
.cap_gain0_Lddel    (Ps_cap_gain0_Lddel    ),
.cap_gain1_Lddel    (Ps_cap_gain1_Lddel    ),
.cap_gain2_Lddel    (Ps_cap_gain2_Lddel    ),
.cap_gain3_Lddel    (Ps_cap_gain3_Lddel    ),
.cap_gain_addr      (cap_gain_addr         ),
.cap_gain_cycle     (cap_gain_cycle        ),
.cap_gain_Lddel     (cap_gain_Lddel        ),
.FDA0_SCK         (FDA0_SCK         ),
.FDA0_CSN         (FDA0_CSN         ),
.FDA0_SDI         (FDA0_SDI         ),
.DAC0_SDI         (DAC0_SDI         ),
.DAC0_SCK         (DAC0_SCK         ),
.DAC0_CSN         (DAC0_CSN         ),
.OPA0_10X1        (OPA0_10X1        ),
.OPA0_10X2        (OPA0_10X2        ),
.OPA0_OPX1        (OPA0_OPX1        ),
.OPA0_OPX2        (OPA0_OPX2        )
    );

Tc_PL_cap_data
#(
.CAP0_3 (CAP0_3 ),
.CAP0_6 (CAP0_6 ),
.CAP0_7 (CAP0_7 ),
.CAP0_8 (CAP0_8 ),
.CAP0_10(CAP0_10),
.CAP0_11(CAP0_11),
.ADC0_1 (ADC0_1 )
)
Tc_PL_cap_data_ins0
(
.clk                (clk125             ),
.rst                (rst                ),
.data_en            (ctl_data_en            ),
.data_cmpt          (ctl_data_cmpt          ),
.cap_phase_number   (Ps_cap_phase_number   ),
.cap_points         (Ps_cap_points         ),
.cap_gain_addr           (cap_gain_addr         ),
.cap_crc_en         (Ps_cap_cing           ),
.cap_crc32          (Ps_cap_crc32          ),
.cap_gain_cycle     (cap_gain_cycle        ),
.cap_gain_Lddel     (cap_gain_Lddel        ),
.Gc_cap_trig        (Gc_cap_trig        ),
.Gc_capr_rdy        (Gc_capr_rdy        ),
.Gc_cap_cmpt        (Gc_cap_cmpt        ),
.Gc_cap_phase       (Gc_cap_phase       ),
.Gc_merge_data      (Gc_merge_data      ),
.Gc_mereg_datv      (Gc_mereg_datv      ),
.Gc_mereg_datr      (Gc_mereg_datr      ),
.acp0_tx_en         (acp0_tx_en         ),
.acp0_tx_rdy        (acp0_tx_rdy        ),
.acp0_tx_awaddr     (acp0_tx_awaddr     ),
.acp0_tx_awid       (acp0_tx_awid       ),
.acp0_tx_wdata      (acp0_tx_wdata      ),
.acp0_tx_wdreq      (acp0_tx_wdreq      )
    );

assign Ps_cap_cing     = ctl_cap_cing       ;
assign ctl_cap_trig    = Ps_cap_trig        ;
assign Ps_cap_cmpt     = ctl_cap_cmpt       ;
assign Ps_cap_time     = ctl_cap_time       ;
assign ctl_gain_number = Ps_cap_gain_number ;
//assign Gc_cap_mode     = !rst               ;
assign Gc_cap_wdis     = Ps_cap_ld_wdis     ;
assign Gc_cap_plus     = Ps_cap_ld_plus     ;
assign cap_irq         = Ps_cap_irq_en&gp0_c0[0];

endmodule
