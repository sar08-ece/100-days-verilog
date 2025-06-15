module ClockDivider(input clock,reset,enable,output clkby2,clkby4,clkby8);
    reg [2:0]count;
    always @(posedge clock or posedge reset)
    begin
        if(reset)
        count<=0;
        else
        count<=count+1;
    end

assign clkby2=count[0];
assign clkby4=count[1];
assign clkby8=count[2];
        
endmodule