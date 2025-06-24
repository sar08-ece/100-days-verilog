module parity_checker(input [7:0]in,input parity,
input mode,
output parity_error);


wire temp_parity;
assign temp_parity=in[0]^in[1]^in[2]^in[3]^in[4]^in[5]^in[6]^in[7]^parity;

assign parity_error=(mode==0)?temp_parity:~parity;
endmodule 