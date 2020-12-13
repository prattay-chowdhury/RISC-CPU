`timescale 1ns / 1ps

module test_debounce;

reg sys_clock;
reg    manual_clock;
wire   act_clock;

debouncer db1 (
    .sys_clock(sys_clock),
    .manual_clock(manual_clock),
    .act_clock(act_clock)
);

initial 
begin
#0 sys_clock=0;
end

always
begin 
#5 sys_clock=~sys_clock;
end

initial 
begin 
#0 manual_clock=0;
#10 manual_clock=1;

end

endmodule
