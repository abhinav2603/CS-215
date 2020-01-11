%function n = Paradox(p)

p=[5, 10, 15, 20, 30, 40, 50, 60, 70, 80, 90, 95, 99, 99.99, 99.9999, 100];
p=p/100;
N=p;
for i=1:length(p)
    
    n=1;    
    k=365;
    cnt=1;
    P=p(i);
    while ((1-P) < ((cnt*k)/365))
        cnt=cnt*k/365;
        k=k-1;
        n=n+1;
    end
    fprintf(' %d,',n);
    N(i)=n;
end
fprintf('\n');
plot(p,N);
