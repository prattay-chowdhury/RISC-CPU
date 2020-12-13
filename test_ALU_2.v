`timescale 1ns / 1ps
module test_ALU_2;

parameter N=16;

reg[N-1:0] ALU_in_1;
reg [N-1:0] ALU_in_2;
wire [N-1:0] ALU_out;
reg [2:0] ALU_control_out;
wire Zero_flag;

ALU_2 alu2(
    .ALU_in_1(ALU_in_1),
    .ALU_in_2(ALU_in_2),
    .ALU_out(ALU_out),
    .ALU_control_out(ALU_control_out),
    .Zero_flag(Zero_flag)
);

initial 
begin 
#0 ALU_in_1=20;
#0 ALU_in_2=10;
#0 ALU_control_out=0;
#5 ALU_control_out=1;
#5 ALU_control_out=2;
#5 ALU_control_out=3;
#5 ALU_control_out=2;
#5 ALU_in_1=10;
end

endmodule
