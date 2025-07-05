module SISO #(parameter W=4)(input ser_in,clock,reset,load,
output reg ser_out);

reg [3:0]temp;
always @(posedge clock or posedge reset)begin
    if(reset||load)begin
        ser_out<=1'b0;
    end
    else begin
        temp<={ser_in,temp[W-1:1]}; //inserting input at MSB and shifting by right
 
        ser_out<=temp[3];
    end
end
endmodule
        
