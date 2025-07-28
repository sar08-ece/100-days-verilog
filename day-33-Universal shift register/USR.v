//universal shift register using behavioural modelling

module USR(input clock,reset,load,enable,
input [1:0]sel,
input [3:0]data_in,
input serial_left,serial_right,
output reg[3:0]q);

always @(posedge clock or posedge reset)begin
    if(reset)
        q<={3{1'b0}};
    else if(enable)begin
        case(sel)
            2'b00:q<=q;  //hold
            2'b01:q<={serial_left,q[3:1]}; //shift left
            2'b10:q<={q[2:0],serial_right};//shift right
            2'b11:q<=data_in;              //load
            default:q<=q;
    endcase
end
end
endmodule
        

