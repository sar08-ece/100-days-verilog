Parametrized Priority Encoder:

It detects the highest-priority active input signal and returns its position index.

N->Input width
W->Width required to indicate the position


Scans input from MSB to LSB.

Outputs the index of the highest-priority (MSB-first) 1 bit.

If no bits are set (in == 0), valid is low, and position is 0.
