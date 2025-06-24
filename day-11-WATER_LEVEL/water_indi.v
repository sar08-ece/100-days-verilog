//water level indicator
/*
 --------------------
|         S1         |   S1 is the highest level
|         S2         |
|         S3         |
|         S4         |
|         S5         |
----------------------  S5 is the lowest level

*/

module water_lev(input s1,s2,s3,s4,s5, //s5 is the lowest level and s1 is the highest
output reg l1,l2,l3,l4,l5);            

 always @(*)begin
      l1=s1;
      l2=s1|s2;
      l3=s1|s2|s3;
      l4=s1|s2|s3|s4;
      l5=s1|s2|s3|s4|s5;
      
  end
  endmodule
     
