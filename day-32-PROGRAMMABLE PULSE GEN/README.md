Programmable pulse generator:

The module generates a single high pulse (pulse_out) after a user-defined delay and maintains it for a user-defined width (duration), both controlled via 8-bit parameters.

Features:
start Signal:
Acts as the trigger for pulse generation.

Should be set high for at least one clock cycle to begin the process.

Delay Input :
Defines how many clock cycles the system waits after receiving start before starting the pulse.

Width Input (8-bit)
Defines how many clock cycles the output pulse (pulse_out) remains high.

FSM STATES:
IDLE: Counter is reset.Waits for start signal.

WAIT_DELAY: Waits delay is over.

GEN_PULSE: Generates the pulse for input width clock cycles.

