module dual_port_RAM #(parameter ADD=7,parameter DATA=32)
(input clock,
//for port A
input rw_A,
input [ADD-1:0]addr_A,
input [DATA-1:0]data_A,
output reg [DATA-1:0]out_A,

//for port B
input rw_B,
input [ADD-1:0]addr_B,
input [DATA-1:0]data_B,
output reg [DATA-1:0]out_B);

//512 byte 32 bit memory 

reg[DATA-1:0]mem[0:(1<<ADD)-1];

//port A

always @(posedge clock)begin
     if(rw_A)begin
         mem[addr_A]<=data_A; //write
     end
     else begin
         out_A<=mem[addr_A];   //read
     end
     
 end
 
 //port B
 
 always @(posedge clock)begin
     if(rw_B)begin
         mem[addr_B]<=data_B; //write
     end
     else
     out_B<=mem[addr_B];     //read
 end 
 endmodule

