N=[5, 10, 20, 40, 60, 80, 100, 500,1000,10000];
Mu_true=10;
Std_true=4;
M = 100;
Mu_prior = 10.5;
Std_prior = 1;
mle_error=zeros(10,M);
prior1_error=zeros(10,M);
prior2_error=zeros(10,M);
a=9;
b=11;
for i = 1:length(N)
    n = N(i);
    for j =1:M
        x_sample = normrnd(Mu_true,Std_true,n,1);
        mu_mle = sum(x_sample)/n;
        mu_prior2 = sum(x_sample)/n;
        if mu_mle > b
            mu_prior2 = b;
        elseif mu_mle < a
            mu_prior2 = a;
        end
        mu_prior1 = (Mu_prior + (n*mu_mle/Std_true^2))/(Std_prior+n/Std_true^2);
        mle_error(i,j)=   abs(mu_mle-Mu_true)/Mu_true;
        prior1_error(i,j) = abs(mu_prior1-Mu_true)/Mu_true;
        prior2_error(i,j) = abs(mu_prior2-Mu_true)/Mu_true;
    end
    
end
figure(); boxplot(mle_error',N,'Colors','g');
title('MLE(green),Gaussian(red),Uniform(red) relative error');
%ylim([0 1]);
%set(gca,'YTick',0:.02:.6);
%figure();
hold on;
boxplot(prior1_error',N,'Colors','b');
%title('Gaussian prior relative error');
%ylim([0 1]);
%set(gca,'YTick',0:.02:.6);

%figure();
boxplot(prior2_error',N,'Colors','r');
%ylim([0 1]);
%set(gca,'YTick',0:.02:.6);
xlabel('N --->');
ylabel('Relative error w.r.t \mu_{true}');
%legend('MLE_{relative error}, Gaussian prior_{relative error}, Uniform_{relative error}')
hold off;
%title('Uniform prior relative error');