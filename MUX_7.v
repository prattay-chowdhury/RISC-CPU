`timescale 1ns / 1ps



module MUX_7(
    M7,
    PC_plus_one,
    ALU_1_out,
    MUX_7_out
    );

parameter N=16;
input [N-1:0] PC_plus_one;
input [N-1:0] ALU_1_out;
input M7;
output reg [N-1:0] MUX_7_out;

always @ (*)
    
    begin 
    if (M7==0)
    MUX_7_out= PC_plus_one;
    
    else 
    MUX_7_out= ALU_1_out;
    end

endmodule
