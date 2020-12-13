`timescale 1ns / 1ps
module MUX_3 (
    M3,
    Sign_ext_1_out,
    Reg_read_data_2,
    MUX_3_out
    );

parameter N=16;

input [N-1:0] Sign_ext_1_out;
input [N-1:0] Reg_read_data_2;
input M3;
output reg [N-1:0] MUX_3_out;

always @ (*)
    
    begin 
    if (M3==0)
    MUX_3_out = Sign_ext_1_out;
    
    else 
    MUX_3_out= Reg_read_data_2;
    end

endmodule
