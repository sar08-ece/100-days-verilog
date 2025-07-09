//design of 512 byte 32 bit(4 byte) synchronous RAM

module RAM(input clock,enable,
input [6:0]address,  //we need 7 bit addrees for 512/4=128 which is 2^7
input [31:0]data,
output reg [31:0]dout);

reg [31:0]mem[0:127]; //128 address lines 32 bits each

always @(posedge clock)begin
    if(enable)
    mem[address]<=data; //write
    else
    dout<=mem[address]; //read
end
endmodule
    

