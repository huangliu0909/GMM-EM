Y = zeros(1,100)
YY = zeros(1,100)
N = 1:10:1000;
for i = 1:100
    r=f(N(i));
    Y(i)=r(1);
    YY(i) =r(2);
end
plot(N,Y)
%plot(N,YY)

function r = f(n)

s=1;
ss=0;
for i = 1:1:n
   y(i) = normrnd(10,5);
   s = s + y(i);
end
r(1) = s/n;
for i = 1:1:n
    ss = ss + (y(i)- r(1)).^2;
r(2) = ss/n;    
end
end
