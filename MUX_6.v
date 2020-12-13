`timescale 1ns / 1ps



module MUX_6(
    M6,
    PC_plus_one,
    MUX_5_out,
    MUX_6_out
    );

parameter N=16;
input [N-1:0] PC_plus_one;
input [N-1:0] MUX_5_out;
input M6;
output reg [N-1:0] MUX_6_out;

always @ (*)
    
    begin 
    if (M6==0)
    MUX_6_out= PC_plus_one;
    
    else 
    MUX_6_out= MUX_5_out;
    end

endmodule
