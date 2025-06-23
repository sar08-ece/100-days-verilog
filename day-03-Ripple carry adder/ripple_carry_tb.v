module ripple_Carry_tb();
    reg [3:0] a,b;
    reg cin;
    wire [3:0] sum;
    wire carry;
    ripple_carry r1(.a(a),.b(b),.cin(cin),.sum(sum),.carry(carry));
    
    initial
    begin
        $display("Time\t A\t B\t Cin\t Sum\t Carry");
        $monitor("%0t\t%b\t%b\t%b\t%b\t%b\t",$time,a,b,cin,sum,carry);
        a=4'b0101 ;b=4'b0010; cin=0; #100
        a=4'b0100 ;b=4'b1001; cin=1; #100
        a=4'b0101 ;b=4'b0011; cin=1; #100
        a=4'b0111 ;b=4'b0110; cin=0; #100
        $finish;
    end
endmodule
        
        
    
