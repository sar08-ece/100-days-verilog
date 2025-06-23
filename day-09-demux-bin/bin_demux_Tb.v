module bin_demux_Tb();
  reg [7:0]bin;
  reg [1:0]sel;
  
  bin_demux b1(.bin(bin),.sel(sel));
  initial
   begin
       $display("TIME\t Bin\t sel\t");
       $monitor("%0t\t %b\t %b\t ",$time,bin,sel);
      bin=8'b10101010; sel=00;#100
      bin=8'b10101010; sel=01;#100
      bin=8'b10101010;sel=11;#100
      bin=8'b10101110; sel=10;#100
      $finish;
  end
  endmodule