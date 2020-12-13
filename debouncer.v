`timescale 1ns / 1ps
module debouncer(
    sys_clock,
    manual_clock,
    act_clock
    );
    
input sys_clock;
input manual_clock;
output reg act_clock;

reg temp;

always @ (posedge sys_clock)

    begin
        temp<=manual_clock;
        act_clock<=temp;
    end

endmodule
