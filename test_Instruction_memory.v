`timescale 1ns / 1ps
module test_Instruction_memory;

parameter N=16;
reg [N-1:0] PC ;
wire [N-1:0] Instruction;

Instruction_Memory im1 (
    .PC(PC),
    .Instruction(Instruction)
);

initial 
 
 begin
 #0 PC =0;
 #5 PC =2;
 #5 PC =7;
 end

endmodule
