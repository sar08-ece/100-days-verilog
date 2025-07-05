module PISO(input [3:0]par_in,input clock,reset,load,
output reg ser_out);


reg [3:0]data;
always @(posedge clock or posedge reset)begin
    if(reset)begin
        data<=0;
        ser_out<=1'b0;
    end
    else if(load)begin
        data<=par_in;  //loading data
        ser_out<=1'b0;
    end
    else begin
       data<={data[2:0],1'b0};   //shifting by left
       ser_out<=data[3];          //MSB is the output
end
end
endmodule

    
