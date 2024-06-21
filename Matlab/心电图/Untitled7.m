rect =@(x) (abs(x)<=0.5);
T=50;%连续信号观察时间
dt=0.0001;%采样间隔
fs=1/dt;%采样频率
t=[-T/2:dt:T/2];
x1=sinc(10*t);%非周期信号
x2=rect(10*t);%非周期信号
x3=cos(100*pi*t);%周期信号
x4=cos(100*pi*t+10*cos(2*pi*t));%周期信号
[X1,f]=t2f(x1,fs);
[X2,f]=t2f(x2,fs);
[X3,f]=t2f(x3,fs);
[X4,f]=t2f(x4,fs);
figure(1)
plot(f,[X1;X2])
axis([-50,50,-0.05,0.25])
figure(2)
plot(f,[X3;X4])
axis([-80,80,-8,28])


function [S,f]=t2f(s,fs)

Ts=1/fs;%Ts=0.0001
N=length(s);%N=500001
if rem(N,2)~=0
    N=N+1;%N=500002
    s=[s,0];
end   
f=[-N/2:(N/2-1)]*fs/N;%转换到实际频率 -5000Hz 5000Hz
fs/N;%0.02Hz 频谱分辨率
-N/2;% -250001
N/2-1;% 250000
T=N*Ts;% 总时间50.0002s
tmp1=fft(s)*Ts;%非周期信号 正频率部分
tmp2=N*ifft(s)*Ts;%非周期信号 负频率部分
%tmp1=fft(s)/N;%周期信号 
%tmp2=N*ifft(s)/N;%周期信号

S(1:N/2)=tmp2(N/2+1:-1:2);
S(N/2+1:N)=tmp1(1:N/2);
S=S.*exp(j*pi*f*T);%考虑相位
end 