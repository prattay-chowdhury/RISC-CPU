`timescale 1ns / 1ps
module test_ALU_1;

parameter N = 16;
    
reg [N-1:0] PC_plus_one;
reg [N-1:0] Sign_ext_1_out;
wire [N-1:0] ALU_1_out;

ALU_1 ALU_11 (
        .ALU_1_out(ALU_1_out),
        .PC_plus_one(PC_plus_one),
        .Sign_ext_1_out(Sign_ext_1_out)
);
    
initial 
begin
    #0 PC_plus_one = 0;
    #0 Sign_ext_1_out = 20;
    #5 PC_plus_one = 10;
    #5 Sign_ext_1_out = 0;
end

endmodule
