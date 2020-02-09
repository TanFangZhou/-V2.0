`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:27
// Design Name: 
// Module Name: Ta_adc_merge
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


module Ta_adc_merge
#(
parameter ADC0_0 = 14  ,
          ADC0_1 = 56
)(
input                   clk250        ,
input                   merge_en      ,
input    [ADC0_0-1:0]   adc_data      ,
input                   clk62         ,
output   [ADC0_1-1:0]   merge_data    ,
output                  mereg_datv
    );

function integer f_msb (input integer value);
  begin
    value = value>>1;
    for(f_msb=0; value>0; f_msb=f_msb+1)
    value = value>>1;
  end
endfunction

localparam NUM_MERGE  = ADC0_1/ADC0_0       ,
           WTH_MSHIFT = f_msb(NUM_MERGE-1)+1;

reg[ADC0_1-1:0]     merge_shift     =0;
reg[WTH_MSHIFT-1:0] merge_shift_cnt =0;
always@(posedge clk250)begin
	if(!merge_en)begin
		merge_shift     <= 0;
		merge_shift_cnt <= 0;
	end else begin
		merge_shift     <= {adc_data,merge_shift[ADC0_1-1:ADC0_0]};
		merge_shift_cnt <= merge_shift_cnt + 1;
	end
end

reg             merge_tag =0;
reg[ADC0_1-1:0] merge_dt0 =0;
reg[ADC0_1-1:0] merge_dt1 =0;
always@(posedge clk250)begin
	if(!merge_en)begin
		merge_tag <= 0;
		merge_dt0 <= 0;
		merge_dt1 <= 0;
	end else begin
		if(merge_shift_cnt==0)begin
			merge_tag <= !merge_tag;
			if(merge_tag)begin
				merge_dt0 <= merge_shift;
			end else begin
				merge_dt1 <= merge_shift;
			end
		end
	end
end

reg[ADC0_1-1:0] t_merge_data =0;
reg             t_mereg_datv =0;
always@(posedge clk62)begin
	if(!merge_en)begin
		t_merge_data <= 0;
		t_mereg_datv <= 0;
	end else begin
		if(merge_tag)begin
			t_merge_data <= merge_dt1;
			t_mereg_datv <= 1;
		end else begin
			t_merge_data <= merge_dt0;
		end
	end
end

assign merge_data = t_merge_data;
assign mereg_datv = t_mereg_datv;

endmodule
