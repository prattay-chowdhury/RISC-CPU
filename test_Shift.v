`timescale 1ns / 1ps
module test_Shift;

parameter N=16;
reg Shift_dir;
reg [2:0] Shift_amnt;
reg [N-1:0] Reg_read_data_1;
wire [N-1:0] Shift_out;

Shift sft1(
    .Shift_dir(Shift_dir),
    .Shift_amnt(Shift_amnt),
    .Reg_read_data_1(Reg_read_data_1),
    .Shift_out(Shift_out)
);

initial 
begin
#0 Shift_dir=0;
#0 Shift_amnt=3;
#0 Reg_read_data_1=16;
#5 Shift_amnt=2;
#5 Shift_dir=1;
#5 Shift_amnt=3;
end
endmodule
