module add_sub_tb();
    reg [3:0]A,B;
    reg mode;
    wire carry;
    wire [3:0]result;
    
    add_sub a1(.A(A),.B(B),.mode(mode),.carry(carry),.result(result));
    
    initial
    begin
        $display("time \t A\t B\t mode\t carry\t result");
        $monitor("%0t\t %b\t %b\t %b\t %b\t %b\t",$time,A,B,mode,carry,result);
        
        A=4'b0101; B=4'b0001; mode=1; #100
        A=4'b0101; B=4'b1001; mode=0; #100
        A=4'b0111; B=4'b0011; mode=0; #100
        A=4'b1101; B=4'b0001; mode=1; #100
        
        $finish;
    end
endmodule
                
