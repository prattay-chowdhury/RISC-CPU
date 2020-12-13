`timescale 1ns / 1ps
module top_datapath(
            Clock,
            Reset,
            PC_Instruction_memory_adder,
            Instruction,
            Inr,
            Inr_Check,
            outvalue,
            MUX4_Data_ad,
            Reg_MUX3_Data_write,
            Data_MUX5
);

parameter N=16;
input [N-1:0] Data_MUX5;
input Clock;
input Reset;
input [N-1:0] Instruction;  
input Inr_Check;
input [2:0] Inr;
output [N-1:0] outvalue;
output [N-1:0] Reg_MUX3_Data_write;
output [N-1:0] PC_Instruction_memory_adder;
output [N-1:0] MUX4_Data_ad;

(* DONT_TOUCH = "true" *) wire [N-1:0] PC_MUX1;
(* DONT_TOUCH = "true" *) wire PC_Controller;
(* DONT_TOUCH = "true" *) wire [N-1:0] ADD_MUX7_ALU1;

wire [15:0] Ins_MUX1;
wire [5:0] Ins_Sign_ext_1;
wire [3:0] Ins_Controller;
wire [2:0] Ins_Reg_read_ad_1;
wire [2:0] Ins_Reg_read_ad_2_MUX2;
wire [2:0] Ins_MUX2;
wire Ins_Shift_select;
wire [2:0] Ins_Shift_amnt;

wire M11;
wire M12;
wire Branch;
wire Branch_not;
wire M21;
wire M22;
wire M3;
wire M4;
wire M51;
wire M52;
wire M6;
wire Reg_write;
wire Data_write;


wire M7;
wire [N-1:0] Sign_ext_1_ALU1;
wire [N-1:0] ALU1_MUX7;
wire [N-1:0] MUX7_MUX1;

assign Ins_MUX1[11:0]= Instruction[11:0];
assign Ins_MUX1[15:12]=ADD_MUX7_ALU1[15:12];
assign Ins_Sign_ext_1[5:0]= Instruction[5:0];
assign Ins_Controller[3:0]=Instruction[15:12];
assign Ins_Reg_read_ad_1[2:0]= Instruction[11:9];
assign Ins_Reg_read_ad_2_MUX2[2:0]= Instruction[8:6];
assign Ins_MUX2[2:0]=Instruction[5:3];
assign Ins_Shift_select=Instruction[12];
assign Ins_Shift_amnt[2:0]= Instruction[2:0];

(* DONT_TOUCH = "true" *) Program_Counter pc1(
        .PC_in(PC_MUX1),
        .PC_out(PC_Instruction_memory_adder),
        .PC_write_data(PC_Controller),
        .Clock(Clock),
        .Reset(Reset)
);

(* DONT_TOUCH = "true" *) ADD add1(
        .PC_out(PC_Instruction_memory_adder), 
        .PC_plus_one(ADD_MUX7_ALU1)
);

(* DONT_TOUCH = "true" *) Controller contrl1(
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
        .PC_write(PC_Controller), 
        .Opcode(Ins_Controller)
);

Sign_ext_1 sgn1(
        .Sign_ext_1_in(Ins_Sign_ext_1),
        .Sign_ext_1_out(Sign_ext_1_ALU1)
);

wire Zero_flag;

comb_logic cmb1(
        .Branch(Branch),
        .Branch_not(Branch_not),
        .Zero_flag(Zero_flag),
        .M7(M7)
);

ALU_1 al1(
        .PC_plus_one(ADD_MUX7_ALU1),
        .Sign_ext_1_out(Sign_ext_1_ALU1),
        .ALU_1_out(ALU1_MUX7)
);


MUX_7 mx7(
        .MUX_7_out(MUX7_MUX1),
        .M7(M7),
        .ALU_1_out(ALU1_MUX7),
        .PC_plus_one(ADD_MUX7_ALU1)
);

wire [1:0] M1;
assign M1[1]=M11;
assign M1[0]=M12;
wire [N-1:0] Reg1_MUX1_ALU2;

MUX_1 mx1(
        .MUX_7_out(MUX7_MUX1),
        .M1(M1),
        .Jump_address(Ins_MUX1),         
        .Reg_read_data_1(Reg1_MUX1_ALU2),
        .PC_write_data(PC_MUX1)
);

wire [1:0] M2;
assign M2[1]=M21;
assign M2[0]=M22;
wire [2:0] MUX2_Reg;

MUX_2 mx2(
       .M2(M2),
       .rt(Ins_Reg_read_ad_2_MUX2),
       .rd(Ins_MUX2),
       .Reg_write_ad(MUX2_Reg)
);

wire [N-1:0] MUX5_MUX6;
wire [N-1:0] MUX6_Reg;

MUX_6 mx6(
       .M6(M6),
       .PC_plus_one(ADD_MUX7_ALU1),
       .MUX_5_out(MUX5_MUX6),
       .MUX_6_out(MUX6_Reg)
);



Register_File rf1(
           .Reg_read_ad_1(Ins_Reg_read_ad_1),
           .Reg_read_ad_2(Ins_Reg_read_ad_2_MUX2),
           .Reg_write_ad(MUX2_Reg),
           .Reg_write_data(MUX6_Reg),
           .Clock(Clock),
           .Reg_read_data_1(Reg1_MUX1_ALU2),
           .Reg_read_data_2(Reg_MUX3_Data_write),
           .Reg_Write(Reg_write),
           .Reset(Reset),
           .inr(Inr),
           .inr_check(Inr_Check),
           .outvalue(outvalue)
);

wire [N-1:0] MUX3_ALU2;

MUX_3 mx3(
        .M3(M3),
        .Sign_ext_1_out(Sign_ext_1_ALU1),
        .Reg_read_data_2(Reg_MUX3_Data_write),
        .MUX_3_out(MUX3_ALU2)
);

wire [1:0] ALU_control_ALU2;
wire [N-1:0] ALU2_MUX4;

ALU_2 alu2(
       .ALU_in_1(Reg1_MUX1_ALU2),
       .ALU_in_2(MUX3_ALU2),
       .ALU_out(ALU2_MUX4),
       .ALU_control_out(ALU_control_ALU2),
       .Zero_flag(Zero_flag)
);

wire [N-1:0] Shift_MUX4;

Shift shft1(
       .Shift_dir(Ins_Shift_select),
       .Shift_amnt(Ins_Shift_amnt),
       .Reg_read_data_1(Reg1_MUX1_ALU2),
       .Shift_out(Shift_MUX4)
);

ALU_controller alcntrl1(
       .ALU_control_in(Ins_Controller),
       .ALU_control_out(ALU_control_ALU2)
);

MUX_4 mx4(
    .M4(M4),
    .ALU_out(ALU2_MUX4),
    .Shift_out(Shift_MUX4),
    .MUX_4_out(MUX4_Data_ad)
);

wire ALU2_Sign2;
assign ALU2_Sign2=ALU2_MUX4[15];
wire [N-1:0] Sign2_MUX5;

Sign_ext_2 sign2(
    .Sign_ext_2_in(ALU2_Sign2),
    .Sign_ext_2_out(Sign2_MUX5)
);


wire [1:0] M5;
assign M5[1]=M51;
assign M5[0]=M52;

MUX_5 mx5(
        .M5(M5),
        .Sign_ext_2_out(Sign2_MUX5),
        .Data_out(Data_MUX5),
        .Data_write(MUX4_Data_ad),
        .MUX_5_out(MUX5_MUX6)
);

endmodule
