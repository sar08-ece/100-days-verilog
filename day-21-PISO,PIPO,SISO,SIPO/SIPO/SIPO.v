//Serial in Parallel out
module SIPO #(parameter W=8)(input ser_in,clock,reset,load,
output reg[W-1:0]par_out); 
   
    
    always @(posedge clock or posedge reset)begin
        if(reset||load)begin
            par_out<=0;
        end
        else begin
            par_out<=({ser_in,par_out[W-1:1]}); //inserting the new bit to MSB and shift right
        end
    end
endmodule

