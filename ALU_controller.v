`timescale 1ns / 1ps
module ALU_controller(
    ALU_control_in,
    ALU_control_out
    );
    
parameter M=4;

input [M-1:0] ALU_control_in;
output reg [1:0] ALU_control_out;

always @ (*)
    
    begin
     
    if (ALU_control_in== 1)
		ALU_control_out= 0;
    
    else if (ALU_control_in==8)
		ALU_control_out= 0;

    else if (ALU_control_in==9)
		ALU_control_out= 0;
    
    else if (ALU_control_in==10)
		ALU_control_out= 0;
    
    else if (ALU_control_in==2)
		ALU_control_out= 1;
    
    else if (ALU_control_in==5)
        ALU_control_out= 1;
    
    else if (ALU_control_in==11)
		ALU_control_out= 1;
		
    else if (ALU_control_in==12)
		ALU_control_out= 1;

    else if (ALU_control_in==3)
		ALU_control_out= 2;
    
    else if (ALU_control_in==4)
		ALU_control_out= 3;
    
    end
     
endmodule
