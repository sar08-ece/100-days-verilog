module ClockDivider_tb;
    reg clock,reset,enable;
    wire clkby2,clkby4,clkby8;
    ClockDivider u1(.clock(clock),.reset(reset),.enable(enable),.clkby2(clkby2),.clkby4(clkby4),.clkby8(clkby8));
    
    initial begin
        clock=0;
        forever #5 clock=~clock;
    end
     initial begin
        reset=1;
        enable=0;
        
        #15 reset=0;
        enable=1;
        #200 $stop;
    end
endmodule
    