module jhonson_counter(input clock,reset,
output reg [3:0]q);

always @(posedge clock or posedge reset)begin
    if(reset)begin
        q<=4'b0000;
    end
    else begin
        q<={~q[0],q[3:1]};
    end
end
endmodule