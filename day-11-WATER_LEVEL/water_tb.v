module water_tb();
    reg s1,s2,s3,s4,s5;
    wire l1,l2,l3,l4,l5;
    
    water_lev w1(.s1(s1),.s2(s2),.s3(s3),.s4(s4),.s5(s5),.l1(l1),.l2(l2),.l3(l3),.l4(l4),.l5(l5));
       
       
initial begin
    $display("Time\t S1\t S2\t S3\t S4\t S5\t L1\t L2\t L3\t L4\t L5\t");
    $monitor("%0t\t %b\t %b\t %b\t %b\t %b\t %b\t %b\t %b\t %b\t %b\t",$time,s1,s2,s3,s4,s5,l1,l2,l3,l4,l5);
    
    //no water
    {s1,s2,s3,s4,s5}=5'b00000; #100
     
     //water at level 1
     {s1,s2,s3,s4,s5}=5'b00001;#100
     
     //water at level 2
     {s1,s2,s3,s4,s5}=5'b00010; #100
     
     //water at level 3
     {s1,s2,s3,s4,s5}=5'b00100; #100
     
     //water at level 4
     {s1,s2,s3,s4,s5}=5'b01000; #100
     
     //full tank
     {s1,s2,s3,s4,s5}=5'b10000; #100
     $finish;
 end
 endmodule