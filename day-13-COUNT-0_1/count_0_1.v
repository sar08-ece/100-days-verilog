//code to find the number of ones and zeroes in a binary number

module count_0_1(input [7:0]bin,output reg [3:0]ones,zeroes);
    
    integer i;
    always @(*)begin
    ones=0;
    zeroes=0;
    for(i=0;i<8;i=i+1)begin
        if(bin[i])begin
            ones=ones+1;
        end
        else begin
            zeroes=zeroes+1;
        end
    end
    $display("Binary=%b,ones=%d,Zeroes=%d",bin,ones,zeroes);
    end
endmodule
