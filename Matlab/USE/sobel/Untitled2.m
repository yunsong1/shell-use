% 生成正弦波信号
fs = 1000;                %采样频率
t = 0:1/fs:1-1/fs;        %时间序列
f1 = 50;                  %信号频率
x = sin(2*pi*f1*t);       %正弦波信号

% 添加谐波成分
f2 = 100;                 %第二个频率成分
h2 = 0.2;                 %第二个谐波幅度
x = x + h2*sin(2*pi*f2*t); %添加第二个谐波成分

% 计算信号的FFT
N = length(x);            %下面是一个MATLAB程序示例，可以生成一个有一定THD失真度的正弦波，并显示该信号的FFT图像和THD值：

%matlab
% 生成正弦波信号
fs = 1000;                %采样频率
t = 0:1/fs:1-1/fs;        %时间序列
f1 = 50;                  %信号频率
x = sin(2*pi*f1*t);       %正弦波信号

% 添加谐波成分
f2 = 100;                 %第二个频率成分
h2 = 0.2;                 %第二个谐波幅度
x = x + h2*sin(2*pi*f2*t); %添加第二个谐波成分

% 计算信号的FFT
N = length(x);            %信号长度
X = fft(x);               %快速傅里叶变换
f = (0:N-1)*(fs/N);       %计算频率坐标
amplitude = abs(X)/N;     %幅度谱
amplitude(1) = 0;         %去除直流分量（不计入THD）
fundamental_power = amplitude(f1) ^ 2;                  %基频功率
harmonic_power = sum(amplitude(2:end).^2); %总谐波功率
THD = sqrt(harmonic_power/fundamental_power); %THD

% 显示结果
figure;
subplot(2,1,1);
plot(t,x);
xlabel('时间 (s)');
ylabel('幅值');
title('正弦波时域图像');

subplot(2,1,2);
plot(f,amplitude);
xlabel('频率 (Hz)');
ylabel('幅值');
title('正弦波频域图像');

fprintf('THD = %f%%\n', THD*100);


