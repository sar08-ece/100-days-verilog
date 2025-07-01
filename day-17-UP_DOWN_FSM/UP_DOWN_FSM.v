module up_down #(parameter W=8)(input clock,reset,up,down,
output reg [W-1:0]count);

//FSM States
parameter IDLE=2'b00;
parameter UP=2'b01;
parameter DOWN=2'b10;


reg [1:0]state,next_state;

//Current state logic
always @(posedge clock or posedge reset)begin
       
       if(reset) 
       state<=IDLE;
       else
       state<=next_state;
   end
   
//next state logic

always @(*)begin
    case(state)
        IDLE:
        begin
            if(up) next_state=UP;
            else if(down) next_state=DOWN;
            else
            next_state=IDLE;
        end
        
        UP:
        next_state=up?UP:IDLE;
        
        DOWN:
        next_state=down?DOWN:IDLE;
        
        default:
        next_state=IDLE;
endcase
end

//datapath(counter logic)

always @(posedge clock or posedge reset)
begin
    if (reset)
    count<=0;
    else begin
        case(state)
            UP:count<=count+1;
            DOWN:count<=count-1;
    endcase
end
end
endmodule
    
