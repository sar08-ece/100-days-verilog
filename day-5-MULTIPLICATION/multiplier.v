module multiplier_4(input [3:0]A,B,
output [7:0]result);

reg [7:0] product;
integer i;
always @(*) begin
    product=8'd0;
    for (i=0;i<4;i=i+1)
    begin
        if(B[i])
        product=product+(A<<i);
    end
end
assign result=product;
endmodule