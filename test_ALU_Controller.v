`timescale 1ns / 1ps
module test_ALU_Controller;
 
parameter M=4;
reg [M-1:0] ALU_control_in;
wire [1:0] ALU_control_out;
 
 ALU_controller alc1(
     .ALU_control_in(ALU_control_in),
     .ALU_control_out(ALU_control_out)
);

initial 
begin

#0 ALU_control_in=1;
#5 ALU_control_in=8;
#5 ALU_control_in=9;
#5 ALU_control_in=10;
#5 ALU_control_in=2;
#5 ALU_control_in=5;
#5 ALU_control_in=11;
#5 ALU_control_in=12;
#5 ALU_control_in=3;
#5 ALU_control_in=4;
end

endmodule
