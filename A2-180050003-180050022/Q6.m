clc;
clear;
im1=imread('T1.jpg');
im2=imread('T2.jpg');
im1=double(im1);
im2=double(im2);
ro=zeros(21,1);
qmi=zeros(21,1);
for tx = -10:1:10;
    imc=im2;
    len=size(im2,2);
    for i=1:len;
        if tx > 0;
            imc(i,1:tx)=zeros(tx,1);
            imc(i,tx+1:len)=im2(i,1:len-tx);
        elseif tx < 0;
            imc(i,len+1+tx:len)=zeros(-1*tx,1);
            imc(i,1:len+tx)=im2(i,1-tx:len);
        end
    end
                
    rows=size(im1,1);
    cols=size(imc,2);
    N=26;
    
    h=zeros(N,N);
    for i=1:rows;
        for j=1:cols;
            h(fix(im1(i,j)/10)+1,fix(imc(i,j)/10)+1)=h(fix(im1(i,j)/10+1),fix(imc(i,j)/10)+1)+1;
        end
    end
    norm=sum(sum(h));
    h=h/norm;
    hx=zeros(26,1);
    for i=1:N;
        for j=1:26;
            hx(i)=hx(i)+h(i,j);
        end
    end
    
    hy=zeros(26,1);
    for i=1:N;
        for j=1:N;
            hy(i)=hy(i)+h(j,i);
        end
    end
    
    ro(tx+11)=corr2(im1,imc);
    qmi(tx+11)=sum(sum((h-hx*hy').^2));
end
t=[-10:1:10];
figure(1); plot(t,ro,'blue');
xlabel('tx');
ylabel('correlation coefficient');
title('correlation coefficient vs tx for T2');
%hold on;
figure(2); plot(t,qmi,'red');
xlabel('tx');
ylabel('QMI value');
title('QMI vs tx for T2');
%hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
im3=255-im1;
ro2=zeros(21,1);
qmi2=zeros(21,1);
for tx2 = -10:1:10;
    imc=im3;
    len2=size(im3,2);
    for i=1:len2;
        if tx2 > 0;
            imc(i,1:tx2)=zeros(tx2,1);
            imc(i,tx2+1:len2)=im3(i,1:len2-tx2);
        elseif tx2 < 0;
            imc(i,len2+1+tx2:len2)=zeros(-1*tx2,1);
            imc(i,1:len2+tx2)=im3(i,1-tx2:len2);
        end
    end
                
    rows2=size(im1,1);
    cols2=size(imc,2);
    N=26;
    
    h2=zeros(N,N);
    for i=1:rows2;
        for j=1:cols2;
            h2(fix(im1(i,j)/10)+1,fix(imc(i,j)/10)+1)=h2(fix(im1(i,j)/10+1),fix(imc(i,j)/10)+1)+1;
        end
    end
    norm2=sum(sum(h2));
    h2=h2/norm2;
    hx2=zeros(26,1);
    for i=1:N;
        for j=1:26;
            hx2(i)=hx2(i)+h2(i,j);
        end
    end
    
    hy2=zeros(26,1);
    for i=1:N;
        for j=1:N;
            hy2(i)=hy2(i)+h2(j,i);
        end
    end
    
    ro2(tx2+11)=corr2(im1,imc);
    qmi2(tx2+11)=sum(sum((h2-hx2*hy2').^2));
end
t2=[-10:1:10];
figure(3); plot(t2,ro2,'blue');
xlabel('tx');
ylabel('correlation coefficient');
title('correlation coefficient vs tx for negative(T1)');
%hold on;
figure(4); plot(t2,qmi2,'red');
ylabel('QMI value');
xlabel('tx');
title('QMI vs tx for negative(T1)');
%hold off;
