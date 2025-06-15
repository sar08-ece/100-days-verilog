module clock72_tb();
    reg clock,reset,enable;
    wire clk1;
    
    clock72 u1(.clock(clock),.reset(reset),.enable(enable),.clk1(clk1));
    
    initial
    begin
        clock=0;
        forever #5 clock=~clock;
    end
    
    initial
    begin
        reset=1;
        enable=0;
        
        #100 reset=0;
        enable=1;
        
        #10000000;
        $finish;
    end
endmodule
