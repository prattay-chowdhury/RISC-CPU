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


module test_MUX_6;

parameter N=16;

reg M6;
reg [N-1:0] PC_plus_one;
reg [N-1:0] MUX_5_out;
wire [N-1:0] MUX_6_out;

MUX_6 mx6 (
    .M6 (M6),
    .PC_plus_one (PC_plus_one),
    .MUX_5_out (MUX_5_out),
    .MUX_6_out (MUX_6_out)
);

initial

begin
    #0 M6=0;
    #0 PC_plus_one = 10;
    #0 MUX_5_out = 20;
    #5 M6=1;
end

endmodule
    