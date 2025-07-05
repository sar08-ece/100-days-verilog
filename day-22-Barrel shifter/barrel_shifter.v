module barrel_shifter #(parameter W=8)(input clock,load,
input [W-1:0]bar_in,
input [3:0]shift,
input [1:0]type,
output reg[W-1:0]bar_out);

reg [W-1:0]next_val;

always @(*)begin
    case(type)
        2'b00://shift left
        begin
            next_val=bar_in<<shift;
        end
        2'b01: //shift right
        begin
            next_val=bar_in>>shift;
        end
        2'b10: //rotate left
        begin
            next_val=((bar_in<<shift)|(bar_in>>(W-shift)));  // Rotate left
        
        end
        2'b11: //rotate right 
        begin
          next_val=((bar_in>>shift)|(bar_in<<(W-shift)));  // Rotate right
        end
endcase
end
always @(posedge clock)begin
    if(load)begin
        bar_out<=bar_in;
    end
    else
    bar_out<=next_val;
end
endmodule
    