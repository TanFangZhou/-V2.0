`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/16 13:01:34
// Design Name:
// Module Name: Tc_PL_cap_data_ctl
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


module Tc_PL_cap_data_ctl(
input                     clk         ,
input                     rst         ,
input                     data_en     ,
output                    data_cmpt   ,
output                    buff_en     ,
input                     buff_cmpt   ,
output                    tacp_en     ,
input                     tacp_cmpt
    );

reg t_data_cmpt =0;
reg t_buff_en   =0;
reg t_tacp_en   =0;

localparam S_INIT = 0,
           S_BUFF = 1,
           S_TACP = 2,
           S_CMPT = 3;
reg[1:0] state = S_INIT;
always@(posedge clk)begin
	if(!data_en)begin
		state       <= S_INIT;
		t_data_cmpt <= 0     ;
		t_buff_en   <= 0     ;
		t_tacp_en   <= 0     ;
	end else begin
		case(state)
			S_INIT :begin
				state       <= S_BUFF;
				t_buff_en   <= 1     ;
			end
			S_BUFF :begin
				if(buff_cmpt)begin
					state       <= S_TACP;
					t_buff_en   <= 0     ;
					t_tacp_en   <= 1     ;
				end
			end
			S_TACP :begin
				if(tacp_cmpt)begin
					state       <= S_CMPT;
					t_tacp_en   <= 0     ;
					t_data_cmpt <= 1     ;
				end
			end
			S_CMPT :begin

			end
		endcase
	end
end

assign data_cmpt = t_data_cmpt ;
assign buff_en   = t_buff_en   ;
assign tacp_en   = t_tacp_en   ;

endmodule
