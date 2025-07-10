module clock_12_hr(input clock,
input reset,enable,
output reg am,
output reg [7:0]hr,mins,secs);


//timers
parameter SEC_T=60;
parameter MIN_T=60;
parameter HOUR_T=12;
//FSM STATES

parameter IDLE=3'b000;
parameter INC_SEC=3'b001;
parameter INC_MIN=3'b010;
parameter INC_HOUR=3'b011;
parameter DONE=3'b100;

reg [2:0]next_state,state;

//current-state logic
always @(posedge clock or posedge reset)begin
    if(reset)begin
        state<=IDLE;
    end
    else
    state<=next_state;
end


//next_logic state


always @(*)begin
    case(state)
        IDLE:next_state=enable?INC_SEC:IDLE;
        INC_SEC:next_state=(secs==SEC_T-1)?INC_MIN:DONE;
        INC_MIN:next_state=(mins==MIN_T-1)?INC_HOUR:DONE;
        INC_HOUR:next_state=DONE;
        DONE:next_state=IDLE;
        default:next_state=IDLE;
endcase
end

//counter logic
always @(posedge clock or posedge reset)begin
    if(reset)begin
        secs<=8'h00;
        mins<=8'h00;
        hr<=8'h0C;
        am<=1'b1; //AM
    end
    else begin
        case(state)
            INC_SEC:begin
                if(secs==SEC_T-1)
                secs<=8'h00;
                else
                secs<=secs+1;
            end
            INC_MIN:begin
                if(mins==MIN_T-1)
                mins<=8'h00;
                else
                mins<=mins+1;
            end
            INC_HOUR:begin
            if(hr==HOUR_T-1)
                begin
                    hr<=HOUR_T;
                    am<=~am;
                end
                else if(hr==HOUR_T)begin
                    hr<=8'h01;
                end
                else begin
                    hr<=hr+1;
                end
            end
    endcase
end
end
endmodule
