clear,clc
Fs=1000;
N=1:2000;
signal=sin(2*pi*1*N/Fs)+2*sin(2*pi*5*N/Fs)+3*sin(2*pi*50*N/Fs)+4*sin(2*pi*40*N/Fs);

% f=filter(tttt,signal);

figure;
subplot(211);
plot(N/Fs,signal);
title('ÂË²¨Ç°');
subplot(212);
plot(N/Fs,f);
title('ÂË²¨ºó');
