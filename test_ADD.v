`timescale 1ns / 1ps
module test_ADD;

parameter N = 16;
    
reg [N-1:0] PC_out;
wire [N-1:0] PC_plus_one;

ADD ADD1 (
        .PC_out(PC_out),
        .PC_plus_one(PC_plus_one)
);
    
initial 
begin
    #0 PC_out = 0;
    #5 PC_out = 10;
    #5 PC_out = 20;
    #5 PC_out = 0;
end
endmodule

