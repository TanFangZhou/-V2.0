`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:26
// Design Name: 
// Module Name: Ta_clk
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


module Ta_clk(
input      clki        ,
input      rsti        ,
input      ADC0_CLKP   ,
input      ADC0_CLKN   ,
output     rsto        ,
output     clk250      ,
output     clk200      ,
output     clk62       ,
output     clk50
    );

wire ADC0_CLK     ;
wire ADC0_CLK_DEL ;
wire DEL_RDY      ;
IBUFDS #(
.DIFF_TERM    ("FALSE"   ), // Differential Termination
.IBUF_LOW_PWR ("TRUE"    ), // Low power="TRUE", Highest performance="FALSE"
.IOSTANDARD   ("DEFAULT" )  // Specify the input I/O standard
) IBUFDS_inst1 (
.O (ADC0_CLK  ),// Buffer output
.I (ADC0_CLKP ),// Diff_p buffer input (connect directly to top-level port)
.IB(ADC0_CLKN ) // Diff_n buffer input (connect directly to top-level port)
);

(* IODELAY_GROUP = "adc_delay" *) // Specifies group name for associated IDELAYs/ODELAYs and IDELAYCTRL
IDELAYCTRL IDELAYCTRL_inst (
.RDY   (DEL_RDY   ), // 1-bit output: Ready output
.REFCLK(clki      ), // 1-bit input: Reference clock input
.RST   (rsti      )  // 1-bit input: Active high reset input
);
(* IODELAY_GROUP = "adc_delay" *) // Specifies group name for associated IDELAYs/ODELAYs and IDELAYCTRL
IDELAYE2 #(
.CINVCTRL_SEL          ("FALSE"    ),// Enable dynamic clock inversion (FALSE, TRUE)
.DELAY_SRC             ("IDATAIN"  ),// Delay input (IDATAIN, DATAIN)
.HIGH_PERFORMANCE_MODE ("FALSE"    ),// Reduced jitter ("TRUE"), Reduced power ("FALSE")
.IDELAY_TYPE           ("FIXED"    ),// FIXED, VARIABLE, VAR_LOAD, VAR_LOAD_PIPE
.IDELAY_VALUE          (0          ),// Input delay tap setting (0-31)
.PIPE_SEL              ("FALSE"    ),// Select pipelined mode, FALSE, TRUE
.REFCLK_FREQUENCY      (200.0      ),// IDELAYCTRL clock input frequency in MHz (190.0-210.0, 290.0-310.0).
.SIGNAL_PATTERN        ("DATA"     ) // DATA, CLOCK input signal
)IDELAYE2_inst0 (
.CNTVALUEOUT (             ),// 5-bit output: Counter value output
.DATAOUT     (ADC0_CLK_DEL ),// 1-bit output: Delayed data output
.C           (             ),// 1-bit input: Clock input
.CE          (             ),// 1-bit input: Active high enable increment/decrement input
.CINVCTRL    (             ),// 1-bit input: Dynamic clock inversion input
.CNTVALUEIN  (             ),// 5-bit input: Counter value input
.DATAIN      (             ),// 1-bit input: Internal delay data input
.IDATAIN     (ADC0_CLK     ),// 1-bit input: Data input from the I/O
.INC         (             ),// 1-bit input: Increment / Decrement tap delay input
.LD          (             ),// 1-bit input: Load IDELAY_VALUE input
.LDPIPEEN    (             ),// 1-bit input: Enable PIPELINE register to load data input
.REGRST      (             ) // 1-bit input: Active-high reset tap-delay input
);

wire pll0_clk_out1 ;
wire pll0_clk_out2 ;
wire pll0_clk_out3 ;
wire pll0_clk_out4 ;
wire pll0_reset    ;
wire pll0_locked   ;
wire pll0_clk_in1  ;
clk_wiz_0 instance_name
(
.clk_out1(pll0_clk_out1  ),// output clk_out1
.clk_out2(pll0_clk_out2  ),// output clk_out2
.clk_out3(pll0_clk_out3  ),// output clk_out3
.clk_out4(pll0_clk_out4  ),// output clk_out4
.reset   (pll0_reset     ),// input reset
.locked  (pll0_locked    ),// output locked
.clk_in1 (pll0_clk_in1   ) // input clk_in1
);

assign clk250 = pll0_clk_out1      ;
assign clk200 = pll0_clk_out2      ;
assign clk62  = pll0_clk_out3      ;
assign clk50  = pll0_clk_out4      ;
assign pll0_reset   = DEL_RDY      ;
assign pll0_clk_in1 = ADC0_CLK_DEL ;

localparam MSB_DEL = 16;
reg[MSB_DEL:0] delCnt=0;
always@(posedge clk50)begin
	if(!pll0_locked)begin
		delCnt <= 0;
	end else begin
		if(!delCnt[MSB_DEL])begin
			delCnt <= delCnt + 1;
		end
	end
end

reg rsto_t=1;
always@(posedge clk50)begin
	if(!pll0_locked)begin
		rsto_t <= 1;
	end else begin
		if(delCnt[MSB_DEL])begin
			rsto_t <= 0;
		end
	end
end

assign rsto = rsto_t;

endmodule

