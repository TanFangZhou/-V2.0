`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/14 17:00:58
// Design Name:
// Module Name: Tc_PL_cap_gain
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


module Tc_PL_cap_gain
#(
parameter CAP0_1  = 2   ,
	        CAP0_2  = 32  ,
	        CAP0_10 = 18  ,
	        CAP0_11 = 32  ,
	        CAP0_12 = 32  ,
	        CAP0_13 = 6   ,
          CAP0_14 = 4
)(
input                     clk                ,
input                     rst                ,
input      [CAP0_1 -2:0]  gain_value	       ,
input                     gain_en            ,
output                    gain_cmpt          ,
input      [CAP0_2 -1:0]  cap_gain_del       ,
input      [CAP0_12-1:0]  cap_gain0_dacA     ,
input      [CAP0_12-1:0]  cap_gain0_dacB     ,
input      [CAP0_12-1:0]  cap_gain1_dacA     ,
input      [CAP0_12-1:0]  cap_gain1_dacB     ,
input      [CAP0_12-1:0]  cap_gain2_dacA     ,
input      [CAP0_12-1:0]  cap_gain2_dacB     ,
input      [CAP0_12-1:0]  cap_gain3_dacA     ,
input      [CAP0_12-1:0]  cap_gain3_dacB     ,
input      [CAP0_13-1:0]  cap_gain0_lmh      ,
input      [CAP0_13-1:0]  cap_gain1_lmh      ,
input      [CAP0_13-1:0]  cap_gain2_lmh      ,
input      [CAP0_13-1:0]  cap_gain3_lmh      ,
input      [CAP0_14-1:0]  cap_gain0_relay    ,
input      [CAP0_14-1:0]  cap_gain1_relay    ,
input      [CAP0_14-1:0]  cap_gain2_relay    ,
input      [CAP0_14-1:0]  cap_gain3_relay    ,
input      [CAP0_10-1:0]  cap_gain0_cycle    ,
input      [CAP0_10-1:0]  cap_gain1_cycle    ,
input      [CAP0_10-1:0]  cap_gain2_cycle    ,
input      [CAP0_10-1:0]  cap_gain3_cycle    ,
input      [CAP0_11-1:0]  cap_gain0_Lddel    ,
input      [CAP0_11-1:0]  cap_gain1_Lddel    ,
input      [CAP0_11-1:0]  cap_gain2_Lddel    ,
input      [CAP0_11-1:0]  cap_gain3_Lddel    ,
output     [CAP0_10-1:0]  cap_gain_cycle     ,
output     [CAP0_11-1:0]  cap_gain_Lddel     ,
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

wire                gset_en           ;
wire                gset_adc_cmpt     ;
wire                gset_lmh_cmpt     ;
wire                gset_relay_cmpt   ;
wire [CAP0_12-1:0]  gset_dacA         ;
wire [CAP0_12-1:0]  gset_dacB         ;
wire [CAP0_13-1:0]  gset_lmh          ;
wire [CAP0_14-1:0]  gset_relay        ;
Tc_PL_cap_gain_ctl
#(
.CAP0_1  (CAP0_1 ),
.CAP0_2  (CAP0_2 ),
.CAP0_12 (CAP0_12),
.CAP0_13 (CAP0_13),
.CAP0_14 (CAP0_14)
)
Tc_PL_cap_gain_ctl_ins0
(
.clk              (clk               ),
.rst              (rst               ),
.gain_value       (gain_value        ),
.gain_en          (gain_en           ),
.gain_cmpt        (gain_cmpt         ),
.cap_gain_del     (cap_gain_del      ),
.cap_gain0_dacA   (cap_gain0_dacA    ),
.cap_gain0_dacB   (cap_gain0_dacB    ),
.cap_gain1_dacA   (cap_gain1_dacA    ),
.cap_gain1_dacB   (cap_gain1_dacB    ),
.cap_gain2_dacA   (cap_gain2_dacA    ),
.cap_gain2_dacB   (cap_gain2_dacB    ),
.cap_gain3_dacA   (cap_gain3_dacA    ),
.cap_gain3_dacB   (cap_gain3_dacB    ),
.cap_gain0_lmh    (cap_gain0_lmh     ),
.cap_gain1_lmh    (cap_gain1_lmh     ),
.cap_gain2_lmh    (cap_gain2_lmh     ),
.cap_gain3_lmh    (cap_gain3_lmh     ),
.cap_gain0_relay  (cap_gain0_relay   ),
.cap_gain1_relay  (cap_gain1_relay   ),
.cap_gain2_relay  (cap_gain2_relay   ),
.cap_gain3_relay  (cap_gain3_relay   ),
.gset_en          (gset_en           ),
.gset_adc_cmpt    (gset_adc_cmpt     ),
.gset_lmh_cmpt    (gset_lmh_cmpt     ),
.gset_relay_cmpt  (gset_relay_cmpt   ),
.gset_dacA        (gset_dacA         ),
.gset_dacB        (gset_dacB         ),
.gset_lmh         (gset_lmh          ),
.gset_relay       (gset_relay        )
    );

Tc_PL_cap_gain_adc
#(
.CAP0_12 (CAP0_12)
)
Tc_PL_cap_gain_adc_ins0
(
.clk                (clk                ),
.rst                (rst                ),
.gset_en            (gset_en            ),
.gset_adc_cmpt      (gset_adc_cmpt      ),
.gset_dacA          (gset_dacA          ),
.gset_dacB          (gset_dacB          ),
.DAC0_SDI           (DAC0_SDI           ),
.DAC0_SCK           (DAC0_SCK           ),
.DAC0_CSN           (DAC0_CSN           )
    );

Tc_PL_cap_gain_lmh
#(
.CAP0_13 (CAP0_13)
)
Tc_PL_cap_gain_lmh_ins0
(
.clk                (clk                ),
.rst                (rst                ),
.gset_en            (gset_en            ),
.gset_lmh_cmpt      (gset_lmh_cmpt      ),
.gset_lmh           (gset_lmh           ),
.FDA0_SCK           (FDA0_SCK           ),
.FDA0_CSN           (FDA0_CSN           ),
.FDA0_SDI           (FDA0_SDI           )
    );

Tc_PL_cap_gain_relay
#(
.CAP0_14 (CAP0_14)
)
Tc_PL_cap_gain_relay_ins0
(
.clk                (clk                ),
.rst                (rst                ),
.gset_en            (gset_en            ),
.gset_relay_cmpt    (gset_relay_cmpt    ),
.gset_relay         (gset_relay         ),
.OPA0_10X1          (OPA0_10X1          ),
.OPA0_10X2          (OPA0_10X2          ),
.OPA0_OPX1          (OPA0_OPX1          ),
.OPA0_OPX2          (OPA0_OPX2          )
    );

Tc_PL_cap_gain_data
#(
.CAP0_1  (CAP0_1  ),
.CAP0_10 (CAP0_10 ),
.CAP0_11 (CAP0_11 )
)
Tc_PL_cap_gain_data_ins0
(
.clk             (clk             ),
.rst             (rst             ),
.gain_value      (gain_value      ),
.gain_en         (gain_en         ),
.cap_gain0_cycle (cap_gain0_cycle ),
.cap_gain1_cycle (cap_gain1_cycle ),
.cap_gain2_cycle (cap_gain2_cycle ),
.cap_gain3_cycle (cap_gain3_cycle ),
.cap_gain0_Lddel (cap_gain0_Lddel ),
.cap_gain1_Lddel (cap_gain1_Lddel ),
.cap_gain2_Lddel (cap_gain2_Lddel ),
.cap_gain3_Lddel (cap_gain3_Lddel ),
.cap_gain_cycle  (cap_gain_cycle  ),
.cap_gain_Lddel  (cap_gain_Lddel  )
    );

endmodule
