rect =@(x) (abs(x)<=0.5);
T=50;%�����źŹ۲�ʱ��
dt=0.0001;%�������
fs=1/dt;%����Ƶ��
t=[-T/2:dt:T/2];
x1=sinc(10*t);%�������ź�
x2=rect(10*t);%�������ź�
x3=cos(100*pi*t);%�����ź�
x4=cos(100*pi*t+10*cos(2*pi*t));%�����ź�
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
f=[-N/2:(N/2-1)]*fs/N;%ת����ʵ��Ƶ�� -5000Hz 5000Hz
fs/N;%0.02Hz Ƶ�׷ֱ���
-N/2;% -250001
N/2-1;% 250000
T=N*Ts;% ��ʱ��50.0002s
tmp1=fft(s)*Ts;%�������ź� ��Ƶ�ʲ���
tmp2=N*ifft(s)*Ts;%�������ź� ��Ƶ�ʲ���
%tmp1=fft(s)/N;%�����ź� 
%tmp2=N*ifft(s)/N;%�����ź�

S(1:N/2)=tmp2(N/2+1:-1:2);
S(N/2+1:N)=tmp1(1:N/2);
S=S.*exp(j*pi*f*T);%������λ
end 