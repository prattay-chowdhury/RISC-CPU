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


module test_MUX_4;

parameter N=16;

reg M4;
reg [N-1:0] ALU_out;
reg [N-1:0] Shift_out;
wire [N-1:0] MUX_4_out;

MUX_4 mx4 (
    .M4 (M4),
    .ALU_out (ALU_out),
    .Shift_out (Shift_out),
    .MUX_4_out (MUX_4_out)
);

initial

begin
    #0 M4=0;
    #0 Shift_out = 10;
    #0 ALU_out = 20;
    #5 M4=1;
end

endmodule
    