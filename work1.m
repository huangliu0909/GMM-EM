pi = f(1000000)
function pi = f(n)
X = unifrnd (-1,1,1, n);
Y = unifrnd (-1,1,1, n);
s=0;
for i = 1:1:n
    if X(i)*X(i) + Y(i)*Y(i)<=1
        s=s+1;
    end
end


pi = s/n*4;
end

