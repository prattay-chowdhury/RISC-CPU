`timescale 1ns / 1ps
module ADD ( 
    PC_out, 
    PC_plus_one
);

parameter N=16;

input [N-1:0] PC_out;
output [N-1:0] PC_plus_one;

assign PC_plus_one = PC_out+1;

endmodule
