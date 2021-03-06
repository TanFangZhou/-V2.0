`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/15 11:01:51
// Design Name:
// Module Name: Tc_PL_cap_gp
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


module Tc_PL_cap_gp
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
          CAP0_14 = 4
)(
input                     clk125             ,
input                     rst                ,
input                     cap_cing           ,
input                     cap_cmpt           ,
output                    cap_trig           ,
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
output     [CAP0_0 -1:0]  cap_irq_en         ,
output     [CAP0_1 -1:0]  cap_gain_number    ,
output     [CAP0_2 -1:0]  cap_gain_del       ,
output     [CAP0_3 -1:0]  cap_phase_number   ,
output     [CAP0_4 -1:0]  cap_ld_plus        ,
output     [CAP0_5 -1:0]  cap_ld_wdis        ,
output     [CAP0_6 -1:0]  cap_points         ,
output     [CAP0_7 -1:0]  cap_addr           ,
input      [CAP0_8 -1:0]  cap_crc32          ,
input      [CAP0_9 -1:0]  cap_time           ,
output     [CAP0_10-1:0]  cap_gain0_cycle    ,
output     [CAP0_10-1:0]  cap_gain1_cycle    ,
output     [CAP0_10-1:0]  cap_gain2_cycle    ,
output     [CAP0_10-1:0]  cap_gain3_cycle    ,
output     [CAP0_11-1:0]  cap_gain0_Lddel    ,
output     [CAP0_11-1:0]  cap_gain1_Lddel    ,
output     [CAP0_11-1:0]  cap_gain2_Lddel    ,
output     [CAP0_11-1:0]  cap_gain3_Lddel    ,
output     [CAP0_12-1:0]  cap_gain0_dacA     ,
output     [CAP0_12-1:0]  cap_gain0_dacB     ,
output     [CAP0_12-1:0]  cap_gain1_dacA     ,
output     [CAP0_12-1:0]  cap_gain1_dacB     ,
output     [CAP0_12-1:0]  cap_gain2_dacA     ,
output     [CAP0_12-1:0]  cap_gain2_dacB     ,
output     [CAP0_12-1:0]  cap_gain3_dacA     ,
output     [CAP0_12-1:0]  cap_gain3_dacB     ,
output     [CAP0_13-1:0]  cap_gain0_lmh      ,
output     [CAP0_13-1:0]  cap_gain1_lmh      ,
output     [CAP0_13-1:0]  cap_gain2_lmh      ,
output     [CAP0_13-1:0]  cap_gain3_lmh      ,
output     [CAP0_14-1:0]  cap_gain0_relay    ,
output     [CAP0_14-1:0]  cap_gain1_relay    ,
output     [CAP0_14-1:0]  cap_gain2_relay    ,
output     [CAP0_14-1:0]  cap_gain3_relay
    );

Tc_PL_cap_gp_ctl
#(
.AGP0_1(AGP0_1)
)
Tc_PL_cap_gp_ctl_ins0
(
.clk125    (clk125    ),
.rst       (rst       ),
.cap_cing  (cap_cing  ),
.cap_cmpt  (cap_cmpt  ),
.cap_trig  (cap_trig  ),
.gp0_c0    (gp0_c0    ),
.gp0_c1    (gp0_c1    ),
.gp0_c0w   (gp0_c0w   )
    );

Tc_PL_cap_gp_config
#(
.AGP0_2  (AGP0_2  ),
.AGP0_3  (AGP0_3  ),
.AGP0_5  (AGP0_5  ),
.AGP0_4  (AGP0_4  ),
.AGP0_6  (AGP0_6  ),
.AGP0_7  (AGP0_7  ),
.AGP0_8  (AGP0_8  ),
.AGP0_9  (AGP0_9  ),
.AGP0_10 (AGP0_10 ),
.AGP0_11 (AGP0_11 ),
.AGP0_12 (AGP0_12 ),
.AGP0_13 (AGP0_13 ),
.AGP0_14 (AGP0_14 ),
.AGP0_15 (AGP0_15 ),
.AGP0_16 (AGP0_16 ),
.CAP0_0  (CAP0_0  ),
.CAP0_1  (CAP0_1  ),
.CAP0_2  (CAP0_2  ),
.CAP0_3  (CAP0_3  ),
.CAP0_4  (CAP0_4  ),
.CAP0_5  (CAP0_5  ),
.CAP0_6  (CAP0_6  ),
.CAP0_7  (CAP0_7  ),
.CAP0_8  (CAP0_8  ),
.CAP0_9  (CAP0_9  ),
.CAP0_10 (CAP0_10 ),
.CAP0_11 (CAP0_11 ),
.CAP0_12 (CAP0_12 ),
.CAP0_13 (CAP0_13 ),
.CAP0_14 (CAP0_14 )
)
Tc_PL_cap_gp_config_ins0
(
.clk125             (clk125             ),
.rst                (rst                ),
.cap_cing           (cap_cing           ),
.gp0_c2             (gp0_c2             ),
.gp0_c3             (gp0_c3             ),
.gp0_c4             (gp0_c4             ),
.gp0_c5             (gp0_c5             ),
.gp0_c6             (gp0_c6             ),
.gp0_c7             (gp0_c7             ),
.gp0_c8             (gp0_c8             ),
.gp0_c9             (gp0_c9             ),
.gp0_c10            (gp0_c10            ),
.gp0_c11            (gp0_c11            ),
.gp0_c12            (gp0_c12            ),
.gp0_c13            (gp0_c13            ),
.gp0_c14            (gp0_c14            ),
.gp0_c15            (gp0_c15            ),
.gp0_c16            (gp0_c16            ),
.gp0_c17            (gp0_c17            ),
.gp0_c18            (gp0_c18            ),
.gp0_c19            (gp0_c19            ),
.gp0_c20            (gp0_c20            ),
.gp0_c21            (gp0_c21            ),
.gp0_c22            (gp0_c22            ),
.gp0_c23            (gp0_c23            ),
.gp0_c24            (gp0_c24            ),
.gp0_c25            (gp0_c25            ),
.gp0_c26            (gp0_c26            ),
.gp0_c27            (gp0_c27            ),
.gp0_c28            (gp0_c28            ),
.gp0_c29            (gp0_c29            ),
.gp0_c30            (gp0_c30            ),
.gp0_c31            (gp0_c31            ),
.gp0_c32            (gp0_c32            ),
.gp0_c33            (gp0_c33            ),
.gp0_c34            (gp0_c34            ),
.gp0_c35            (gp0_c35            ),
.cap_irq_en         (cap_irq_en         ),
.cap_gain_number    (cap_gain_number    ),
.cap_gain_del       (cap_gain_del       ),
.cap_phase_number   (cap_phase_number   ),
.cap_ld_plus        (cap_ld_plus        ),
.cap_ld_wdis        (cap_ld_wdis        ),
.cap_points         (cap_points         ),
.cap_addr           (cap_addr           ),
.cap_crc32          (cap_crc32          ),
.cap_time           (cap_time           ),
.cap_gain0_cycle    (cap_gain0_cycle    ),
.cap_gain1_cycle    (cap_gain1_cycle    ),
.cap_gain2_cycle    (cap_gain2_cycle    ),
.cap_gain3_cycle    (cap_gain3_cycle    ),
.cap_gain0_Lddel    (cap_gain0_Lddel    ),
.cap_gain1_Lddel    (cap_gain1_Lddel    ),
.cap_gain2_Lddel    (cap_gain2_Lddel    ),
.cap_gain3_Lddel    (cap_gain3_Lddel    ),
.cap_gain0_dacA     (cap_gain0_dacA     ),
.cap_gain0_dacB     (cap_gain0_dacB     ),
.cap_gain1_dacA     (cap_gain1_dacA     ),
.cap_gain1_dacB     (cap_gain1_dacB     ),
.cap_gain2_dacA     (cap_gain2_dacA     ),
.cap_gain2_dacB     (cap_gain2_dacB     ),
.cap_gain3_dacA     (cap_gain3_dacA     ),
.cap_gain3_dacB     (cap_gain3_dacB     ),
.cap_gain0_lmh      (cap_gain0_lmh      ),
.cap_gain1_lmh      (cap_gain1_lmh      ),
.cap_gain2_lmh      (cap_gain2_lmh      ),
.cap_gain3_lmh      (cap_gain3_lmh      ),
.cap_gain0_relay    (cap_gain0_relay    ),
.cap_gain1_relay    (cap_gain1_relay    ),
.cap_gain2_relay    (cap_gain2_relay    ),
.cap_gain3_relay    (cap_gain3_relay    )
    );

endmodule
