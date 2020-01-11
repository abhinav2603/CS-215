N = [10,100,1000,10000,100000];
mu =[1,2]';
Cov = zeros(2,2);
Cov(1,:)=[1.6250, -1.9486];
Cov(2,:)=[-1.9486, 3.8750];
[v,d]=eig(Cov);
A=v*sqrt(d);
box_mu=zeros(5,100);
box_C=zeros(5,100);

for i = 1:length(N)
     for j =1:100
         %smp = zeros(N(i),2,1);
         X=randn(2,N(i));
         G=A*X+mu;
         emp_mu = sum(G,2)/N(i);
         emp_Cov = zeros(2,2);
         for k = 1:N(i)
             emp_Cov=emp_Cov+(G(:,k)-emp_mu)*(G(:,k)-emp_mu)';
         end
         emp_Cov = emp_Cov/N(i);
%          for k=1:N(i)
%              smp(k,:,:) = A*randn(2,1)+mu;
%              emp_mu = emp_mu+smp(k,:,:);
%          end
%          emp_mu = emp_mu/N(i);

         box_mu(i,j) = norm(mu-emp_mu)/norm(mu);
         box_C(i,j)=norm(emp_Cov-Cov,'fro')/norm(Cov,'fro');
     end
     figure(); scatter(G(1,:),G(2,:));
     hold on;
     [V1, D1] = eig(emp_Cov);
     point1 = [ emp_mu+V1(:,1)*D1(1,1),emp_mu];
     point2 = [ emp_mu+V1(:,2)*D1(2,2),emp_mu];
     plot(point1(1,:), point1(2,:), 'LineWidth', 2);
     plot(point2(1,:), point2(2,:), 'LineWidth', 2);
     xlabel('X1');
     ylabel('X2');
     title("N = 10^"+i);
     hold off;
end

figure(); boxplot(box_mu');
xlabel('log(N)');
ylabel('error(mu)');
title('boxplot for mu');
figure(); boxplot(box_C');
xlabel('log(N)');
ylabel('error(Covariance)');
title('boxplot for Covariance');

%%%%%%%%%%%%%%%-----PART 4--------%%%%%%%%%%%%%%%
%   for i = 1:length(N)
%       smp=zeros(N(i),2,1);
%       emp_mu = zeros(2,1);
%       for j =1:N(i)
%           smp(j,:,:)=A*randn(2,1)+mu;
%           emp_mu = emp_mu+smp(j,:,:);
%       end
%       emp_mu=emp_mu/N(i);
%       emp_Cov = zeros(2,2);
%       for k =1:N(i)
%           emp_Cov = emp_Cov+(smp(k,:,:)-emp_mu)*(smp(k,:,:)-emp_mu)';
%       end
%       emp_Cov=emp_Cov/N(i);
%       [v1,d1]=eigs(emp_Cov,1);
%       figure();scatter(smp(:,1,1),smp(:,2,1));
%       hold 
%       hold on;
%       
%      [V1, D1] = eig(emp_Cov);
%      point1 = [ emp_mu+V1(:,1)*D1(1,1),emp_mu];
%      point2 = [ emp_mu+V1(:,2)*D1(2,2),emp_mu];
%      plot(point1(1,:), point1(2,:), 'LineWidth', 2);
%      plot(point2(1,:), point2(2,:), 'LineWidth', 2);
%      xlabel('X1');
%      ylabel('X2');
%      title("N = 10^"+i);
%      hold off; 
%   end
%     