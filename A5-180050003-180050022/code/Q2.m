rng(1)

N = [5 10 20 40 60  80 100 500 1000 10000];
M=200;  
l = 5; %lambda
MLE = zeros(M,10);
PM = zeros(M,10);
a = 5.5;
b =1;
true_val = 5;

for i = 1:10
    for j = 1:M
        sample = rand(1,N(i));
        sample = (-1/l)*log(sample);
        MLE(j,i) = N(i)/sum(sample);
        PM(j,i) = (N(i)+a)/(sum(sample)+b);
    end
end

MLE = abs(MLE - true_val)/true_val;
PM = abs(PM - true_val)/true_val;

figure;
hold on
boxplot(MLE, N,'Colors','g');

boxplot(PM,N,'Colors','r');
xlabel('N --->');
ylabel('Relative error w.r.t \mu_{true}');

hold off
