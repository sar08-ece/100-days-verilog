Code to find the number of ones and zeroes in a binary number.

LOGIC USED:
Iterate through the number of bits and increment the count values of zeroes and ones accordingly.

Other logic:
Suppose we have 8 bit number.

in=8'b11001100.

assign ones=in[0]+in[1]+in[2]+in[3]+....in[8];

assign zeroes=no.of bits-ones;(Here N=8)
