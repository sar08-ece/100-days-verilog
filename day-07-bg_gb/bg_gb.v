module bg_gb(input [3:0]in,
input mode,
output reg [3:0]out);

always @(*)begin
    if(mode==0)begin
        out[3]=in[3];
        out[2]=in[3]^in[2];
        out[1]=in[2]^in[1];
        out[0]=in[1]^in[0];
    end
    else
    begin
        out[3]=in[3];
        out[2]=out[3]^in[2];
        out[1]=out[2]^in[1];
        out[0]=out[1]^in[0];
    end
end
endmodule