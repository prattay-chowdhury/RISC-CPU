`timescale 1ns / 1ps

module test_inr;

parameter N=16;
parameter M=3;

reg Reg_Write;
reg [M-1:0] Reg_write_ad;
reg [N-1:0] Reg_write_data;
reg Clock;
reg inr_check;
reg [2:0] inr;
wire [N-1:0] outvalue;
reg [M-1:0] Reg_read_ad_1;
reg [M-1:0] Reg_read_ad_2;

Register_File rf2 (
         .Reg_Write(Reg_Write),
         .Reg_write_ad(Reg_write_ad),
         .Clock(Clock),
         .Reg_write_data(Reg_write_data),
         .inr_check(inr_check),
         .inr(inr),
         .outvalue(outvalue),
         .Reg_read_ad_1(Reg_read_ad_1),
         .Reg_read_ad_2(Reg_read_ad_2)
);

always

begin 
    #5 Clock=~Clock;
end 
 
initial 
    
    begin
    #0 inr=0;
    #0 inr_check=1;
    #0 Clock=0;
    #0 Reg_Write=1;
    #0 Reg_write_ad = 0;
    #0 Reg_write_data=20;
    #9 Reg_write_ad = 1;
    #0 Reg_write_data=10;
    #9 Reg_write_ad = 5;
    #0 Reg_write_data = 30;
    #5 inr=0;
    #5 inr=1;
    #5 inr=5;
    end
    
endmodule
