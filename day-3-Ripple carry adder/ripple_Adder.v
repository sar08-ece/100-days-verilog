module full_adder(input a,b,cin,output sum,carry);
    assign sum=a^b^cin;
    assign carry=((a*b)|(b*cin)|(cin*a));
endmodule

module ripple_carry(input [3:0]a,b,
input cin,
output [3:0] sum,
output carry);
wire w1,w2,w3;
full_adder f1(a[0],b[0],cin,sum[0],c1);
full_adder f2(a[1],b[1],c1,sum[1],c2);
full_adder f3(a[2],b[2],c2,sum[2],c3);
full_adder f4(a[3],b[3],c3,sum[3],carry);
endmodule
