`timescale 1ns / 1ps

module final_pc(
            sys_clock,
            manual_clock,
            Reset,
            Inr,
            Inr_Check,
            outvalue,
            select_clock
            );

parameter N=16;
(* DONT_TOUCH = "true" *) input sys_clock;
(* DONT_TOUCH = "true" *) input manual_clock;
(* DONT_TOUCH = "true" *) input Reset;
(* DONT_TOUCH = "true" *) input Inr_Check;
(* DONT_TOUCH = "true" *) input [2:0] Inr;
(* DONT_TOUCH = "true" *) output [N-1:0] outvalue;
(* DONT_TOUCH = "true" *) wire act_clock;
(* DONT_TOUCH = "true" *) wire [N-1:0] PC_insmem;
(* DONT_TOUCH = "true" *) wire [N-1:0] Instruction;
(* DONT_TOUCH = "true" *) wire [N-1:0] MUX4_Data_ad;
(* DONT_TOUCH = "true" *) wire [N-1:0] Reg_MUX3_Data_write;
(* DONT_TOUCH = "true" *) wire Data_write;
(* DONT_TOUCH = "true" *) wire [N-1:0] Data_MUX5;
(* DONT_TOUCH = "true" *) input select_clock;
(* DONT_TOUCH = "true" *) wire clock;

(* DONT_TOUCH = "true" *) top_datapath tpdp(
            .Clock(clock),
            .Reset (Reset),
            .PC_Instruction_memory_adder(PC_insmem),
            .Instruction(Instruction),
            .Inr(Inr),
            .Inr_Check(Inr_Check),
            .outvalue(outvalue),
            .MUX4_Data_ad(MUX4_Data_ad),
            .Reg_MUX3_Data_write(Reg_MUX3_Data_write),
            .Data_MUX5(Data_MUX5),
            .Data_write(Data_write)
);

assign clock = select_clock ? sys_clock : act_clock;

(* DONT_TOUCH = "true" *) Instruction_Memory ins1(
              .PC(PC_insmem),
              .Instruction(Instruction)
  ); 
 
(* DONT_TOUCH = "true" *) Data_Memory dtm1(
      .Data_ad(MUX4_Data_ad),
      .Reg_read_data_2(Reg_MUX3_Data_write),
      .Data_out(Data_MUX5),
      .Clock(clock),
      .Data_Write(Data_write)
);
      
(* DONT_TOUCH = "true" *) debouncer dbn(
      .sys_clock(sys_clock),
      .manual_clock(manual_clock),
      .act_clock(act_clock)
);     
       
endmodule
