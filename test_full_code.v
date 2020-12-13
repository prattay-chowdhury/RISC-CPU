`timescale 1ns / 1ps
module test_full_code;

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

//Program Counter Value Initially Set to zero

always 
begin 
    #5 Clock = !Clock;
end

initial 
 begin
 #0 $monitor ("t=%g ns, PC=%d, reg0=%d, reg1=%d, reg2=%d, reg3=%d, reg4=%d, reg5=%d, reg6=%d, reg7=%d", $time, dtpth1.pc1.PC_out, dtpth1.rf1.reg_0, dtpth1.rf1.reg_1, dtpth1.rf1.reg_2, dtpth1.rf1.reg_3, dtpth1.rf1.reg_4, dtpth1.rf1.reg_5, dtpth1.rf1.reg_6, dtpth1.rf1.reg_7);
 #0 Clock=0;
 #0 Reset=0;
 #0 Inr_Check=1;
 #0 Inr=0;
 #0 Data_out=0;
 #0 Instruction=16'b1000000001000001;
 #5 Instruction=16'b1000000010000010;
#10 Instruction=16'b1000000011000011;
#10 Instruction=16'b0010011001011000;
#10 Instruction=16'b1011001011111110;
#10 Instruction=16'b0010011001011000;
#10 Instruction=16'b1011001011111110;
#10 Instruction=16'b0011001010101000;
#10 Instruction=16'b0100001010110000;

#10 Instruction=16'b0101001011100000;
#10 Instruction=16'b0110010011000001;
#10 Instruction=16'b0111010011000001;
#10 Instruction=16'b1101000000001101;
#10 Instruction=16'b0001011010100000;
#10 Instruction=16'b1111111000000000;
#10 Instruction=16'b0001001011010000;
#10 Instruction=16'b1110000000001111;
#10 Instruction=16'b1100100000001101;
#10 Instruction=0;
#10 $finish;
end

endmodule
