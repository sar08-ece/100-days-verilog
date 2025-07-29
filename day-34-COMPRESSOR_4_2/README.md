A 4:2 compressor is a combinational logic component that compresses 5 inputs (x1, x2, x3, x4, cin) into 3 outputs (sum, carry, cout). It is heavily used in multipliers and partial product reduction stages to reduce delay and area.


Input	Value
x1	      1
x2	      1
x3	      0
x4	      1
cin	      1

First Full Adder (x1 + x2 + x3)
Inputs: 1 + 1 + 0 = 2

s0 = 0 (sum)

c0 = 1 (carry) → This becomes cout

Second Full Adder (s0 + x4 + cin)
Inputs: 0 + 1 + 1 = 2

sum = 0

carry = 1 → This becomes carry.

The binary input 11011 (which is 5 inputs to a 4:2 compressor) results in:

2-bit equivalent output: carry + sum = 10

With a carry-out (cout = 1) to higher column

