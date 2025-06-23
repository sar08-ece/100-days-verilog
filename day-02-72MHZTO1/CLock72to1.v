module clock72(
input clock,reset,enable,
output reg clk1);
reg [25:0]count; //72Mhz-->for 1sec=72million cycles
always @(posedge clock or posedge reset)
begin
    if(reset)
    begin
        count<=0;
        clk1<=0;
    end
    else if(enable) begin
        if(count==26'd35999999)
        begin
            count<=0;
            clk1=~clk1;
        end
        else begin
            count<=count+1;
        end
    end
end
endmodule
