//FSM BASED GCD CALCULATOR
module GCD_FSM #(parameter W=8)(input clock,reset,start, 
input [W-1:0]A_in,B_in,
output reg [W-1:0]gcd,
output reg done);

//FSM STATES
parameter IDLE=2'b00;
parameter COMPUTE=2'b01;
parameter DONE=2'b10;

reg [W-1:0]A,B;
reg [1:0]state,next_state;
//sequential
always @(posedge clock or posedge reset)begin
    if(reset) state<=IDLE;
    else state<=next_state;
end
//NEXT-STATE
//combinational
always @(*)begin
    next_state=state;
    case(state)
        IDLE:if(start)           next_state=COMPUTE;
        COMPUTE: if(A==0||B==0)  next_state=DONE;
        DONE: if(!start)         next_state=IDLE;
        endcase
end
//data-path

always @(posedge clock or posedge reset)begin
    if(reset)begin
        A<=0;
        B<=0;
        gcd<=0;
        done<=0;
    end
    else begin
        case(state)
            IDLE:
            
            if(start)begin
                A<=A_in;
                B<=B_in;
            end
            
            COMPUTE:
            if(A!=0 && B!=0)begin
                if (A>=B) A<=A-B;
                else  B<=B-A;
            end
            
            DONE:begin
                gcd<=(A==0)?B:A;
                done<=1;
            end
    endcase
end
end
endmodule
                