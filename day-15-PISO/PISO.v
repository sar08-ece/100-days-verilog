module PISO #(parameter WIDTH=8,parameter SEL=3)(input clock,reset,load,
input [WIDTH-1:0]in,output ser_out);

reg [WIDTH-1:0] data;
reg [SEL-1:0] sel;
wire bit_out;



n_bit_mux #(.WIDTH(WIDTH),.SEL(SEL)) m1(.inputs(data),.sel(sel),.y(bit_out));


assign ser_out=bit_out;

always @(posedge clock or posedge reset)begin
    if (reset)begin        //if reset,making the select bit to zero.
        sel<=0; 
    end
    else if(load)begin
        data<=in;
        sel<=0;
    end
    else begin
        if(sel<WIDTH-1)begin
            sel<=sel+1;
        end
    end
end
endmodule
