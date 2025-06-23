//for addition mode=0 --->sum=A+B
//for subtraction mode=1--->sum=A+~B+1
module add_sub(input [3:0]A,B,
input mode,
output [3:0]result,
output carry);

wire Cin;
wire [4:0]sum;
wire [3:0]B_x;

assign Cin=mode;
assign B_x=B^{4{mode}};
assign sum=A+B_x+Cin;

assign result=sum[3:0];
assign carry=sum[4];

endmodule
