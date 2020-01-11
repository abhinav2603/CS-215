clear;
clc;
close all;

a=[1,2,3,4,5];
p=[.05,.40,.15,.3,.1];
%mu=sum(a.*p);
%xsq=sum((a.*a).*p);
%sigma=sqrt(xsq-(mu*mu));
values=1;
MAD = zeros(10,1);
N=zeros(10,1);
for n=[5,10, 20, 50, 100, 200, 500, 1000, 5000, 10000]
    nsamp = 10000;
        
    X = randi([0 1],nsamp,n);
    for i=1:nsamp
        for j=1:n
            p=rand();
            %fprintf('%d\n',p);
            if p <= .05
               X(i,j) = 1;
            elseif p <= .45
                X(i,j) =2;
            elseif p <= .6 
                X(i,j) =3;
            elseif p <= .9 
                X(i,j) =4;
            else
                X(i,j) =5;
            end
        end
    end

    sumX = sum(X,2)/n;
    numbins = 50;
    mu=mean(sumX);
    sigma=std(sumX);
   
    figure(1); hist(sumX,numbins); %minval+stepsize/2:stepsize:maxval-stepsize/2);
    title (sprintf('PDF of the average of %d iid random variables',n));
    pause(1);

    [f,x] = ecdf(sumX);
    p = normcdf(x,mu,sigma);
    figure(2); plot(x,f,'blue');
    hold on;    
    plot(x,p,'red');
    title (sprintf('CDF of the average of %d iid random variables',n));
    hold off;
    pause(1);
    %len=size(x,1);
    maximum=0;
    for j=1:length(x)
        maximum=max(maximum , abs(f(j,1)-p(j,1)));
    end
    MAD(values)=maximum;
    N(values)=n;
    values=values+1;
end
figure(2); semilogx(N,MAD,'red');