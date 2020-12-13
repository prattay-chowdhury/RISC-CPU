`timescale 1ns / 1ps
module Sign_ext_2(
    Sign_ext_2_in,
    Sign_ext_2_out
    );
    
    parameter N=16;
    
    input Sign_ext_2_in;
    
    output [N-1:0] Sign_ext_2_out;
    
    assign  Sign_ext_2_out[0] =  Sign_ext_2_in ;
    assign Sign_ext_2_out [N-1:1] = 0;
endmodule
