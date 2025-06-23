//input is binary and based on the select lines output will be hex,dec,oct
module bin_demux(input [7:0]bin,input [1:0]sel);
    
    always @(*)begin
        
        case(sel)
            2'b00: $display("Hex:%h",bin);
            2'b01 : $display("Octal:%o",bin);
            2'b10 : $display("Decimal:%d",bin);
            2'b11 : $display("Binary:%b",bin);
endcase
end 
endmodule
