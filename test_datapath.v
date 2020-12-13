`timescale 1ns / 1ps
module test_datapath;

parameter N=16;

reg [N-1:0] Data_out;
reg Clock;
reg Reset;
reg [N-1:0] Instruction;  
reg Inr_Check;
reg [2:0] Inr;
wire [N-1:0] outvalue;
wire [N-1:0] Data_write;
wire [N-1:0] PC;
wire [N-1:0] Data_write_ad;

top_datapath dtpth1(
             .Clock(Clock),
             .Reset(Reset),
             .PC_Instruction_memory_adder(PC),
             .Instruction(Instruction),
             .Inr(Inr),
             .Inr_Check(Inr_Check),
             .outvalue(outvalue),  
             .MUX4_Data_ad(Data_write_ad),
             .Reg_MUX3_Data_write(Data_write),
             .Data_MUX5(Data_out)    
);


initial 
 begin
 #0 Data_out=15;
 #0 Clock=0;
 #0 Reset=0;
 #0 Inr_Check=1;
 #0 Inr=1;
 #0 Instruction=16'b1010000001010010;
 #5 Clock=1;
 #5 Clock=0;
 #5 Clock=1;
 #5 Clock=0;
 end
endmodule
