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


module test_MUX_5;

parameter N=16;
 
reg [N-1:0] Sign_ext_2_out;
reg [N-1:0] Data_out;
reg [N-1:0] Data_write;
reg [1:0] M5;
wire [N-1:0] MUX_5_out;

MUX_5 mx5(
    .M5 (M5),
    .Sign_ext_2_out (Sign_ext_2_out),
    .Data_out (Data_out),
    .Data_write (Data_write),
    .MUX_5_out (MUX_5_out)   
);

initial

begin
    #0 M5=0;
    #0 Sign_ext_2_out = 10;
    #0 Data_out = 20;
    #0 Data_write=30;
    #5 M5=1;
    #5 M5=2;
end

endmodule
    