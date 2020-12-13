`timescale 1ns / 1ps
module test_MUX_3;

parameter N=16;

reg  M3; 
reg [N-1:0] Sign_ext_1_out;
reg [N-1:0] Reg_read_data_2;
wire [N-1:0] MUX_3_out;

MUX_3 mx3 (
    .M3 (M3),
    .Sign_ext_1_out (Sign_ext_1_out),
    .Reg_read_data_2 (Reg_read_data_2),
    .MUX_3_out (MUX_3_out) 
);

initial

begin
    #0 M3=0;
    #0 Reg_read_data_2 = 10;
    #0 Sign_ext_1_out = 20;
    #5 M3=1;
end

endmodule
    