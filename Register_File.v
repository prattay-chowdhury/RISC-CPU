`timescale 1ns / 1ps

module Register_File(
    Reg_read_ad_1,
    Reg_read_ad_2,
    Reg_write_ad,
    Reg_write_data,
    Clock,
    Reg_read_data_1,
    Reg_read_data_2,
    Reg_Write,
    Reset,
    inr,
    inr_check,
    outvalue
    );
 
 parameter N=16;
 parameter M=3;
 
 input [M-1:0] Reg_read_ad_1;
 input [M-1:0] Reg_read_ad_2;
 input [M-1:0] Reg_write_ad;
 input [N-1:0] Reg_write_data;
 input Reset;
 input inr_check;
 input Reg_Write;
 input Clock;
 input [2:0] inr;
 output reg [N-1:0] Reg_read_data_1;
 output reg [N-1:0] Reg_read_data_2;
 output reg [N-1:0] outvalue=0;

reg [N-1:0] reg_0=7; 
reg [N-1:0] reg_1=3;
reg [N-1:0] reg_2=0;
reg [N-1:0] reg_3=0;
reg [N-1:0] reg_4=0;
reg [N-1:0] reg_5=0;
reg [N-1:0] reg_6=0;
reg [N-1:0] reg_7=0;
 
 always @ (*)
 
 begin
   case(Reg_read_ad_1)
   
        3'b000 : Reg_read_data_1= reg_0;
        3'b001 : Reg_read_data_1= reg_1;
        3'b010 : Reg_read_data_1= reg_2;
        3'b011 : Reg_read_data_1= reg_3;
        3'b100 : Reg_read_data_1= reg_4;
        3'b101 : Reg_read_data_1= reg_5;
        3'b110 : Reg_read_data_1= reg_6;
        3'b111 : Reg_read_data_1= reg_7;
    endcase
       
    case(Reg_read_ad_2)
       
        3'b000 : Reg_read_data_2= reg_0;
        3'b001 : Reg_read_data_2= reg_1;
        3'b010 : Reg_read_data_2= reg_2;
        3'b011 : Reg_read_data_2= reg_3;
        3'b100 : Reg_read_data_2= reg_4;
        3'b101 : Reg_read_data_2= reg_5;
        3'b110 : Reg_read_data_2= reg_6;
        3'b111 : Reg_read_data_2= reg_7;
    endcase   
    
 end
 
 always @ (*)
 if (Reset==1)
	begin
		reg_0=0; 
		reg_1=0;
		reg_2=0;
		reg_3=0;
		reg_4=0;
		reg_5=0;
		reg_6=0;
		reg_7=0;
	end
  
 always @ (posedge Clock)
    if (Reg_Write==1)
    begin
    case(Reg_write_ad)
         3'b000 : reg_0 <= Reg_write_data;
         3'b001 : reg_1 <= Reg_write_data; 
         3'b010 : reg_2 <= Reg_write_data;
         3'b011 : reg_3 <= Reg_write_data;
         3'b100 : reg_4 <= Reg_write_data;
         3'b101 : reg_5 <= Reg_write_data;
         3'b110 : reg_6 <= Reg_write_data;
         3'b111 : reg_7 <= Reg_write_data;
    endcase
    end

always @ (*)
if (inr_check==1)
    begin
    case (inr)
		3'b000: outvalue <= reg_0;
		3'b001: outvalue <= reg_1;
		3'b010: outvalue <= reg_2;
		3'b011: outvalue <= reg_3;
		3'b100: outvalue <= reg_4;
		3'b101: outvalue <= reg_5;
		3'b110: outvalue <= reg_6;
		3'b111: outvalue <= reg_7;
    endcase
    end
endmodule
