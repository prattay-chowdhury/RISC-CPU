`timescale 1ns / 1ps

module Shift(
    Shift_dir,
    Shift_amnt,
    Reg_read_data_1,
    Shift_out
    );
parameter N=16;
input Shift_dir;
input [2:0] Shift_amnt;
input [N-1:0] Reg_read_data_1;
output reg [N-1:0] Shift_out;

always @ (*)

	begin
		if (Shift_dir==0)
			Shift_out= Reg_read_data_1>> Shift_amnt;
		else 
			Shift_out= Reg_read_data_1<<Shift_amnt;
		end '

endmodule
