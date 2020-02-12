`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2020/02/12 11:45:07
// Design Name:
// Module Name: tPS_EMIO
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


module tPS_EMIO
#(
parameter TOP0_0	= 3    ,
          TOP0_1	= 7    ,
          TOP0_2	= 2    ,
          TOP0_3	= 12   ,
          TOP0_4	= 4
)(
inout      [63:0]         GPIO_0_0_tri_io   ,
input                     SPI0_MISO_I_0     ,
output                    SPI0_MOSI_O_0     ,
output                    SPI0_SCLK_O_0     ,
output                    SPI0_SS1_O_0      ,
output                    SPI0_SS2_O_0      ,
output                    SPI0_SS_O_0       ,
input                     UART_0_0_rxd      ,
output                    UART_0_0_txd      ,
output                    UART0_TX          ,
input                     UART0_RX          ,
output                    ADC1_CSN          ,
output                    ADC1_SCK          ,
input                     ADC1_SDO          ,
input                     FAN0_PLUS         ,
inout    [TOP0_3-1:0]     BACK0_TRIG        ,
inout                     BACK0_STAR        ,
inout                     BACK1_CLK         ,
output                    TEMP0_CSN         ,
output                    TEMP0_SDI         ,
input                     TEMP0_SDO         ,
output                    TEMP0_SCK         ,
output                    OPM0_CSN          ,
output                    OPM0_SDI          ,
input                     OPM0_SDO          ,
output                    OPM0_SCK          ,
output                    OSW0_CS           ,
output                    OSW0_IO
    );

//PS端的串口0直连到USB转串口的一个串口，可能Tx和Rx方向反了，待调试
assign UART_0_0_rxd = UART0_RX ;
assign UART_0_0_txd = UART0_TX ;

//PS端的SPI0的SS0,SS1,SS2分别连接到光功率计SPI、温度计SPI、APD电压读取ADC的SPI
assign OPM0_CSN      = SPI0_SS_O_0      ;
assign OPM0_SDI      = SPI0_MOSI_O_0    ;
assign OPM0_SCK      = SPI0_SCLK_O_0    ;
assign SPI0_MISO_I_0 = OPM0_SDO         ;

assign TEMP0_CSN     = SPI0_SS1_O_0     ;
assign TEMP0_SDI     = SPI0_MOSI_O_0    ;
assign TEMP0_SCK     = SPI0_SCLK_O_0    ;
assign SPI0_MISO_I_0 = TEMP0_SDO        ;

assign ADC1_CSN      = SPI0_SS2_O_0     ;
assign ADC1_SCK      = SPI0_SCLK_O_0    ;
assign SPI0_MISO_I_0 = ADC1_SDO         ;

//风扇IO、光开关OSW0_IO和OSW0_CS分别对应GPIO[2]、GPIO[1]和GPIO[0]，背板接对应GPIO[3]及以上的GPIO
assign {BACK0_TRIG,BACK0_STAR,BACK1_CLK,FAN0_PLUS,OSW0_IO,OSW0_CS} = GPIO_0_0_tri_io;

endmodule
