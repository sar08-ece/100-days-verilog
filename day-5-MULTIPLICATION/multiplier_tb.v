module multiplier_tb();
    reg [3:0]A,B;
    wire [7:0]result;
    
    multiplier_4 m1(.A(A),.B(B),.result(result));
    initial 
    begin
        $display("Time\t A\t B\t Product\t");
        $monitor("%0t\t %b\t %b\t %b\t",$time,A,B,result);
        
        A=4'b0011; B=4'b0101; #100 //3*5
        A=4'b0010; B=4'b1011; #100 //2*11
        A=4'b0011; B=4'b0011; #100 //3*3
        A=4'b0010; B=4'b0010; #100 //2*2
        
        $finish;
    end
endmodule
        