clear
x = [0.697	0.46;
0.774	0.376;
0.634	0.264;
0.608	0.318;
0.556	0.215;
0.403	0.237;
0.481	0.149;
0.437	0.211;
0.666	0.091;
0.243	0.267;
0.245	0.057;
0.343	0.099;
0.639	0.161;
0.657	0.198;
0.36	0.37;
0.593	0.042;
0.719	0.103;
0.359	0.188;
0.339	0.241;
0.282	0.257;
0.748	0.232;
0.714	0.346;
0.483	0.312;
0.478	0.437;
0.525	0.369;
0.751	0.489;
0.532	0.427;
0.473	0.376;
0.725	0.445;
0.446	0.459];


for i = 1 : 3
    a(i) = 1/3;
end

u(1,1) = x (6,1);
u(1,2) = x (6,2);
u(2,1) = x (22,1);
u(2,2) = x (22,2);
u(3,1) = x (27,1);
u(3,2) = x (27,2);
E1=0.1*eye(2);
E2=0.1*eye(2);
E3=0.1*eye(2);

count = 1;
y = zeros(30,3);
while (count < 38)
    sum= zeros(30);
    for j = 1 :30
        for i = 1:3
            if i == 1
                
                p(j,i) = mvnpdf(x(j,:),u(i,:),E1);
                sum(j) = sum(j) + a(i) * p(j,i);
            end
            if i == 2
                
                p(j,i) = mvnpdf(x(j,:),u(i,:),E2);
                sum(j) = sum(j) + a(i) * p(j,i);
            end
            if i == 3
                p(j,i) = mvnpdf(x(j,:),u(i,:),E3);
                sum(j) = sum(j) + a(i) * p(j,i);
            end
        end
    end
    
    for j = 1 :30
        for i = 1:3
            y(j,i) = a(i) * p(j,i) / sum(j);
        end
    end
    
   for i = 1:3
       up = 0;
       down = 0;
       for j = 1 :30
           up = up + y(j,i) * x(j,:);
           down = down + y(j,i);
       end
       u(i,:) = up/down;
   end
   
   for i = 1: 3
       up1 = 0;
       down1 = 0;
       for j = 1 : 30
           aa = reshape((x(j,:) - u(i , :)),2,1);
           bb = reshape((x(j,:) - u(i , :))',1,2);
           
           up1 = up1 + y(j,i) * aa*bb;
           down1 = down1 +  y(j,i);
       end
       if i == 1
           E1 = up1/down1;
       end
       if i == 2
           E2 = up1/down1;
       end
       if i == 3
           E3 = up1/down1;
       end
   end
    
   for i = 1: 3
       up2 = 0;
       for j = 1 : 30
           up2 = up2 +  y(j,i);
       end
       a(i) = up2/30;
   end
   count = count +1;
end
figure;
hold on
for i = 1 : 30
    if y(i,1) > y(i,2) && y(i,1) > y(i,3)
    plot(x(i,1),x(i,2),'*r')
    end
    if y(i,2) > y(i,1) && y(i,2) > y(i,3)
    plot(x(i,1),x(i,2),'*k')
    end
    if y(i,3) > y(i,2) && y(i,3) > y(i,1)
    plot(x(i,1),x(i,2),'*b')
    end
end
