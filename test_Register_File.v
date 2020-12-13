`timescale 1ns / 1ps

module test_Register_File;

parameter N=16;
parameter M=3;

reg Reg_Write;
reg [M-1:0] Reg_read_ad_1;
reg [M-1:0] Reg_read_ad_2;
reg [M-1:0] Reg_write_ad;
reg [N-1:0] Reg_write_data;
reg Clock;
reg Reset;
reg inr_check;
wire [N-1:0] Reg_read_data_1;
wire [N-1:0] Reg_read_data_2;

Register_File rf1 (
         .Reg_Write(Reg_Write),
         .Reg_read_ad_1(Reg_read_ad_1),
         .Reg_read_ad_2(Reg_read_ad_2),
         .Reg_write_ad(Reg_write_ad),
         .Clock(Clock),
         .Reg_write_data(Reg_write_data),
         .Reg_read_data_1(Reg_read_data_1),
         .Reg_read_data_2(Reg_read_data_2),
         .Reset(Reset),
         .inr_check(inr_check)
);

always

begin 
    #5 Clock=~Clock;
end 
 
initial 
// All registered are set initially 0    
    begin
    #0 inr_check=0; 
    #0 Reset=0;
    #0 Clock=0;
    #0 Reg_read_ad_1=0;
    #0 Reg_read_ad_2=1;
    #0 Reg_Write=1;
    #0 Reg_write_ad = 0;
    #0 Reg_write_data=20;
    #9 Reg_write_ad = 1;
    #0 Reg_write_data=10;
    #9 Reg_write_ad = 5;
    #0 Reg_write_data = 30;
    #10 Reg_Write=0;
    #0 Reg_read_ad_1=0;
    #0 Reg_read_ad_2=1;
    #5 Reg_read_ad_1=5;
    #5 Reg_write_ad=0;
    #5 Reg_write_data=1;
    #5 Reg_read_ad_1=0;
    #5 Reset=1;
    end
    
endmodule
