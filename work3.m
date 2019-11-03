clear
%disp('第一分钟')
num(1) = poissrnd(4);
%disp('第二分钟')
num(2) = poissrnd(4);
%disp('第三分钟')
num(3) = poissrnd(4);


if num(1) > 0
    x(1)= exprnd(1/4);
    while x(1)>1
        x(1)= exprnd(1/4);
    end
    for i = 2:num(1)
        x(i) = x(i-1) + exprnd(1/4);
        while (x(i)>1)
            x(i) = x(i-1) + exprnd(1/4);
        end
    end
end


if num(2) > 0
    x(num(1)+1)= 1+ exprnd(1/4);
    while (x(num(1)+1)>2)
        x(num(1)+1)= 1+ exprnd(1/4);
    end
    
    
    for i = (num(1)+2):(num(1)+num(2))
        x(i) = x(i-1) + exprnd(1/4);
        while (x(i)>2)
            x(i) = x(i-1) + exprnd(1/4);
        end
    end
    
end

if num(3) > 0
    x(num(1)+num(2)+1)= 2+ exprnd(1/4);
    while (x(num(1)+num(2)+1)>3)
        x(num(2)+1)= 2+ exprnd(1/4);
    end
    
    
    for i = (num(1)+num(2)+2):(num(1)+num(2)+num(3))
        x(i) = x(i-1) + exprnd(1/4);
        while (x(i)>3)
            x(i) = x(i-1) + exprnd(1/4);
        end
    end
    
end

plot(1:num(1)+num(2)+num(3),x,'*')
