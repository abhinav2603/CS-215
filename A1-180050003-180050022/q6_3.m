function newStd = UpdateStd (OldMean, OldStd, NewMean, NewDataValue, n)
newStd = sqrt((OldMean-NewMean)^2+((NewDataValue-NewMean)^2+(OldStd^2)*(n-1))/n);
end