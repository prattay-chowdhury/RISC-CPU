`timescale 1ns / 1ps
module Sign_ext_1(
    Sign_ext_1_in,
    Sign_ext_1_out
    );
    
    parameter N=16;
    parameter M=6;
    
    input [M-1:0] Sign_ext_1_in;
    
    output [N-1:0] Sign_ext_1_out;
    
    assign  Sign_ext_1_out[M-1:0] =  Sign_ext_1_in [M-1:0];
    assign Sign_ext_1_out [N-1:M] = {10{Sign_ext_1_in [M-1]}};
endmodule