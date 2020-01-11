train_data_fruit = zeros(19200,16);
train_data_fruit(:,1) = reshape(double(imread('/data/data_fruit/image_1.png')),[19200,1]);
train_data_fruit(:,2) = reshape(double(imread('/data/data_fruit/image_2.png')),[19200,1]);
train_data_fruit(:,3) = reshape(double(imread('/data/data_fruit/image_3.png')),[19200,1]);
train_data_fruit(:,4) = reshape(double(imread('/data/data_fruit/image_4.png')),[19200,1]);
train_data_fruit(:,5) = reshape(double(imread('/data/data_fruit/image_5.png')),[19200,1]);
train_data_fruit(:,6) = reshape(double(imread('/data/data_fruit/image_6.png')),[19200,1]);
train_data_fruit(:,7) = reshape(double(imread('/data/data_fruit/image_7.png')),[19200,1]);
train_data_fruit(:,8) = reshape(double(imread('/data/data_fruit/image_8.png')),[19200,1]);
train_data_fruit(:,9) = reshape(double(imread('/data/data_fruit/image_9.png')),[19200,1]);
train_data_fruit(:,10) = reshape(double(imread('/data/data_fruit/image_10.png')),[19200,1]);
train_data_fruit(:,11) = reshape(double(imread('/data/data_fruit/image_11.png')),[19200,1]);
train_data_fruit(:,12) = reshape(double(imread('/data/data_fruit/image_12.png')),[19200,1]);
train_data_fruit(:,13) = reshape(double(imread('/data/data_fruit/image_13.png')),[19200,1]);
train_data_fruit(:,14) = reshape(double(imread('/data/data_fruit/image_14.png')),[19200,1]);
train_data_fruit(:,15) = reshape(double(imread('/data/data_fruit/image_15.png')),[19200,1]);
train_data_fruit(:,16) = reshape(double(imread('/data/data_fruit/image_16.png')),[19200,1]);

%%%%%%%%%%%%---------TRASH ABOVE-------------%%%%%%%%%%%%%%%

%%%%%%%%%%%%---------MAIN CODE---------------%%%%%%%%%%%%%%%%%
N =4;
mu = zeros(19200,1);
for i = 1:16
    mu = mu + train_data_fruit(:,i);
end
mu = mu/16;

Cov = zeros(19200,19200);
for i = 1:16
    Cov = Cov+(train_data_fruit(:,i)-mu(:))*(train_data_fruit(:,i)-mu(:))';
end
Cov =Cov/16;

[v,d]=eigs(Cov,N);
figure(); 
z=zeros(80,80,3);
a=reshape(mu,[80,80,3]);
for i = 1: 3
    z(:,:,i)=rescale(a(:,:,i));
end
subplot(2,3,1); imshow(z);
for i = 1:N
    a=reshape(v(:,i),[80,80,3]);
    for j = 1:3
        z(:,:,j)=rescale(a(:,:,j));
    end
    subplot(2,3,i+1); imshow(z);
end
%subplot(2,3,1); imshow(rescale(reshape(mu,[80,80,3])));
%subplot(2,3,2); imshow(rescale(reshape(v(:,1),[80,80,3])));
%subplot(2,3,3); imshow(rescale(reshape(v(:,2),[80,80,3])));
%subplot(2,3,4); imshow(rescale(reshape(v(:,3),[80,80,3])));
%subplot(2,3,5); imshow(rescale(reshape(v(:,4),[80,80,3])));

eig_10 = eigs(Cov,10);
x = [1:10];

figure(); plot(x,eig_10);

%%%%%%%%%%%%%%%%%----------PART 2-------------%%%%%%%%%%%%%%%

A = zeros(N+1,N+1);

 A(1,:) = [dot(mu,mu),dot(v(:,1),mu),dot(v(:,2),mu),dot(v(:,3),mu),dot(v(:,4),mu)];
 A(2,:) = [dot(mu,v(:,1)),dot(v(:,1),v(:,1)),dot(v(:,2),v(:,1)),dot(v(:,3),v(:,1)),dot(v(:,4),v(:,1))];
 A(3,:) = [dot(mu,v(:,2)),dot(v(:,1),v(:,2)),dot(v(:,2),v(:,2)),dot(v(:,3),v(:,2)),dot(v(:,4),v(:,2))];
 A(4,:) = [dot(mu,v(:,3)),dot(v(:,1),v(:,3)),dot(v(:,2),v(:,3)),dot(v(:,3),v(:,3)),dot(v(:,4),v(:,3))];
 A(5,:) = [dot(mu,v(:,4)),dot(v(:,1),v(:,4)),dot(v(:,2),v(:,4)),dot(v(:,3),v(:,4)),dot(v(:,4),v(:,4))];
 
 for i = 1:16
     z = train_data_fruit(:,i);
     %disp("yo");
     B = [dot(mu,z),dot(v(:,1),z),dot(v(:,2),z),dot(v(:,3),z),dot(v(:,4),z)];
     X = A^(-1)*B';
     figure(); 
     p = zeros(19200,1);
     p = X(1)*mu+X(2)*v(:,1)+X(3)*v(:,2)+X(4)*v(:,3)+X(5)*v(:,4);
     
     z1=zeros(80,80,3);
     a=reshape(z,[80,80,3]);
     for j = 1: 3
         z1(:,:,j)=rescale(a(:,:,j));
     end
     subplot(1,2,1); imshow(z1);
     
     a=reshape(p,[80,80,3]);
     for j = 1: 3
         z1(:,:,j)=rescale(a(:,:,j));
     end
     subplot(1,2,2); imshow(z1);
 end

%%%%%%%%%%%%%%-----------PART 3-------------%%%%%%%%%%%%%%%%%%%%

A1 = v*sqrt(d);
 for i = 1:3
     W = randn(4,1);
     X1 = A1*W+mu;
     z1=zeros(80,80,3);
     a=reshape(X1,[80,80,3]);
     for j = 1: 3
         z1(:,:,j)=rescale(a(:,:,j));
     end
     figure(); imshow(z1);
 end
