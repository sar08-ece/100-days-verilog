module ALU_TB;
    reg [7:0]A,B;
    reg [3:0]sel;
    wire [7:0]result;
    
    ALU_1 a1(.A(A),.B(B),.sel(sel),.result(result));
    
    initial
    begin
        $displsy("Time\t Mode\t A\t B\t result\t");
        $monitor("%0t\t %b\t %b\t %b\t %b\t",$time,sel,A,B,result);
        
        sel=4'b0001; A=7'd16; B=7'd15; #100
        sel=4'b0010; A=7'd16; B=7'd15; #100
        sel=4'b0011; A=7'd16; B=7'd15; #100
        sel=4'b0100; A=7'd16; B=7'd15; #100
        sel=4'b0101; A=7'd16; B=7'd15; #100
        sel=4'b0110; A=7'd16; B=7'd15; #100
        sel=4'b0111; A=7'd16; B=7'd15; #100
        sel=4'b1000; A=7'd16; B=7'd15; #100
        sel=4'b1001; A=7'd16; B=7'd15; #100
        sel=4'b1010; A=7'd16; B=7'd15; #100
        sel=4'b1011; A=7'd16; B=7'd15; #100
        sel=4'b1100; A=7'd16; B=7'd15; #100
        sel=4'b1101; A=7'd16; B=7'd15; #100
        sel=4'b1110; A=7'd16; B=7'd15; #100
        sel=4'b1111; A=7'd16; B=7'd15; #100
    $finish;
end
endmodule
