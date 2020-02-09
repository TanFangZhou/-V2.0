`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:27
// Design Name: 
// Module Name: Ta_adc
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


module Ta_adc
#(
parameter TOP0_1 = 7  ,
          ADC0_0 = 14 ,
          ADC0_1 = 56
)(
input                   clk250        ,
input                   rst           ,
input    [TOP0_1-1:0]   ADC0_DAP      ,
input    [TOP0_1-1:0]   ADC0_DAN      ,
input                   ADC0_OFP      ,
input                   ADC0_OFN      ,
output                  adc_of        ,
output   [ADC0_0-1:0]   adc_data      ,
input                   merge_en      ,
input                   clk62         ,
output   [ADC0_1-1:0]   merge_data    ,
output                  mereg_datv
    );

Ta_adc_ddr
#(
.TOP0_1 (TOP0_1 ),
.ADC0_0 (ADC0_0 )
)
Ta_adc_ddr_ins0
(
.clk250    (clk250    ),
.rst       (rst       ),
.ADC0_DAP  (ADC0_DAP  ),
.ADC0_DAN  (ADC0_DAN  ),
.ADC0_OFP  (ADC0_OFP  ),
.ADC0_OFN  (ADC0_OFN  ),
.adc_of    (adc_of    ),
.adc_data  (adc_data  )
    );

Ta_adc_merge
#(
.ADC0_0 (ADC0_0 ),
.ADC0_1 (ADC0_1 )
)
Ta_adc_merge_ins0
(
.clk250      (clk250      ),
.merge_en    (merge_en    ),
.adc_data    (adc_data    ),
.clk62       (clk62       ),
.merge_data  (merge_data  ),
.mereg_datv  (mereg_datv  )
    );

endmodule
