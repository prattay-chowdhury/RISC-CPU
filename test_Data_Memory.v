`timescale 1ns / 1ps
module test_Data_Memory;

parameter N=16;
reg [N-1:0] Data_ad ;
reg [N-1:0] Reg_read_data_2;
wire [N-1:0] Data_out;
reg Data_Write;
reg Clock;

Data_Memory dm1 (
    .Data_ad(Data_ad),
    .Reg_read_data_2(Reg_read_data_2),
    .Data_out(Data_out),
    .Data_Write(Data_Write),
    .Clock(Clock)
);

always 
begin
#4 Clock=~Clock;
end

initial 
 
 begin
 #0 Clock=0;
 #0 Reg_read_data_2 =0;
 #0 Data_Write =0;
 #0 Data_ad = 1;
 #6 Data_ad = 2;
 #6 Data_ad = 0;
 #6 Data_Write=1;
 #0 Data_ad = 1;
 #0 Reg_read_data_2 =10;
 #6 Data_ad = 2;
 #0 Reg_read_data_2 =20;
 #6 Data_ad = 0;
 #0 Reg_read_data_2 =30;
 #10 Data_Write=0;
 #0 Data_ad=1;
 #6 Data_ad=0;
 #6 Data_ad=2;
 end

endmodule
