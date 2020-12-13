`timescale 1ns / 1ps
module Controller(
    Branch,
    Branch_not,
    M11, M12, M21, M22,	M3,	M4,	M51, M52,	M6,	Reg_write,	Data_write,	PC_write, Opcode
    );
input [3:0] Opcode;
output reg Branch;	
output reg Branch_not;
output reg 	M11;	
output reg M12;	
output reg M21;	
output reg M22;	
output reg M3;	
output reg M4;	
output reg M51;	
output reg M52;	
output reg M6;
output reg Reg_write;
output reg Data_write;	
output reg PC_write;

reg [13:0] x;

always @ (*)
    begin
		case (Opcode)
			4'b0000: x = 14'b00000000000000;
			4'b0001: x = 14'b00011010101101;
			4'b0010: x = 14'b00011010101101;
			4'b0011: x = 14'b00011010101101;
			4'b0100: x = 14'b00011010101101;
			4'b0101: x = 14'b00011010001101;
			4'b0110: x = 14'b00010101101101;
			4'b0111: x = 14'b00010101101101;
			4'b1000: x = 14'b00010110101101;
			4'b1001: x = 14'b00010100011101;
			4'b1010: x = 14'b00010000010011;
			4'b1011: x = 14'b01010010000001;
			4'b1100: x = 14'b10010010000001;
			4'b1101: x = 14'b00000000000101;
			4'b1110: x = 14'b00000000000001;
			4'b1111: x = 14'b00100000000001;
    endcase 
    end
    
 always @ (*)
 begin
	Branch=x[13];
	Branch_not=x[12];
	M11= x[11]; 
	M12= x[10];	
	M21= x[9];
	M22= x[8];	
	M3= x[7];	
	M4= x[6];
	M51= x[5];	
	M52= x[4];
	M6= x[3];
	Reg_write=x[2];
	Data_write=x[1];
	PC_write=x[0];
 end
endmodule
