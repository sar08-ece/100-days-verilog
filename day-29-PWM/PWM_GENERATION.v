module PWM(input clock,reset,
input [7:0]duty_cycle,
output reg pwm_out);

reg [7:0]counter;

always @(posedge clock or posedge reset)begin
    if(reset)begin
        counter<=8'd0;
        pwm_out<=0;
    end
    else begin
        counter<=counter+1;
        pwm_out<=(counter<duty_cycle)?1'b1:1'b0;
    end
end
endmodule    
