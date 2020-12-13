`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2017 09:38:55 PM
// Design Name: 
// Module Name: test_MUX_1
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


module test_MUX_2;

parameter N=3;
 
 reg [N-1:0] rt;
 reg [N-1:0] rd;
 reg [1:0] M2;
 wire [N-1:0] Reg_write_ad;

MUX_2 mx2(
    .M2 (M2),
    .rd (rd),
    .rt (rt),
    .Reg_write_ad (Reg_write_ad)   
);

initial

begin
    #0 M2=0;
    #0 rt = 20;
    #0 rd=30;
    #5 M2=1;
    #5 M2=2;
end

endmodule
    