module PIPO(input [3:0]par_in,input clock,reset,load,
output reg[3:0]par_out);

always @(posedge clock or posedge reset)begin
    if(reset)begin
        par_out<=4'b0000;
    end
    else if(load)
    begin
        par_out<=par_in;
    end
end
endmodule

