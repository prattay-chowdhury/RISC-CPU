`timescale 1ns / 1ps
module test_Controller;

reg [3:0] Opcode;
wire Branch;
wire Branch_not;
wire M11;	
wire M12;
wire M21;	
wire M22;	
wire M3;	
wire M4;	
wire M51;
wire M52;	
wire M6;	
wire Reg_write;
wire Data_write;	
wire PC_write;

Controller cnltrl1(
.Opcode(Opcode),
.Branch(Branch),
.Branch_not(Branch_not),
.M11(M11),
.M12(M12),	
.M21(M21),	
.M22(M22),	
.M3(M3),	
.M4(M4),	
.M51(M51),	
.M52(M52),	
.M6(M6),	
.Reg_write(Reg_write),	
.Data_write(Data_write),	
.PC_write(PC_write)
);

initial
begin 
#0 Opcode=0;
#5 Opcode=1;
end
endmodule
