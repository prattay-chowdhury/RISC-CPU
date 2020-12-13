`timescale 1ns / 1ps

module Program_Counter(
    PC_in,
    PC_out,
    PC_write_data,
    Clock,
    Reset
);

parameter N = 16;

input [N-1:0] PC_in;
output reg [N-1:0] PC_out = 16'b0000000000000000;
input PC_write_data;
input Clock;
input Reset;

always @ (posedge Clock)
begin
if (Reset==1)
    PC_out=0;
else
begin
    if (PC_write_data) 
    begin
        PC_out <= PC_in;
    end
    else 
    begin
        PC_out <= PC_out;
    end
end
end
    
endmodule
