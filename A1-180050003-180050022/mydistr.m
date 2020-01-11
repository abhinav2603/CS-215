function rnd = mydistr()
p=rand();
if p <= .05
    1
elseif p <= .45
    2
elseif p <= .6
    3
elseif p <= .9
    4
else
    5
end
