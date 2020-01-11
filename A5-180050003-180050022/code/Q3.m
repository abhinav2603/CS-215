% N = 10000;
% theta = rand(N,1);
% r =1;
% x = zeros(2,N);
% x(1,:) = r*sin(2*pi*theta);
% x(2,:) = r*cos(2*pi*theta);
% mu = sum(x,2)/N;
% Cov = zeros(2);
% for i = 1:N
%     Cov = Cov + x(:,i)*x(:,i)';
% end
% Cov = Cov / N
clear;
clc;
rng(1000);

N = 10^5;
radius = 1;

x_sum = 0;
y_sum = 0;

covariance_help = zeros(2,2);

for i = 1:N
    theta = 2*pi*rand();
    x = radius*cos(theta);
    y = radius*sin(theta);
    
    x_sum = x_sum + x;
    y_sum = y_sum + y;
    
    X = [x; y]*[x y];
    covariance_help = covariance_help + X;
end

mean_matrix = [x_sum/N; y_sum/N];
covariance = covariance_help - mean_matrix*transpose(mean_matrix);
covariance = covariance/N;
mean_matrix
covariance
N
