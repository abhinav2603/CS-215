clc;
clear;

%%%%%%------PART A------%%%%%%

z=randn([1000,1]);
z=z*4;
index=randperm(1000);
t=ones(750,1);
v=ones(250,1);
for i=1:750
t(i)=z(index(i));
end

for i=1:250
v(i)=z(index(i+750));
end

%%%%%%----PART C-----%%%%%%

sigma=[0.001, 0.1, 0.2, 0.9, 1, 2, 3, 5, 10, 20, 100];
res=ones(1,11);
max=-10000;
max_ind=.001;
for i=1:size(sigma,2)
    prod=1;
    for j=1:size(v,1)
        total=0;
        for k=1:size(t,1)
            total=total+exp(-1*((v(j)-t(k))^2/(2*sigma(i)^2)))/(sigma(i)*sqrt(2*pi)*size(t,1));
        end
        prod=prod*total;
    end;
    res(i)=log(prod);
    if (max < log(prod))
        max=log(prod);
        max_ind=sigma(i);
    end
end
sigma1=log(sigma);
figure(1); plot(sigma1,res);
xlabel('log(\sigma)')
ylabel('LL')
title('Plot of LL vs log(\sigma)')
fprintf('%s','The maximum value of LL occurs at sigma =',num2str(max_ind))
fprintf('\n%s')

%%%%%%-----PART D------%%%%%%

D=ones(1,11);
min=1000; 
for i=1:size(sigma,2)
    temp=ones(250,1);
    for j=1:size(v,1)
        orig=exp(-1*(v(j)^2/32))/(4*sqrt(2*pi));
        total=0;
        for k=1:size(t,1)
            total=total+exp(-1*((v(j)-t(k))^2/(2*sigma(i)^2)))/(sigma(i)*sqrt(2*pi)*size(t,1));
            %disp(sum)
        end
        temp(j)=(orig-total)^2;
    end
    D(i)=sum(temp);
    if D(i) < min
        min=D(i);
        min_index=sigma(i);
    end
end
figure(2); plot(sigma1,D)
xlabel('log(\sigma)')
ylabel('D')
title('D versus log(\sigma)')
fprintf('%s','The minimum value of D is ',min,' at sigma =',num2str(min_index))
fprintf('\n%s')