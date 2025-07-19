module vending_machine(input clock,reset,  //clock and reset
input [1:0]coin_in,          //00:no coin,01:5Rs,10:10Rs,11:15Rs
input sel,                  //selecting the product 0:A and 1:B
output reg [1:0]out);       //00:no return 01:A 10:B 11:A+5Rs return

reg [4:0]total; //max price of product is 15 so we choose 5 bits 

parameter IDLE=3'b000;
parameter COLLECT=3'b001; //collecting coins
parameter VEND_A=3'b010; 
parameter VEND_B=3'b011;
parameter RETURN=3'b100;

reg [2:0]state,next_state;

wire [4:0]coin_value=(coin_in==2'b01)?5:(coin_in==2'b10)?10:(coin_in==2'b11)?15:0;
//state-transitions   
always @(posedge clock or posedge reset) begin
    if(reset)begin
        
       state<=IDLE;
       total<=0;
   end
   
else begin
    state<=next_state;
    if(state==COLLECT)begin
        total<=total+coin_value;
    end
    else if(state==IDLE)begin
        total<=0;
    end
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
            if(total+coin_value==10 &&sel==0)
            next_state=VEND_A;
            else if(total+coin_value==15 &&sel==1)
            next_state=VEND_B;
            else if(total+coin_value==15 &&sel==0)
            next_state=RETURN;
            else if(total+coin_value>15)
            next_state=IDLE;
            else
            next_state=COLLECT;
        end
        
        VEND_A:begin
            out=2'b01;
            next_state=IDLE;
        end        
        
        VEND_B:begin
            out=2'b10;
            next_state=IDLE;
        end
        
        RETURN:begin
            out=2'b11;
            next_state=IDLE;
        end
    
endcase
end
endmodule
    


    
