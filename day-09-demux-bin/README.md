DEMUX CODE AND CONVERTING BINARY TO OTHER FORMATS:

I have implemented basic DEMUX operation.

LOGIC USED:
Based on the select lines,we route one of the output to the input.(Basically acting as a decoder)

For converting BINARY to other FORMATS:
We use type specifiers like %b,%d %o to convert to the required type.

NOTE:
One cannot assign a value in a specific format (like decimal, hex, or octal) to a signal — because in hardware, all numbers are just binary.

We use reg type in the output since we are using it to assign in the case statements.