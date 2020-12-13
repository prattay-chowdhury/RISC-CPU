`timescale 1ns / 1ps
module test_comb_logic;

reg Branch;
reg Zero_flag;
reg Branch_not;
wire M7;

comb_logic cmb (
    .Branch (Branch),
    .Zero_flag (Zero_flag),
    .Branch_not (Branch_not),
    .M7 (M7)
);

initial 

begin

#0 Branch=0;
#0 Zero_flag=0;
#0 Branch_not=0;
#5 Branch=1;
#5 Zero_flag=1;
#5 Branch=0;
#0 Branch_not=1;
#5 Zero_flag=0;
#5 Zero_flag=1;
#0 Branch=0;
#0 Branch_not=0;

end

endmodule
