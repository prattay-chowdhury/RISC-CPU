`timescale 1ns / 1ps
module MUX_1(
    M1,
    Jump_address,
    MUX_7_out,
    Reg_read_data_1,
    PC_write_data
    );
    
 parameter N=16;
 
 input [N-1:0] Jump_address;
 input [N-1:0] MUX_7_out;
 input [N-1:0] Reg_read_data_1;
 input [1:0] M1;
 output reg [N-1:0] PC_write_data;
 
 always @ (*)
 
 begin
     if (M1==2'b00)
     begin
        PC_write_data = Jump_address;
     end
     
     else if (M1==2'b01)
     begin
        PC_write_data = MUX_7_out;
     end
     
     else
     begin
        PC_write_data = Reg_read_data_1;
     end
 end
 
endmodule
