module priority_encoder #(parameter N=8,parameter W=3)(input [N-1:0]in,
output reg[W-1:0]position,
output reg valid);

integer i;

always @(*)begin
    valid=0;
    position=0;
    for(i=N-1;i>=0;i=i-1)begin
        if(in[i])begin
            position=i[W-1:0];
            valid=1;
            i=-1;
        end
    end
end
endmodule