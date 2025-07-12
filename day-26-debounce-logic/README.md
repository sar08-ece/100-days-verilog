Debounce logic:
 
 Verilog module that cleans up noisy mechanical signals (like buttons and switches) and gives you a single, clean digital output.
It works by:

Synchronizing the signal to your system clock (so your design doesn’t freak out)

Waiting for the signal to stay stable long enough before considering it valid

Working:
Stability Counter
Checks how long the signal stays the same. Only if it stays steady for a while (like 20ms), we update the output. This filters out all the “bouncy” transitions.

Metastable outputs:

May glitch or oscillate briefly

Could be read incorrectly by other logic

Cause unpredictable behavior, especially in counters, FSMs, and resets.

Solution to the above said problem is double flip flop synchroniser.
What happens:
sync_0 captures the possibly glitchy/marginal value.

If sync_0 goes metastable, sync_1 gets a stable value on the next clock cycle (most of the time).

The output (sync_1) is now safe to use in your clock domain.


