 FSM-Based LED Blinker (Timer-Based FSM)
This Verilog project implements a simple FSM-controlled LED blinker. The LED stays ON for a fixed number of clock cycles and then OFF for another set of cycles, repeatedly.

Description
Type: Moore FSM

States: ON, OFF

Transitions: Based on a timer counter

Clock-driven: Works on a posedge clk

Reset: Active-high reset sets the state to OFF.

Name	  Default	          Purpose
ON_TIME	    5	    LED ON duration (in clock cycles)
OFF_TIME	4	    LED OFF duration (in clock cycles)

FSM starts in OFF state.

A timer register counts how many cycles the FSM has stayed in the current state.

When the timer reaches its limit (based on ON_TIME or OFF_TIME), FSM transitions to the next state and resets the timer.