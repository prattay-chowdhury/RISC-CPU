`timescale 1ns / 1ps

module MUX_2(
    M2,
    rt,
    rd,
    Reg_write_ad
    );
    
 parameter N=3;
 
 input [N-1:0] rt;
 input [N-1:0] rd;
 input [1:0] M2;
 output reg [N-1:0] Reg_write_ad;
 
 always @ (*)
 
 begin
     if (M2==2'b00)
     begin
        Reg_write_ad = 7;
     end
     
     else if (M2==2'b01)
     begin
        Reg_write_ad = rt;
     end
     
     else
     begin
        Reg_write_ad = rd;
     end
 end
 
endmodule
