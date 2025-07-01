module led_blink #(parameter T_on=5,parameter T_OFF=4)
(input clock,reset,output reg [1:0] led);

//FSM STATES

parameter ON=2'b00;
parameter OFF=2'b01;

//current_State logic

reg [1:0]state,next_State;
reg [3:0]timer;
always @(posedge clock or posedge reset)begin
    if(reset) state<=OFF;
    else
    state<=next_State;
end

//next_state logic

always @(posedge clock or posedge reset)begin
    if(reset) timer<=0;
    else if(state!=next_State) timer<=0;
    else timer<=timer+1;
end

always @(*)begin
    case(state)
        ON:next_State=(timer==T_on-1)?OFF:ON;
        OFF:next_State=(timer==T_OFF-1)?ON:OFF;
        default:next_State=OFF;
endcase
end

always @(*)begin
    case(state)
        ON:led=2'b00;
        OFF:led=2'b01;
        default:led=2'b01;
endcase
end
endmodule