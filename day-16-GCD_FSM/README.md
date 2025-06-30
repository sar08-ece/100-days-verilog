GCD CALCULATOR USING EUCLID ALGORITHM


The GCD of two numbers is the largest number that divides both without leaving a remainder.

This project implements a Finite State Machine (FSM)-based GCD calculator in Verilog using the subtraction-based Euclidean algorithm. The design uses a 3-state FSM (IDLE, COMPUTE, DONE) to compute the Greatest Common Divisor of two input numbers without using division or modulo operators.

FSM states:

IDLE – waits for start signal, loads inputs

COMPUTE – repeatedly subtracts the smaller from the larger

DONE – outputs GCD and  done signal

Pure RTL (no behavioral % operator).

On start, inputs are latched into internal registers A and B.

FSM enters COMPUTE state, repeatedly subtracting the smaller value from the larger.

When either A == 0 or B == 0, FSM transitions to DONE.

GCD is the non-zero value of the two, assigned to gcd.

Output done is raised to indicate result is valid.
