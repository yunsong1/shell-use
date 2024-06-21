% 生成模拟的心电图
fs = 1000;              % 采样率
t = 0:1/fs:10-1/fs;     % 时间轴
f1 = 0.5;               % 低通截止频率
f2 = 50;                % 高通截止频率
ecg = 0.5*sin(2*pi*1*t);% 生成模拟心电图

% 设计滤波器
[b, a] = butter(2, [f1 f2]/(fs/2));  % 二阶巴特沃斯滤波器

% 滤波
filtered_ecg = filtfilt(b, a, ecg);

% 绘制心电图和滤波后的心电图
figure;
subplot(2, 1, 1);
plot(t, ecg);
title('模拟心电图');
xlabel('Time (s)');
ylabel('Amplitude (mV)');
subplot(2, 1, 2);
plot(t, filtered_ecg);
title('滤波后的心电图');
xlabel('Time (s)');
ylabel('Amplitude (mV)');

