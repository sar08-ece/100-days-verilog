LOGIC USED:
For binary to gray:

MSB remains the same for both binary and gray.
For remaining bits:

For binary to gray:
     gray[i]=binary[i+1]^binary[i]
      

For gray to binary:

Binary[i]=Binary[i+1]^gray[i]
