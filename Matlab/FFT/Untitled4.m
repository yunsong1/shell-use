clear;
fs=100;%����Ƶ��
t=0:1/fs:10-1/fs%��������
%%ԭʼ�źŵĴ���
f=sin(2*pi*10*t);
 
subplot(311)
plot(t,f)
 
%%fft
f_fft=fft(f);
N=length(f_fft);%����ȡ��f_fftҲ�����ź�����fft֮������г���
 
Y=f_fft(1:N/2+1);
Y(2:end-1)=2*Y(2:end-1);
 
Y_amp=abs(Y)/N;
 
df=fs/N;
 
f=(0:1:N/2)*df;
subplot(312);
plot(f,Y_amp)