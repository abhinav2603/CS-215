
arr=[10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000];
for j=arr
    sum=0;
    for i=1:j
        x=single(2*rand - 1);
        y=single(2*rand - 1);
        if(x*x + y*y<=1)
            sum=sum+1;
        end
    end
    (sum/j)*4
end

    
sum=0;
    for i=1:108000
        x=single(2*rand - 1);
        y=single(2*rand - 1);
        if(x*x + y*y<=1)
            sum=sum+1;
        end
    end
    (sum/108000)*4