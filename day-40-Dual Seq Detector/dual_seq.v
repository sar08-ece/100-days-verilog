//verilog code to find the dequence '1101' and '1001'

module dual_seq(input clock,reset,in,
output reg detected_1101,detected_1001);

parameter S0=3'b000;//start
parameter S1=3'b001;  //found 1
parameter S2_a=3'b010; //found 11
parameter S2_b=3'b011; //found 10
parameter S3_a=3'b100; //found 110
parameter S3_b=3'b101; //found 100
parameter S4_a=3'b110;
parameter S4_b=3'b111;  //detected


reg [2:0]state,next_state;

always @(posedge clock or posedge reset)begin
    if(reset)
    state<=S0;
    else
    state<=next_state;
end


always @(*)begin
    case(state)
        S0:next_state=(in==1'b1)?S1:S0;
        
        S1:next_state=(in==1'b1)?S2_a:S2_b;
        
        S2_a:next_state=(in==1'b0)?S3_a:S2_a;
        
        S2_b:next_state=(in==1'b0)?S3_b:S1;
        
        S3_a:next_state=(in==1'b1)?S4_a:S0;
        
        S3_b:next_state=(in==1'b1)?S4_b:S0;
        
        S4_a:next_state=(in==1'b1)?S2_a:S2_b;
        
        S4_b:next_state=(in==1'b1)?S2_a:S2_b;
        
        default:
        next_state=S0;
endcase
end


always @(*)begin
    detected_1101=(state==S4_a);
    detected_1001=(state==S4_b);
end
endmodule
        