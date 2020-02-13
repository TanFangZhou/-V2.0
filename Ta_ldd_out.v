`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/09 11:45:27
// Design Name:
// Module Name: Ta_ldd_out
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


module Ta_ldd_out
#(
parameter TOP0_0 = 3
)(
input                   clk200        ,
input                   rst           ,
input                   cap_mode      ,
input    [TOP0_0-1:0]   cap_wdis      ,
input    [TOP0_0-1:0]   com_wdis      ,
output   [TOP0_0-1:0]   wdis_out      ,
output   [TOP0_0-1:0]   LDD0_WP       ,
output   [TOP0_0-1:0]   LDD0_WN
    );

reg[TOP0_0-1:0] ldd_wdis_n=0;
always@(posedge clk200)begin
	if(rst)begin
		ldd_wdis_n <= ~0;
	end else begin
		if(cap_mode)begin
			ldd_wdis_n <= !cap_wdis;
		end else begin
			ldd_wdis_n <= !com_wdis;
		end
	end
end

reg[TOP0_0-1:0] t_wdis_out=0;
always@(posedge clk200)begin
	if(rst)begin
		t_wdis_out <= 0;
	end else begin
		t_wdis_out <= !ldd_wdis_n;
	end
end

genvar gen_ii;
generate
    for (gen_ii=0; gen_ii < TOP0_0; gen_ii=gen_ii+1)
    begin: WDIS_DS_n
    	OBUFDS #(
			.IOSTANDARD("DEFAULT"), // Specify the output I/O standard
			.SLEW("SLOW")           // Specify the output slew rate
			) OBUFDS_inst (
			.O (LDD0_WP   [gen_ii]   ),  // Diff_p output (connect directly to top-level port)
			.OB(LDD0_WN   [gen_ii]   ),  // Diff_n output (connect directly to top-level port)
			.I (ldd_wdis_n[gen_ii]   )   // Buffer input
			);
    end
endgenerate

assign wdis_out = t_wdis_out;

endmodule
