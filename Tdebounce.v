`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/19 12:03:14
// Design Name:
// Module Name: Tdebounce
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


module Tdebounce
#(
parameter VAL_CNT = 3
)(
input        clk        ,
input        rst        ,
input        signal_in  ,
output       signal_out
    );

function integer f_msb (input integer value);
  begin
    value = value>>1;
    for(f_msb=0; value>0; f_msb=f_msb+1)
    value = value>>1;
  end
endfunction
localparam MAX_CNT = VAL_CNT-1     ,
           MSB_CNT = f_msb(MAX_CNT);

reg reg_signal_out=0;

reg[MSB_CNT:0] del_cnt=0;
always@(posedge clk)begin
	if(rst)begin
		del_cnt <= 0;
	end else begin
		if(signal_in^signal_out)begin
			del_cnt <= del_cnt + 1;
		end else begin
			del_cnt <= 0;
		end
	end
end

always@(posedge clk)begin
	if(rst)begin
		reg_signal_out <= 0;
	end else begin
		if((signal_in^signal_out)&&(del_cnt==MAX_CNT))begin
			reg_signal_out <= signal_in;
		end
	end
end

assign signal_out = reg_signal_out;

endmodule
