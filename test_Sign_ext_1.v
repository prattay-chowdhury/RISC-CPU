`timescale 1ns / 1ps
module test_Sign_ext_1;

parameter N=16;
parameter M=6;

reg [M-1:0] Sign_ext_1_in;
wire [N-1:0] Sign_ext_1_out;

Sign_ext_1 Sign_ext_11(
    .Sign_ext_1_in(Sign_ext_1_in),
    .Sign_ext_1_out(Sign_ext_1_out)
);

initial 
begin
    #0 Sign_ext_1_in = -6;
    #5 Sign_ext_1_in = 10;
end
endmodule
