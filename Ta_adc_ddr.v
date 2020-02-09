`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:27
// Design Name: 
// Module Name: Ta_adc_ddr
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


module Ta_adc_ddr
#(
parameter TOP0_1 = 7  ,
          ADC0_0 = 14
)(
input                   clk250        ,
input                   rst           ,
input    [TOP0_1-1:0]   ADC0_DAP      ,
input    [TOP0_1-1:0]   ADC0_DAN      ,
input                   ADC0_OFP      ,
input                   ADC0_OFN      ,
output                  adc_of        ,
output   [ADC0_0-1:0]   adc_data
    );

wire              ADC0_OF ;
wire [TOP0_1-1:0] ADC0_DA ;
IBUFDS #(
.DIFF_TERM   ("FALSE"  ), // Differential Termination
.IBUF_LOW_PWR("TRUE"   ), // Low power="TRUE", Highest performance="FALSE"
.IOSTANDARD  ("DEFAULT")  // Specify the input I/O standard
) IBUFDS_inst1 (
.O (ADC0_OF  ),  // Buffer output
.I (ADC0_OFP ),  // Diff_p buffer input (connect directly to top-level port)
.IB(ADC0_OFN ) // Diff_n buffer input (connect directly to top-level port)
);
genvar Gen_ii;
generate
	for(Gen_ii=0; Gen_ii<TOP0_1; Gen_ii=Gen_ii+1)begin
		IBUFDS #(
		.DIFF_TERM   ("FALSE"  ), // Differential Termination
		.IBUF_LOW_PWR("TRUE"   ), // Low power="TRUE", Highest performance="FALSE"
		.IOSTANDARD  ("DEFAULT")  // Specify the input I/O standard
		) IBUFDS_inst2 (
		.O (ADC0_DA [Gen_ii] ), // Buffer output
		.I (ADC0_DAP[Gen_ii] ), // Diff_p buffer input (connect directly to top-level port)
		.IB(ADC0_DAN[Gen_ii] )  // Diff_n buffer input (connect directly to top-level port)
		);
	end
endgenerate

wire              IDDR_OF ;
wire [ADC0_0-1:0] IDDR_DA ;
IDDR #(
.DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED"
.INIT_Q1     (1'b0                 ), // Initial value of Q1: 1'b0 or 1'b1
.INIT_Q2     (1'b0                 ), // Initial value of Q2: 1'b0 or 1'b1
.SRTYPE      ("SYNC"               )  // Set/Reset type: "SYNC" or "ASYNC"
) IDDR_inst0 (
.Q1(IDDR_OF ), // 1-bit output for positive edge of clock
.Q2(        ), // 1-bit output for negative edge of clock
.C (clk250  ),   // 1-bit clock input
.CE(1       ), // 1-bit clock enable input
.D (ADC0_OF ),   // 1-bit DDR data input
.R (rst     ),   // 1-bit reset
.S (0       )    // 1-bit set
);
generate
	for (Gen_ii=0; Gen_ii<TOP0_1; Gen_ii=Gen_ii+1)begin
		IDDR #(
		.DDR_CLK_EDGE("SAME_EDGE_PIPELINED"), // "OPPOSITE_EDGE", "SAME_EDGE" or "SAME_EDGE_PIPELINED"
		.INIT_Q1     (1'b0                 ), // Initial value of Q1: 1'b0 or 1'b1
		.INIT_Q2     (1'b0                 ), // Initial value of Q2: 1'b0 or 1'b1
		.SRTYPE      ("SYNC"               )  // Set/Reset type: "SYNC" or "ASYNC"
		) IDDR_inst1 (
		.Q1(IDDR_DA[2*Gen_ii  ] ), // 1-bit output for positive edge of clock
		.Q2(IDDR_DA[2*Gen_ii+1] ), // 1-bit output for negative edge of clock
		.C (clk250              ), // 1-bit clock input
		.CE(1                   ), // 1-bit clock enable input
		.D (ADC0_DA[Gen_ii]     ), // 1-bit DDR data input
		.R (rst                 ), // 1-bit reset
		.S (0                   )  // 1-bit set
		);
	end
endgenerate

reg              tadc_of   =0;
reg [ADC0_0-1:0] tadc_data =0;
always@(posedge clk250)begin
	if(rst)begin
		tadc_of   <= 0;
		tadc_data <= 0;
	end else begin
		tadc_of   <= IDDR_OF ;
		tadc_data <= IDDR_DA ;
	end
end

assign adc_of   = tadc_of   ;
assign adc_data = tadc_data ;

endmodule
