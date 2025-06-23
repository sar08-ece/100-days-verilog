module cmos_tb();
reg in;
wire out;

Cmos c1(.in(in),.out(out));

initial
 begin
    $display("time\t input\t output\t");
    $monitor("%0t\t %b\t %b\t",$time,in,out);
    
    #5 in=1;#100
    #5 in=0;#100
    #5  in=1;#100
$finish;
end

endmodule