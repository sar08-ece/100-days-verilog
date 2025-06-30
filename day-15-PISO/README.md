PISO USING N-BIT MULTIPLEXER:

A parameterized N:1 multiplexer that selects a single bit from an input vector.

Features:

Selects 1 bit out of WIDTH inputs.

SEL is the number of bits required to address WIDTH inputs (SEL = log₂(WIDTH) manually set).

Fully combinational.

A parameterized Parallel-In Serial-Out (PISO) shift register using the N:1 MUX module.

Features:

Loads a full WIDTH-bit word in parallel

Outputs serial data bit-by-bit using a MUX

LSB-first shifting (default)

Select counter freezes after last bit is output.
On load = 1, the module stores the input word and resets sel.

On every clock edge, it outputs the next bit (data[sel]) through a multiplexer.

After the last bit is sent (sel == WIDTH-1), shifting stops until a new load.

