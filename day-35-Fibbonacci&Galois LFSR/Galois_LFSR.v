module galois_LFSR(input clock,reset,
output reg [3:0]gal_lfsr);

wire feedback;
assign feedback=gal_lfsr[3];
always @(posedge clock or posedge reset)begin
    if(reset)
    gal_lfsr<=4'b0001;
    else begin
        gal_lfsr[3]<=gal_lfsr[2];
        gal_lfsr[2]<=gal_lfsr[1]^feedback;
        gal_lfsr[1]<=gal_lfsr[0];
        gal_lfsr[0]<=feedback^gal_lfsr[0];
    end
end
endmodule
        
        