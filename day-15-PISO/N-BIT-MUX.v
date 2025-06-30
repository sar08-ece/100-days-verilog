module n_bit_mux #(parameter WIDTH=8,
parameter SEL=3)(input [WIDTH-1:0]inputs, //width=log2(sel)
input [SEL-1:0]sel,
output wire y);
assign y=inputs[sel];
endmodule
