clc;
clear;
Fs = 5000; % 采样率（以Hz为单位）
duration = 0.1; % 信号时长（以秒为单位）
t = (0:1/Fs:duration-1/Fs); % 时间向量
freq_1 = 500;freq_2 = 50;% 频率
sin1 = 100*sin(2*pi*freq_1*t);
sin2 = 128*sin(2*pi*freq_2*t);
mixed_signal = sin1 + sin2;% 混合

file_id1 = fopen("data.txt","w");
fprintf(file_id1, '%d\n', floor(mixed_signal'));
fclose(file_id1);

% 设计FIR滤波器
order = 40; % 滤波器阶数
cutoff_freq = 100; % 截止频率（以Hz为单位）
normalized_cutoff = cutoff_freq / (Fs/2); % 归一化的截止频率
b = fir1(order, normalized_cutoff, 'low'); % 设计低通滤波器系数

% 对混合信号进行滤波
filtered_signal = filter(b, 1, mixed_signal); % 应用滤波器

subplot(4,1,1);
plot(t,mixed_signal);
title("mix");

subplot(4,1,2);
plot(t,filtered_signal);
title("filtered");

subplot(4,1,3);
plot(t,sin2);
title("sin2");


