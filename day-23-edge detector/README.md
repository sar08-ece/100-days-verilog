EDGE DETECTOR

Each detector outputs a single-cycle pulse when a specific edge (rising, falling, or both) occurs on the input signal.

These modules are useful in FSM triggers, event counters, debouncing, or any logic where edge detection is needed in a clocked design.

Posedge detector:
Detects when sig goes from 0 to 1 (rising edge) on a clock edge.

always @(posedge clock) begin
        signal_d <= signal;
    end

    assign pos_detect = ~signal_d & signal; // Detect 0 → 1
How it works:

signal_d stores the previous value of signal.

When current signal = 1 and signal_d = 0, the output pos_detect = 1.

Generates a 1-cycle pulse on every rising edge.

Similarly for negative edge detector also.

For both rising and falling edge detector,we use exor operation since when any one is high,output is high.