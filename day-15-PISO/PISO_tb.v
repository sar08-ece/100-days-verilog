module PSIO_tb();
    parameter WIDTH=8;
    parameter SEL=3;
    
    reg clock,reset,load;
    reg [WIDTH-1:0]in;
    wire ser_out;
    
    
    PISO #(WIDTH,SEL) p1(.clock(clock),.reset(reset),.load(load),.in(in),.ser_out(ser_out));
    initial begin
        clock=0;
        forever #5 clock=~clock;   
    end
    initial begin
        $monitor("Time=%0t\t Serial out=%b\t",$time,ser_out);
    end
    
    initial begin
        reset=1;load=0;
        #10 reset=0;
        
        #10 in=8'b11111100; load=1;
        #10 load=0;
        
        #100 $finish;
    end
endmodule
    
    
