clear all; close all;

soubor = "ntc.csv";
data=csvread(soubor);

U_NTC= 3.3 .* data(:,2)./(10 + data(:,2));

ad= 1024*U_NTC/3.3;

t=data(:,1);

p=polyfit(ad,t,10);

ad2=0:1023;

t2 = round(polyval(p, ad2), 1); 

figure(1)
hold on
plot(ad,data(:,1),'o')
plot(ad2, t2, 'r')
hold off

dlmwrite('data.dlm', t2*10, ',');