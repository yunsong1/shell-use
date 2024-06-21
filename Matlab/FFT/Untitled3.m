%% FFT小实验
%功能：帮助理解FFT的物理意义
%2019年8月16日15:02:20
close all;clc;clear all;
fs = 256;%采样率
N = 256;%采样点数
delta_f = fs/N;%频率分辨率
t = (0:1/fs:N/fs);%1/fs代表采样间隔， N/fs表示采样时间
%% 模拟一个信号,参数设置如下
Adc = 2;%直流分量
A1 = 3;%信号1的幅值、频率和相位
f1 = 50;
p1 = 30;
A2 = 1.5;%信号2的幅值、频率和相位
f2 = 75;
p2 = 90;
St = Adc + A1*cos(2*pi*f1*t - pi*p1/180) + A2*cos(2*pi*f2*t + pi*p2/180);
%% 绘图
figure
plot(St);
title('时域波形')
figure
res_fft = fft(St,N);
abs_res_fft = abs(res_fft);
plot(abs_res_fft);
title('一维FFT结果')
%真实的幅度和频率
real_amp = abs_res_fft/(N/2);
real_amp(1) = abs_res_fft(1)/N;
real_freq = ((1:N)-1)*fs/N;
figure
plot(real_freq,real_amp)
title('真实的幅值和频率')
xlabel('频率')
ylabel('幅度')
ylim([0, 4]); % 设置纵轴范围
%真实的相位
figure;
Phrase=(1:N/2);
for i=1:N/2
    Phrase(i)=phase(res_fft(i)); %计算相位
    Phrase(i)=Phrase(i)*180/pi; %换算为角度
end
plot(real_freq(1:N/2),Phrase(1:N/2));   %显示相位图
title('相位-频率曲线图');
xlabel('频率')
ylabel('相位')