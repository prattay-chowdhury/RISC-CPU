`timescale 1ns / 1ps
module ALU_2(
    ALU_in_1,
    ALU_in_2,
    ALU_out,
    ALU_control_out,
    Zero_flag
);

parameter N=16;
input [N-1:0] ALU_in_1;
input [1:0] ALU_control_out;
input [N-1:0] ALU_in_2;
output reg [N-1:0] ALU_out;
output reg Zero_flag;

always @ (*)
    begin
    case (ALU_control_out)
    
    2'b00: ALU_out = ALU_in_1 + ALU_in_2;
    2'b01: ALU_out = ALU_in_1-ALU_in_2;
    2'b10: ALU_out = (ALU_in_1) & (ALU_in_2);
    2'b11: ALU_out = (ALU_in_1) | (ALU_in_2);
    
    endcase 
    end

always @ (*)
    begin
    if ((ALU_in_1-ALU_in_2)==0)
    Zero_flag=1;
    else Zero_flag=0;
    end
endmodule
