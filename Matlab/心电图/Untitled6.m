% 生成FFT频谱图
% 定义信号和采样频率
Fs = 1000; % 采样频率为1000Hz
t = 0:1/Fs:1-1/Fs; % 定义时间向量
f1 = 50; % 定义信号频率为50Hz
x = 0.7*sin(2*pi*f1*t)+0.3*sin(2*pi*150*t); % 定义信号

% 进行FFT变换
N = length(x); % 信号长度
X = fft(x); % 进行FFT变换
P2 = abs(X/N); % 取模并除以N得到双侧频谱幅值
P1 = P2(1:N/2+1); % 截取正频率部分
P1(2:end-1) = 2*P1(2:end-1); % 套用Nyquist定理，乘以2得到单侧频谱幅值
f = Fs*(0:(N/2))/N; % 计算频率向量

% 绘制FFT频谱图
figure;
plot(f,P1)
title('FFT频谱图')
xlabel('频率 (Hz)')
ylabel('幅值')