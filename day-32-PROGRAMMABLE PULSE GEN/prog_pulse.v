module programmable_pulse(input clock,reset,start,
input [7:0]delay,  //programmable delay
input [7:0]width,  //programmable input width
output reg pulse_out);

reg [1:0]state,next_state;

parameter IDLE=2'b00;
parameter WAIT_DELAY=2'b01;
parameter GEN_PULSE=2'b10;

reg [7:0]counter;

//state 
always @(posedge clock or posedge reset)begin
    if(reset)begin
        state<=IDLE;
        counter<=0;
    end
    else begin
        state<=next_state;
        case(next_state)
            IDLE:counter<=0;
            WAIT_DELAY:counter<=counter+1;
            GEN_PULSE:begin
               if(state!=GEN_PULSE)
               counter<=1;
               else
               counter<=counter+1;
           end
    endcase
end
end

//next_state logic
always @(*)begin
    case(state)
        IDLE:begin
            if(start)
            next_state=WAIT_DELAY;
            else
            next_state=IDLE;
        end
        
        WAIT_DELAY:begin
            if(counter==delay)
            next_state=GEN_PULSE;
            else
            next_state=WAIT_DELAY;
        end
        
        GEN_PULSE:begin
            if(counter==width)
            next_state=IDLE;
            else
            next_state=GEN_PULSE;
        end
        
        default:next_state=IDLE;
endcase
end


always @(*)begin
    case(state)
        GEN_PULSE:pulse_out=1;
        default:pulse_out=0;
endcase
end
endmodule



