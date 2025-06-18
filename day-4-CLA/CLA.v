
//carry-look ahead adder
//PROPOGATE(P)=A^B
//GENERATE(G)=A.B
//C1=G0+P0.C0
//C2=G1+P1.(G0+P0.C0)
//C3=G2+P2.(G1+P1.(G0+P0.C0)
//SUM=P^C   
module CLA(input [3:0]A,B,
input Cin,
output [3:0]sum,
output cout);
 
 wire [3:0]G,P;
 wire [3:0]carry;
 
 assign P=A^B;
 assign G=A&B;
 
 assign carry[0]=Cin;

 assign carry[1]=G[0]|(P[0]&carry[0]);
 assign carry[2]=G[1]|(P[1]&G[0]|P[1]&P[0]&carry[0]);  
 assign carry[3]=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&carry[0]);
 
 assign cout=carry[3];
 assign sum[0]=P[0]^Cin;
 assign sum[1]=P[1]^carry[1];
 assign sum[2]=P[2]^carry[2];
 assign sum[3]=P[3]^carry[3];
 
 endmodule
 