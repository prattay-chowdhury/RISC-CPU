`timescale 1ns / 1ps
module MUX_5(
    M5,
    Sign_ext_2_out,
    Data_out,
    Data_write,
    MUX_5_out
);
    
 parameter N=16;
 
 input [N-1:0] Sign_ext_2_out;
 input [N-1:0] Data_out;
 input [N-1:0] Data_write;
 input [1:0] M5;
 output reg [N-1:0] MUX_5_out;
 
 always @ (*)
 
 begin
     if (M5==2'b00)
     begin
        MUX_5_out = Sign_ext_2_out;
     end
     
     else if (M5==2'b01)
     begin
        MUX_5_out = Data_out;
     end
     
     else
     begin
        MUX_5_out = Data_write;
     end
 end
 
endmodule
