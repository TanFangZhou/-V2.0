`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/02/09 11:45:27
// Design Name: 
// Module Name: Ta_ldd_cap
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


module Ta_ldd_cap
#(
parameter TOP0_0 = 3  ,
          LDD0_0 = 32
)(
input                   clk200        ,
input                   rst           ,
input    [TOP0_0-1:0]   cap_wdis      ,
input    [LDD0_0-1:0]   cap_plus      ,
input                   cap_trig      ,
output                  capr_rdy      ,
output   [TOP0_0-1:0]   wdis
    );

localparam LDD0_00 = 8;
localparam S_OFF = 0,
           S_ON  = 1;
reg              state        = S_ON ;
reg[TOP0_0-1:0]  t_wdis       = 0    ;
reg              t_capr_rdy   = 0    ;
reg[LDD0_00-1:0] cap_plus_cnt = 0    ;
reg              cap_plus_en  = 0    ;
always@(posedge clk200)begin
	if(rst)begin
		state        <= S_ON ;
		t_wdis       <= 0    ;
		t_capr_rdy   <= 0    ;
		cap_plus_en  <= 0    ;
		cap_plus_cnt <= 0    ;
	end else begin
		case(state)
			S_OFF :begin
				if(cap_trig)begin
					state        <= S_ON    ;
					t_capr_rdy   <= 0       ;
					t_wdis       <= cap_wdis;
					cap_plus_cnt <= cap_plus;
					if(cap_plus!=0)begin
						cap_plus_en <= 1;
					end else begin
						cap_plus_en <= 0;
					end
				end
			end
			S_ON  :begin
				cap_plus_cnt <= cap_plus_cnt - 1;
				if((!cap_plus_en)|(cap_plus_en&(cap_plus_cnt==1)))begin
					state      <= S_OFF ;
					t_capr_rdy <= 1     ;
					t_wdis     <= 0     ;
				end
			end
		endcase
	end
end

assign wdis     = t_wdis    ;
assign capr_rdy = t_capr_rdy;

endmodule
