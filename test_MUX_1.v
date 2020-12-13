`timescale 1ns / 1ps
module test_MUX_1;

parameter N=16;
 
 reg [N-1:0] Jump_address;
 reg [N-1:0] MUX_7_out;
 reg [N-1:0] Reg_read_data_1;
 reg [1:0] M1;
 wire [N-1:0] PC_write_data;

MUX_1 mx1(
    .M1 (M1),
    .Jump_address (Jump_address),
    .MUX_7_out (MUX_7_out),
    .Reg_read_data_1 (Reg_read_data_1),
    .PC_write_data (PC_write_data)   
);

initial

begin
    #0 M1=0;
    #0 Jump_address = 10;
    #0 MUX_7_out = 20;
    #0 Reg_read_data_1=30;
    #5 M1=1;
    #5 M1=2;
end

endmodule
    