`timescale 1ns / 1ps
module test_Sign_ext_2;

parameter N=16;

reg Sign_ext_2_in;
wire [N-1:0] Sign_ext_2_out;

Sign_ext_2 Sign_ext_21(
    .Sign_ext_2_in(Sign_ext_2_in),
    .Sign_ext_2_out(Sign_ext_2_out)
);

initial 
begin
    #0 Sign_ext_2_in = 1;
    #5 Sign_ext_2_in = 0;
end
endmodule
