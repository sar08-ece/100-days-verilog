module demux(input i1,input [1:0]sel,output reg[3:0]Y);//we use always @(*) since we are using case conditions.
    //inside always @ and initial blocks `we should use reg.
    //for combinational logic use assign which does not store values.
    always @(*)begin
        Y=4'b0000;
    case(sel)
        2'b00:Y[0]=i1;
        2'b01:Y[1]=i1;
        2'b10:Y[2]=i1;
        2'b11:Y[3]=i1;
endcase
end
endmodule

        