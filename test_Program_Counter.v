`timescale 1ns / 1ps

module test_Program_Counter;

parameter N = 16;

reg [N-1:0] PC_in;
wire [N-1:0] PC_out;
reg Reset;
reg PC_write_data;
reg Clock;

Program_Counter pc1 (
    .PC_in(PC_in),
    .PC_out(PC_out),
    .PC_write_data(PC_write_data),
    .Clock(Clock),
    .Reset(Reset)
);

initial 
begin
    #0 Reset=0;
    #0 Clock = 1;
    #0 PC_in = 10;
    #0 PC_write_data = 0;
    #15 PC_write_data = 1;
    #15 Reset=1;
    #0 PC_write_data=0; 
end

always 
begin 
    #5 Clock = !Clock;
end


endmodule
