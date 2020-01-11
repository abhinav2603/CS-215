function newMedian = UpdateMedian (oldMedian, NewDataValue, A, n)
if mod(n,2) == 0
    if NewDataValue => A(n/2+1)
        newMedian = A(n/2+1);
    elseif NewDataValue <= A(n/2)
        newMedian = A(n/2);
    else
        newMedian = NewDataValue;
    end
else
    if NewDataValue <= A((n-1)/2)
        newMedian = (A((n-1)/2)+A((n+1)/2))/2;
    elseif NewDataValue => A((n+3)/2)
        newMedian = (A((n+1)/2)+A((n+3)/2))/2;
    else
        newMedian = (A((n+1)/2)+NewDataValue)/2;
    end
end
end
