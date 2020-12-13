`timescale 1ns / 1ps
module ALU_1(
    PC_plus_one,
    Sign_ext_1_out,
    ALU_1_out
);

parameter N=16;

input [N-1:0] PC_plus_one;
input [N-1:0] Sign_ext_1_out;
output [N-1:0] ALU_1_out;

assign ALU_1_out = PC_plus_one + Sign_ext_1_out;

endmodule
