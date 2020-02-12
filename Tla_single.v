`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 16:09:27
// Design Name:
// Module Name: Tla_single
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


module Tla_single
#(
parameter TOP0_0  = 3         ,
          TOP0_1  = 7         ,
          TOP0_2  = 2         ,
          TOP0_3  = 12        ,
          TOP0_4  = 4         ,
          ADC0_0  = TOP0_1*2  ,
          ADC0_1  = ADC0_0*4  ,
          LDD0_0  = 32        ,
          CAP0_0  = 4         ,
          CAP0_1  = 2
)(
input                    Gc_clk125        ,
input                    Gc_rst           ,
output                   Gc_adc_of        ,
output    [ADC0_0-1:0]   Gc_adc_data      ,
input                    Gc_cap_mode      ,
input     [TOP0_0-1:0]   Gc_cap_wdis      ,
input     [LDD0_0-1:0]   Gc_cap_plus      ,
input     [TOP0_0-1:0]   Gc_com_wdis      ,
input     [LDD0_0-1:0]   Gc_com_plus      ,
input                    Gc_com_open      ,
input                    Gc_com_close     ,
output    [TOP0_0-1:0]   Gc_wdis          ,
input                    Gc_cap_trig      ,
output                   Gc_capr_rdy      ,
input                    Ga_clk250        ,
input                    Ga_adc_of        ,
input     [ADC0_0-1:0]   Ga_adc_data      ,
input                    Ga_clk200        ,
output                   Ga_cap_mode      ,
output    [TOP0_0-1:0]   Ga_cap_wdis      ,
output    [LDD0_0-1:0]   Ga_cap_plus      ,
output    [TOP0_0-1:0]   Ga_com_wdis      ,
output    [LDD0_0-1:0]   Ga_com_plus      ,
output                   Ga_com_open      ,
output                   Ga_com_close     ,
input     [TOP0_0-1:0]   Ga_wdis          ,
input                    Ga_clk50         ,
output                   Ga_cap_trig      ,
input                    Ga_capr_rdy
    );

Tla_single_250
#(
.TOP0_0 (TOP0_0 ),
.TOP0_1 (TOP0_1 ),
.TOP0_2 (TOP0_2 ),
.TOP0_3 (TOP0_3 ),
.TOP0_4 (TOP0_4 ),
.ADC0_0 (ADC0_0 ),
.ADC0_1 (ADC0_1 ),
.LDD0_0 (LDD0_0 ),
.CAP0_0 (CAP0_0 ),
.CAP0_1 (CAP0_1 )
)
Tla_single_250_ins0
(
.Gc_clk125        (Gc_clk125        ),
.Gc_rst           (Gc_rst           ),
.Gc_adc_of        (Gc_adc_of        ),
.Gc_adc_data      (Gc_adc_data      ),
.Ga_clk250        (Ga_clk250        ),
.Ga_adc_of        (Ga_adc_of        ),
.Ga_adc_data      (Ga_adc_data      )
    );

Tla_single_200
#(
.TOP0_0 (TOP0_0),
.TOP0_1 (TOP0_1),
.TOP0_2 (TOP0_2),
.TOP0_3 (TOP0_3),
.TOP0_4 (TOP0_4),
.ADC0_0 (ADC0_0),
.ADC0_1 (ADC0_1),
.LDD0_0 (LDD0_0),
.CAP0_0 (CAP0_0),
.CAP0_1 (CAP0_1)
)
Tla_single_200_ins0
(
.Gc_clk125        (Gc_clk125        ),
.Gc_rst           (Gc_rst           ),
.Gc_cap_mode      (Gc_cap_mode      ),
.Gc_cap_wdis      (Gc_cap_wdis      ),
.Gc_cap_plus      (Gc_cap_plus      ),
.Gc_com_wdis      (Gc_com_wdis      ),
.Gc_com_plus      (Gc_com_plus      ),
.Gc_com_open      (Gc_com_open      ),
.Gc_com_close     (Gc_com_close     ),
.Gc_wdis          (Gc_wdis          ),
.Ga_clk200        (Ga_clk200        ),
.Ga_cap_mode      (Ga_cap_mode      ),
.Ga_cap_wdis      (Ga_cap_wdis      ),
.Ga_cap_plus      (Ga_cap_plus      ),
.Ga_com_wdis      (Ga_com_wdis      ),
.Ga_com_plus      (Ga_com_plus      ),
.Ga_com_open      (Ga_com_open      ),
.Ga_com_close     (Ga_com_close     ),
.Ga_wdis          (Ga_wdis          )
    );

Tla_single_50
Tla_single_50_ins0
(
.Gc_clk125        (Gc_clk125        ),
.Gc_rst           (Gc_rst           ),
.Gc_cap_trig      (Gc_cap_trig      ),
.Gc_capr_rdy      (Gc_capr_rdy      ),
.Ga_clk50         (Ga_clk50         ),
.Ga_cap_trig      (Ga_cap_trig      ),
.Ga_capr_rdy      (Ga_capr_rdy      )
    );

endmodule
