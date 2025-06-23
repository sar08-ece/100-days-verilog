LOGIC USED:
Suppose we have A=5 B=2 result should be 10
A=5(0101) and B=2(0010)
we take a variable i which is the index of B.

When i=0,B[i]=0 so we skip
when i=1,B[i]=1 so we shift A by the i value 
So we get 0101<<1 so the result is 1010
similarly we skip i=2 and i=3 since B[i]=0 for those two.
Final result is the sum of all these i.e.1010(10)

Another example A=4(0100) B=3(0011)

When i=0, B[i]=1 we shift by i
So we get 0100<<0 result=0100

When i=1 B[i]=1 we shift by 1
So we get 0100<<1 result=1000

We skip i=2 and i=3 since B[i]=0
So the final result is =0100+1000=1100(12)