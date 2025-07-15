RING COUNTER:

A Ring Counter is a circular shift register with only one '1' bit circulating through a series of flip-flops. In this implementation, the counter rotates right, moving a logic ‘1’ from MSB to LSB and repeating.

Features:
4-bit synchronous design

Right rotation: 1000 → 0100 → 0010 → 0001 → 1000.


JOHNSON COUNTER:
A Johnson Counter (also called a Möbius counter) is a modified ring counter where the inverted output of the last flip-flop is fed into the first. It creates a unique 2N-state sequence for N flip-flops.

Features:
4-bit design with 8 unique states

Sequence: 0000 → 1000 → 1100 → 1110 → 1111 → 0111 → 0011 → 0001 → 0000

