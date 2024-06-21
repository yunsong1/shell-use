clc;
a=1000;%²ÉÑùÂÊ
b=0:1/a:1-1/a;
c=sin(2*pi*1*b)+sin(2*pi*5*b)+sin(2*pi*50*b);
figure
plot(b,c);
c1=filter(Hd,c);
figure
plot(b,c1);

%%  ÂË²¨
Fs = 5000;  % Sampling Frequency
 
Fpass = 50;              % Passband Frequency
Fstop = 51;              % Stopband Frequency
Dpass = 0.057501127785;  % Passband Ripple
Dstop = 0.0001;          % Stopband Attenuation
flag  = 'scale';         % Sampling Flag
 
% Calculate the order from the parameters using KAISERORD.
[N,Wn,BETA,TYPE] = kaiserord([Fpass Fstop]/(Fs/2), [1 0], [Dstop Dpass]);
 
% Calculate the coefficients using the FIR1 function.
b  = fir1(N, Wn, TYPE, kaiser(N+1, BETA), flag);
Hd = dfilt.dffir(b);