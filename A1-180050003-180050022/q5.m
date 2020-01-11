x=[-3:.02:3];
y=5*sin(2.2*x+pi/3);
z=y;
len=length(x);
w=randperm(len,floor(.3*len));
for j=1:length(w)
 z(w(j))=rand()*20+100;
end
figure(1);plot(x,y,'red');  
hold on;
plot(x,z,'cyan');

ymedian=z;
for i=1:len
    ymedian(i)=median(z(max(1,i-9):min(len,i+9)));
end
plot(x,ymedian,'blue');

ymean=z;
for i=1:len
    ymean(i)=mean(z(max(1,i-9):1:min(len,i+9)));
end
plot(x,ymean,'black');

yquartile=z;
for i=1:len
    yquartile(i)=quantile(z(max(1,i-9):1:min(len,i+9)),.25);
end
plot(x,yquartile,'green');
fprintf('\nRMS error for 30 percent corruption \n');
ymean_rms=sum((y-ymean).^2)/sum(y.^2);
fprintf('\nRMS error for mean filtering is %f',ymean_rms);

ymed_rms=sum((y-ymedian).^2)/sum(y.^2);
fprintf('\nRMS error for median filtering is %f', ymed_rms);

yquant_rms=sum((y-yquartile).^2)/sum(y.^2);
fprintf('\nRMS error for first quartile filtering is %f\n', yquant_rms);

legend('y','ycorrupted','ymedian','ymean','yquant');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

z1=y;
len=length(x);
w1=randperm(len,floor(.6*len));
for j=1:length(w1)
 z1(w1(j))=rand()*20+100;
end
figure(2);plot(x,y,'red');  
hold on;
plot(x,z,'cyan');

ymedian1=z1;
for i=1:len
    ymedian1(i)=median(z1(max(1,i-9):min(len,i+9)));
end
plot(x,ymedian1,'blue');

ymean1=z1;
for i=1:len
    ymean1(i)=mean(z1(max(1,i-9):1:min(len,i+9)));
end
plot(x,ymean1,'black');

yquartile1=z1;
for i=1:len
    yquartile1(i)=quantile(z1(max(1,i-9):1:min(len,i+9)),.25);
end
plot(x,yquartile1,'green');
fprintf('\nRMS error for 60 percent corruption \n');
ymean_rms1=sum((y-ymean1).^2)/sum(y.^2);
fprintf('\nRMS error for mean filtering is %f',ymean_rms1);

ymed_rms1=sum((y-ymedian1).^2)/sum(y.^2);
fprintf('\nRMS error for median filtering is %f', ymed_rms1);

yquant_rms1=sum((y-yquartile1).^2)/sum(y.^2);
fprintf('\nRMS error for first quartile filtering is %f\n', yquant_rms1);
legend('y','ycorrupted','ymedian','ymean','yquant');
