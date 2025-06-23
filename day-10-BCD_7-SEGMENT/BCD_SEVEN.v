module BCD_SEVEN(input [3:0]BCD,output reg a,b,c,d,e,f,g);
    
    always @(*)begin
        case (BCD)
            4'd0:{a,b,c,d,e,f,g}=7'b1111110; //0
            4'd1:{a,b,c,d,e,f,g}=7'b0110000; //1
            4'd2:{a,b,c,d,e,f,g}=7'b1101101; //2
            4'd3:{a,b,c,d,e,f,g}=7'b1111001; //3
            4'd4:{a,b,c,d,e,f,g}=7'b0110011; //4
            4'd5:{a,b,c,d,e,f,g}=7'b1011101; //5
            4'd6:{a,b,c,d,e,f,g}=7'b1011111; //6
            4'd7:{a,b,c,d,e,f,g}=7'b1110000; //7
            4'd8:{a,b,c,d,e,f,g}=7'b1111111; //8
            default:begin
            {a,b,c,d,e,f,g}=7'b0000000;
            $display("Invalid BCD INPUT");
        end
    endcase
end
endmodule