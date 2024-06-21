% 生成信号
fs = 1000; % 采样率
duration = 1; % 信号时长（秒）
t = 0:1/fs:duration-1/fs; % 时间轴
f = 10; % 信号频率
signal = sin(2*pi*f*t); % 产生正弦信号

% 产生高斯白噪声
noise_power = 3; % 噪声功率
noise = noise_power*randn(size(signal)); % 产生高斯白噪声

% 叠加噪声
signal_with_noise = signal + noise; % 叠加高斯白噪声

% 傅里叶分析
N = length(signal_with_noise); % 信号长度
Y = fft(signal_with_noise)/N; % 计算信号的傅里叶变换，并归一化结果
f = (0:N-1)*(fs/N); % 计算频率轴
amplitude = 2*abs(Y(1:N/2)); % 计算信号的振幅谱
phase = angle(Y(1:N/2)); % 计算信号的相位谱

% 绘制信号和叠加噪声后的信号
figure;
subplot(2,1,1);
plot(t, signal, 'b', t, signal_with_noise, 'r');
xlabel('时间（秒）');
ylabel('振幅');
title('信号和叠加噪声后的信号');
legend('原始信号', '叠加噪声后的信号');

%{
绘制信号的振幅谱
subplot(2,1,2);
plot(f(1:N/2), amplitude);
xlabel('频率（Hz）');
ylabel('振幅');
title('信号的振幅谱');
%}

% 生成理想数字低通滤波器
fc = 2;  % 截止频率
fs = 100;  % 采样率
N = 101;  % 滤波器阶数（奇数）
n = -(N-1)/2:(N-1)/2;  % 时间轴
h = 2 * fc / fs * sinc(2 * fc / fs * n);  % 理想低通滤波器系数

% 绘制滤波器幅频响应和相频响应
[H, w] = freqz(h, 1, 1024, fs);  % 计算滤波器的频率响应
%{
figure;
subplot(2, 1, 1);
plot(w, abs(H));  % 幅频响应
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Filter Frequency Response');
subplot(2, 1, 2);
plot(w, angle(H));  % 相频响应
xlabel('Frequency (Hz)');
ylabel('Phase');
title('Filter Phase Response');
%}