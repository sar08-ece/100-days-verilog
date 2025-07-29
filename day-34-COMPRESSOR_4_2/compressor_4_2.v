module compressor_4_2(input x1,x2,x3,x4,cin,
output sum,cout,carry);

wire s0;
full_adder f1(.a(x1),.b(x2),.c(x3),.sum(s0),.carry(cout));

full_adder f2(.a(s0),.b(x4),.c(cin),.sum(sum),.carry(carry));

endmodule