load('data/points2D_Set1.mat');
u1=0;
u2=0;

for i=1:length(x)
    u1=u1+x(i);
end

u1=u1/300;

for j=1:length(y)
    u2=u2+y(j);
end

u2=u2/300;

a=zeros(2, 2);

for i=1:300
    b=zeros(2,1);
    b(1)=x(i)-u1;
    b(2)=y(i)-u2;
    a=a+b*b';
end

a=a/300;
[v, d]=eigs(a, 1);
figure(); scatter(x,y);
hold on;
z=((x-u1)*v(2)/v(1))+u2;    
plot(x,z);
hold off;

%%%%%%%%%%%%%%%%%%----PART 2-----------%%%%%%

load ('data/points2D_Set2.mat');


u1=0;
u2=0;

for i=1:length(x)
    u1=u1+x(i);
end

u1=u1/1000;

for j=1:length(y)
    u2=u2+y(j);
end

u2=u2/1000;

a=zeros(2, 2);

for i=1:1000
    b=zeros(2,1);
    b(1)=x(i)-u1;
    b(2)=y(i)-u2;
    a=a+b*b';
end

a=a/1000;
[v, d]=eigs(a, 1);
figure(); scatter(x,y);
hold on;
z=((x-u1)*v(2)/v(1))+u2;    
plot(x,z);




