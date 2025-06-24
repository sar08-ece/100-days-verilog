module parity_tb;
    reg [7:0]in;
    reg mode;
    wire parity_bit;
    wire parity_error;
    
    parity_generate p1(in,mode,parity_bit);
    parity_checker c1(in,parity_bit,mode,parity_error);
    
    initial begin
        $display("Time\t Data\t Mode\t Bit\t Error\t");
        $monitor("%0t\t %b\t %b\t %b\t %b\t",$time,in,mode,parity_bit,parity_error);
        
        //even parity
        mode=0;
        in=8'b01010101; #100
        in=8'b11111110; #100
        in=8'b00110001; #100
        in=8'b00110101; #100
        
        //odd parity
        mode=1;
        in=8'b01010101; #100
        in=8'b11001100; #100
        $finish;
    end
endmodule