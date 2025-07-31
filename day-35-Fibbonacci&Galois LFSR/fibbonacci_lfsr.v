//4 bit fibbonacci LFSR for x^4+X^3+x+1
//tap positions at x^3 and x(bits 2 and 0)

module fibbonacci_lfsr(input clk,reset,
output reg [3:0]fib_lfsr);

wire feedback;

assign feedback=fib_lfsr[2]^fib_lfsr[0];

always @(posedge clk or posedge reset)begin
    if(reset)
    fib_lfsr<=4'b0001;
    else
    fib_lfsr<={feedback,fib_lfsr[3:1]};
end
endmodule
