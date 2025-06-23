module CLA_tb();
    reg [3:0]A,B;
    reg Cin;
    wire [3:0]sum;
    wire cout;
    
    CLA c1(.A(A),.B(B),.Cin(Cin),.sum(sum),.cout(cout));
    initial
     begin
        
    $display("Time\t A\t B\t Cin\t Sum\t Cout\t");
    $monitor("%0t\t %b\t %b\t %b\t %b\t %b\t",$time,A,B,Cin,sum,cout);
    
    A=4'b1100; B=4'b1010; Cin=0; #10
    A=4'b1110; B=4'b1011; Cin=1; #10
    A=4'b1010; B=4'b1000; Cin=1; #10
    A=4'b0010; B=4'b1000; Cin=0; #10
    A=4'b1001; B=4'b0010; Cin=0; #10
    $finish;
end
endmodule