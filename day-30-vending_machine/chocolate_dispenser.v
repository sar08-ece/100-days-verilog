module chocolate_dispenser(input clock,reset,
input sel,
input [1:0]coin_in, //00:no coin 01:5Rs 10:10Rs 11:12Rs
output reg[1:0]out); //00: no event 01:choc_A 10:choc_B 11:choc_A+2Rs return

reg [2:0]state,next_state;
reg [3:0]total; //0Rs to 12 Rs(max 4 bits)

//FSM STATES
parameter IDLE=3'b000;
parameter COLLECT=3'b001;
parameter CHOC_A=3'b010;
parameter CHOC_B=3'b011;
parameter RETURN_2=3'b100;



wire [3:0]coin_value=(coin_in==2'b01)?5:(coin_in==2'b10)?10:(coin_in==2'b11)?12:0;
//state transitions
always @(posedge clock or posedge reset)begin
    if(reset)begin
        state<=IDLE;
        total<=0;
    end
    else begin
        state<=next_state;
        if(state==COLLECT)
        total<=total+coin_value;
        else if (state==IDLE)
        total<=0;
    end
end

//next_state logic
always @(*)begin
    next_state=state;
    out=2'b00;
    case(state)
        IDLE:begin
            if(coin_value!=0)
            next_state=COLLECT;
        end
        
        COLLECT:begin
            if(total+coin_value==5 &&sel==0)
            next_state=CHOC_A;
            else if(total+coin_value==10 &&sel==1)
            next_state=CHOC_B;
            else if(total+coin_value==12 &&sel==1)
            next_state=RETURN_2;
            else next_state=COLLECT;
        end
        
        CHOC_A:begin
         out=2'b01;
         next_state=IDLE;
         end
        CHOC_B:begin
         out=2'b10;
         next_state=IDLE;
         end
    
        RETURN_2:begin
         out=2'b11;
         next_state=IDLE;
        end
endcase
end
endmodule
    
    
            
            
            
    
    