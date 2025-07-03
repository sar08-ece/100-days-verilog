A parameterized finite state machine (FSM) that detects a 4-bit binary sequence from a serial input stream. Designed in Verilog HDL using non-blocking assignments and supports sequence overlapping.

🛠️ Features
✅ Parameterized 4-bit target sequence

✅ Overlapping sequence detection

✅ Moore machine implementation

✅ Synthesizable and simulation-ready

✅ Uses clean FSM structure with state parameters.

 Line 1
  
 
S0: next_state = (in == TARGET_SEQ[3]) ? S1 : S0;
S0 = Idle state. Waiting for the first bit.

If input bit matches the first bit of the target sequence, move to S1.

Otherwise, stay in S0.

Example: For TARGET_SEQ = 4'b1101, if in == 1, go to S1.

Line 2
  
 
S1: next_state = (in == TARGET_SEQ[2]) ? S2 : ((in == TARGET_SEQ[3]) ? S1 : S0);
You matched the first bit and are now in S1.

Now you're checking if the second bit matches.

If it matches → go to S2.

If not, check if in is again the first bit of the sequence:

This allows overlapping, e.g., input like 1 1 0 1 1 0 1

If it looks like a new start, go back to S1.

Else, go back to S0.

Example: 1101101 — after detecting first 1101, the next 1 should be reinterpreted as start of another match.

Line 3
  
 
S2: next_state = (in == TARGET_SEQ[1]) ? S3 : ((in == TARGET_SEQ[3]) ? S1 : S0);
You matched 2 bits.

Now check if the third bit matches.

If yes → go to S3.

If not:

If in == TARGET_SEQ[3] (first bit of pattern), restart as S1 (overlap)

Else → reset to S0

Line 4
  
 
S3: next_state = (in == TARGET_SEQ[0]) ? S4 : ((in == TARGET_SEQ[3]) ? S1 : S0);
You've matched 3 bits so far.

If the last bit matches, go to S4 (detection done ✅)

If not:

Check for possible overlap start again (if in == first bit)

Else reset

 Line 5
  
 
S4: next_state = (in == TARGET_SEQ[2]) ? S2 : ((in ==TARGET_SEQ[3]) ? S1 : S0);
You're in the detection state, having seen a full match.

Now check if current in may start the next match (overlap).

If in == second bit, go to S2

If in == first bit, go to S1

Else reset

 This handles overlapping patterns like 1101101 (where a new match starts during or just after an old match).

If in = 1 0 1 1 0 1 1
The detected output will go high twice, indicating two matches with overlap.