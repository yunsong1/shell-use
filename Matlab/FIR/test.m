clc;

Fs = 5000; % 采样率（以Hz为单位）
duration = 0.1; % 信号时长（以秒为单位）
t = (0:1/Fs:duration-1/Fs); % 时间向量
freq_1 = 500;freq_2 = 50;% 频率
sin1 = 100*sin(2*pi*freq_1*t);
sin2 = 128*sin(2*pi*freq_2*t);
mixed_signal = sin1 + sin2;% 混合

%Hd = untitled();
%filtered_signal = filter(untitled,mixed_signal); % 应用滤波器
filtered_signal = filter(Hlp,mixed_signal); % 应用滤波器
%filtered_signal = filter(Hd,mixed_signal);
%filtered_signal = filter(Num,1,mixed_signal);
%filtered_signal = my_fir(mixed_signal,Num);

subplot(4,1,1);
plot(t,mixed_signal);
title("mix");

subplot(4,1,2);
plot(t,filtered_signal);
title("filtered");

subplot(4,1,3);
plot(t,sin2);
title("sin2");


