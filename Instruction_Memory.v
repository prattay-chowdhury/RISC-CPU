`timescale 1ns / 1ps
module Instruction_Memory(
    PC,
    Instruction,
    );

parameter N=16;
parameter eff=10; 

integer i;

input [N-1:0] PC;
output reg [N-1:0] Instruction;
wire [eff-1:0] PC_w;
reg [N-1:0] ins_mem [511:0];

assign PC_w = PC[eff-1:0];

initial 
	begin 
		$readmemh ("C:/Users/HP/AppData/Roaming/Xilinx/Vivado/ins_mem.list",ins_mem);
	end

always @ (*)

	begin 
		Instruction = ins_mem [PC_w];
	end

endmodule
