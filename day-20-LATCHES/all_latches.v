module sr_latch(input S,R,
output reg q,output q_bar);
    always @(*)begin
        case({S,R})
            2'b00:q=q; //no change
            2'b01:q=1'b0; //reset
            2'b10:q=1'b1; //set
            2'b11:q=1'bx; //illegal
    endcase
end
assign q_bar=~q;
endmodule

module d_latch(input d,en,
output reg q);
always @(*)begin
    case(en)
        1'b1:q=d;
        1'b0:q=q;
endcase
end
endmodule

module jk_latch(input J,K,
output reg q,output q_bar);
always @(*)begin
    case({J,K})
        2'b00:q=q;
        2'b01:q=1'b0;
        2'b10:q=1'b1; //set
        2'b11:q=~q;
endcase
end
assign q_bar=~q;
endmodule


module T_latch(input T,en,
output reg q);
always @(*)begin
    case(en)
        1'b1:q=~T;
        1'b0:q=q;
endcase
end
endmodule