VENDING MACHINE FSM:

   A Finite State Machine (FSM) modeled in Verilog to implement a vending machine that sells two products with change return logic based on inserted coins and product selection.
Accepts coins of:

00 → No coin

01 → ₹5

10 → ₹10

11 → ₹15

Product Pricing:

Product A → ₹10

Product B → ₹15

Selection:

sel = 0 → Product A.

sel = 1 → Product B.

Change Return Logic:

If ₹15 inserted and Product A is selected, dispense A and return ₹5.

Rejects overpayment (> ₹15)

Can reset the machine at any time.

Similar cases for chocolate dispenser.

CHOC_A-> CHOCOLATE A
CHOC_B-> CHOCOLATE B


Price of Chocolate A and B are 5 and 10 respectively.
If 12Rs coin is inserted,2Rs will be returned.
