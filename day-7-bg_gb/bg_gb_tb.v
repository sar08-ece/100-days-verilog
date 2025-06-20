module bg_gb_tb();
    reg [3:0]in;
    reg mode;
    wire [3:0]d_out;
    
    bg_gb b1(.in(in),.mode(mode),.out(d_out));
    
    initial begin
        
        $display("Time\t Input\t Mode\t Output");
        $monitor("%0t\t %b\t %b\t %b\t ",$time,in,mode,d_out);
        mode=0; in=4'b0011; #100
        mode=1; in=4'b0011; #100
        mode=0; in=4'b0111; #100
        mode=1; in=4'b1111; #100
        mode=1; in=4'b0001; #100
        $finish;
    end
endmodule