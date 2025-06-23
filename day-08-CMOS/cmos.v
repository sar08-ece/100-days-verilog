module Cmos( input in,
 output out);
 supply1 VDD;
 supply0 GND;
 
 pmos p1(out,VDD,in); //drain,source,gate
 nmos n1(out,GND,in); //drain,source,gate
 endmodule