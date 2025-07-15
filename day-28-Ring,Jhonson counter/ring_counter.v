module ring_counter(input clock,reset,
output reg [3:0]q);

always @(posedge clock)begin
    if(reset)begin
        q<=4'b1000;
    end
    else
    q<={q[0],q[3:1]};
   end

   endmodule
