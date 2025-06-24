module parity_generate(input [7:0]in,
    input mode,
    output parity_bit);
    
wire parity;

assign parity=in[0]^in[1]^in[2]^in[3]^in[4]^in[5]^in[6]^in[7];

assign parity_bit=(mode==0)?parity:~parity;
endmodule
