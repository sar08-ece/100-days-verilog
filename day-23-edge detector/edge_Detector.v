//rising edge detector

module positive_detector(input clock,signal,
output pos_detect);

reg signal_d;

always @(posedge clock)begin
    signal_d<=signal;
end
assign pos_detect=~signal_d&signal;
endmodule

//negative edge detector
module neg_detector(input clock,signal,
output neg_detect);

reg signal_d;

always @(posedge clock)begin
    signal_d<=signal;
end
assign neg_detect=signal_d&~signal;
endmodule



module both_detect(input clock,signal,
output both_detect);

reg signal_d;

always @(posedge clock)begin
    signal_d<=signal;
end
assign both_detect=signal_d^signal;
endmodule