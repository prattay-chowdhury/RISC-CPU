`timescale 1ns / 1ps
module comb_logic(
    Branch,
    Zero_flag,
    Branch_not,
    M7
);

input Branch;
input Zero_flag;
input Branch_not;
output M7;



assign M7=(Branch*Zero_flag)+(Branch_not*(~Zero_flag));


endmodule
