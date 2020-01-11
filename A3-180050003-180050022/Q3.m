clc;
clear;
M=dlmread('XYZ.txt');
x=M(1:2000,1);
y=M(1:2000,2);
z=M(1:2000,3);
A=[sum(x.*x) sum(x.*y) sum(x); sum(x.*y) sum(y.*y) sum(y); sum(x) sum(y) 2000];
C=[sum(z.*x) sum(z.*y) sum(z)];
C=C';
X=A^-1*C;
a=X(1);
b=X(2);
c=X(3);
val=z-a*x-b*y-c;
var=sum(val.^2)/2000;
out=['z =', num2str(a),'x +',num2str(b), 'y +', num2str(c)];
disp(out)
fprintf('%s','Predicted value of Variance is:',num2str(var))
fprintf('\n%s')