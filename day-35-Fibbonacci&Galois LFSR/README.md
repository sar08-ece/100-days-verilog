LFSR – Linear Feedback Shift Register
An LFSR (Linear Feedback Shift Register) is a shift register whose input bit is a linear function (usually XOR) of its previous state bits.

There are two main types of LFSRs, and they differ in how the feedback is applied:
     *Fibonacci LFSR 
     *Galois LFSR

Fibbonacci LFSR(External feedback):
The feedback bit is calculated outside the shift register (using XOR of tap bits), then fed back into the input.

Galois LFSR(Internal Feedback):
Feedback is applied during shifting, not before.
Only the last flip-flop's output (typically MSB) is XOR’ed with some intermediate bits.

A tap is a specific bit position in the shift register whose value is used in the XOR (feedback) logic.

Only tapped bits influence the feedback (i.e., they participate in XOR).

The LFSR's behavior is defined by a characteristic polynomial, a binary polynomial over GF(2) like:
 x^4+x^3+x+1


 LFSR size: 4 bits
 Tap positions:Bit 

 Bit indices used in feedback: 2 and 0

 