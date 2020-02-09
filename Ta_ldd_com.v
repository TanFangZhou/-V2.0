`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:27
// Design Name: 
// Module Name: Ta_ldd_com
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


module Ta_ldd_com
#(
parameter TOP0_0 = 3  ,
          LDD0_0 = 32
)(
input                   clk200        ,
input                   rst           ,
input    [TOP0_0-1:0]   com_wdis      ,
input    [LDD0_0-1:0]   com_plus      ,
input                   com_open      ,
input                   com_close     ,
output   [TOP0_0-1:0]   wdis
    );

/*
1.com_open�ߵ�ƽʱ���򿪼�������������com_plus����������δ�ر�ʱ������com_open
2.com_close�ߵ�ƽ�������������������ʱ���رռ�����
3.����������ʱ����������com_plusֵ��Ϊ�㣬��Ĵ������¼���
*/

localparam S_OFF = 0,
           S_ON  = 1;
reg             state  = S_OFF;
reg[TOP0_0-1:0] t_wdis = 0    ;
reg             com_plus_en =0;
reg[LDD0_0-1:0] com_plus_cnt=0;
always@(posedge clk200)begin
	if(rst)begin
		state        <= S_OFF ;
		t_wdis       <= 0     ;
		com_plus_en  <= 0     ;
		com_plus_cnt <= 0     ;
	end else begin
		case(state)
			S_OFF :begin
				if(com_open)begin
					state  <= S_ON    ;
					t_wdis <= com_wdis;
					com_plus_cnt <= com_plus;
					if(com_plus!=0)begin
						com_plus_en <= 1;
					end else begin
						com_plus_en <= 0;
					end
				end
			end
			S_ON  :begin
				com_plus_cnt <= com_plus_cnt - 1;
				if((com_close)|((com_plus_cnt==1)&&com_plus_en))begin
					state  <= S_OFF;
					t_wdis <= 0    ;
				end
			end
		endcase
	end
end

assign wdis = t_wdis;

endmodule
