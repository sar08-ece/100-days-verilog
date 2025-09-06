module IMG_BG #(parameter W=256,
parameter H=256)(input wire [7:0]pixel_in,
output reg [7:0]bw_out);


always @(*)begin
    if(pixel_in>8'd128)
    bw_out=8'hFF;
    else
    bw_out=8'h00;
end
endmodule
