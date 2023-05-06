clc
clear

syms x

y=3*x-1;
d=sqrt((4-x)^2+(3-y)^2);
c=2*d*10+500/(d+2);

f=diff(c,x);
X=solve(f,x);

for i=1:length(X)
    D(i)=subs(d,x,X(i));
    if D(i)<10
        cost(i)=subs(c,d,D(i));
    end
end

for i=1:length(cost)
    fprintf('---------------------------------\nOption(%d):\nx=%1.2f\ny=%1.2f\nDistance=%1.2f\nCost=%1.2f\n\n',i,X(i),subs(y,x,X(i)),subs(d,x,X(i)),cost(i))
end

clc
clear

syms x

y=3*x-1;
d=sqrt((4-x)^2+(3-y)^2);
c=2*d*10+500/(d+2);

f=diff(c,x);
X=solve(f,x);

for i=1:length(X)
    D(i)=subs(d,x,X(i));
    if D(i)<10
        cost(i)=subs(c,d,D(i));
    end
end

for i=1:length(cost)
    fprintf('---------------------------------\nOption(%d):\nx=%1.2f\ny=%1.2f\nDistance=%1.2f\nCost=%1.2f\n\n',i,X(i),subs(y,x,X(i)),subs(d,x,X(i)),cost(i))
end

clc
clear

syms x

y=3*x-1;
d=sqrt((4-x)^2+(3-y)^2);
c=2*d*10+500/(d+2);

f=diff(c,x);
X=solve(f,x);

for i=1:length(X)
    D(i)=subs(d,x,X(i));
    if D(i)<10
        cost(i)=subs(c,d,D(i));
    end
end

for i=1:length(cost)
    fprintf('---------------------------------\nOption(%d):\nx=%1.2f\ny=%1.2f\nDistance=%1.2f\nCost=%1.2f\n\n',i,X(i),subs(y,x,X(i)),subs(d,x,X(i)),cost(i))
end