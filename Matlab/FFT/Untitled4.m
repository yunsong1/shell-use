clear;
fs=100;%采样频率
t=0:1/fs:10-1/fs%采样周期
%%原始信号的创建
f=sin(2*pi*10*t);
 
subplot(311)
plot(t,f)
 
%%fft
f_fft=fft(f);
N=length(f_fft);%这里取出f_fft也就是信号做完fft之后的序列长度
 
Y=f_fft(1:N/2+1);
Y(2:end-1)=2*Y(2:end-1);
 
Y_amp=abs(Y)/N;
 
df=fs/N;
 
f=(0:1:N/2)*df;
subplot(312);
plot(f,Y_amp)