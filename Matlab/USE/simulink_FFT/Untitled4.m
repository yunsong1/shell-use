% 定义信号的参数
f = 50; % 三角函数的频率
t = 0:0.001:1; % 时间范围，步长为0.001秒
A = 1; % 三角函数的振幅

% 计算三角函数
x = A*sin(2*pi*f*t); % 三角函数

% 计算傅里叶变换
N = length(x); % 采样点数
X = fft(x)/N; % 傅里叶变换，并除以采样点数得到幅度

% 计算频率范围
fs = 1/(t(2)-t(1)); % 采样率
f = (0:N-1)/N*fs; % 频率范围

% 绘制信号的时域图和频域图
figure;
subplot(2,1,1);
plot(t, x);
xlabel('时间 (s)');
ylabel('振幅');
title('信号的时域图');

subplot(2,1,2);
plot(f, abs(X));
xlabel('频率 (Hz)');
ylabel('幅度');
title('信号的频域图');

% 找到频率最大值的位置
[~, idx] = max(abs(X));
max_freq = f(idx);

% 显示频率最大值
disp(['三角函数的频率为：', num2str(max_freq), ' Hz']);