%clc; clear;
Load('data/mnist.m');
mu = double(zeros(10,784,1));
cnt = zeros(10,1);
v = zeros(10,784,784);
d = zeros(10,784,784);

for i = 1:1:10
    muu = double(zeros(784,1));
    for j = 1:1:60000
        if int8(labels_train(j)) == i-1
            z = digits_train(:,:,j);
            muu = muu+double(reshape(z,[784,1]));
            cnt(i) = cnt(i) + 1;
        end
    end
    mu(i,:,:)=muu/cnt(i);
    %figure();imshow(reshape(uint8(mu(i,:,:)),[28,28]));
end
Cov = double(zeros(10,784,784));
for i = 1:1:10
   c = zeros(784,784);
   for j = 1:1:6000
       if labels_train(j) == i-1
           z = double(reshape(digits_train(:,:,j),[784,1]));
           c = c + (z-mu(i,:,:)')*(z-mu(i,:,:)')';
       end
   end
   Cov(i,:,:)=c/cnt(i);
   [v(i,:,:),d(i,:,:)] = eig(c/cnt(i));
   %v(i)=v1
end

%for i = 1:10
 %   [v(i),d(i)] = eig(Cov(i,:,:)); 
%end
%max = 0;
eigv_max=zeros(10:784:1);
eig_max=zeros(10,1);
eigen_values=zeros(10,784);
for i = 1:10
    for j = 1:784
        if eig_max(i) < d(i,j,j)
            eig_max(i) = d(i,j,j);
            eigv_max(i,:,:) = v(i,:,j);
        end
        eigen_values(i,j) = d(i,j,j);
    end
end
for i = 1:10
    y = sort(eigen_values(i,:),'descend');
    x = [1:784];
    %figure(); plot(x,y);
    %xlabel('values');
    %ylabel('eigen_values');
end
for i = 2:2
    y1 = reshape(mu(i,:)-sqrt(eig_max(i))*eigv_max(i,:),[28,28]);
    y2 = reshape(mu(i,:),[28,28]);
    y3 = reshape(mu(i,:)+sqrt(eig_max(i))*eigv_max(i,:),[28,28]);
    figure(); 
    subplot(1,3,1); imshow(rescale(y1));
    subplot(1,3,2); imshow(rescale(y2));
    subplot(1,3,3); imshow(rescale(y3));
    %figure(); imshow(reshape(sqrt(eig_max(i))*eigv_max(i,:),[28,28]));
end