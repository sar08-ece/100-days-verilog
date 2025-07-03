module seq_detect#(
    parameter [3:0] TARGET_SEQ = 4'b1101
)(
    input clk,
    input reset,
    input in,
    output reg detected
);

    // FSM state encoding (5 states for 4-bit sequence)
    parameter S0 = 3'b000;  // Initial state
    parameter S1 = 3'b001;  // Saw 1st bit (TARGET_SEQ[3])
    parameter S2 = 3'b010;  // Saw 2 bits (TARGET_SEQ[3:2])
    parameter S3 = 3'b011;  // Saw 3 bits (TARGET_SEQ[3:1])
    parameter S4 = 3'b100;  // Full match (TARGET_SEQ[3:0]) ?

    reg [2:0] state, next_state;

    // State transition logic
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= S0;
        else
            state <= next_state;
    end

    // Next-state logic
    always @(*) begin
        case (state)
            S0: next_state = (in == TARGET_SEQ[3]) ? S1 : S0;
            S1: next_state = (in == TARGET_SEQ[2]) ? S2 : ((in == TARGET_SEQ[3]) ? S1 : S0);
            S2: next_state = (in == TARGET_SEQ[1]) ? S3 : ((in == TARGET_SEQ[3]) ? S1 : S0);
            S3: next_state = (in == TARGET_SEQ[0]) ? S4 : ((in == TARGET_SEQ[3]) ? S1 : S0);
            S4: next_state = (in == TARGET_SEQ[2]) ? S2 : ((in == TARGET_SEQ[3]) ? S1 : S0); // for overlap
            default: next_state = S0;
        endcase
    end

    // Output logic (Moore)
    always @(*) begin
        detected = (state == S4);
    end

endmodule
      


