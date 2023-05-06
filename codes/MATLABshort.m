clc
clear

syms x

y=3*x-1;
d=sqrt((4-x)^2+(3-y)^2);
c=2*d*10+500/(d+2);

f=diff(c,x);
X=solve(f,x);
