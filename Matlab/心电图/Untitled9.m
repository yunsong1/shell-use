% 生成采样频率为100Hz，采样点数为200的信号
Fs = 100;  % 采样频率
t = 0:1/Fs:2-1/Fs;  % 时间向量，从0秒到2秒，每隔1/Fs秒采样一次
x = sin(2*pi*20*t) + 0.5*sin(2*pi*40*t);  % 生成信号，包含20Hz和40Hz的成分

% 叠加高斯白噪声
SNR = 10;  % 信噪比为10dB
Px = mean(abs(x).^2);  % 计算信号功率
Pn = Px/(10^(SNR/10));  % 计算噪声功率
n = sqrt(Pn)*randn(size(x));  % 生成高斯白噪声
x_noise = x + n;  % 叠加噪声

% 10Hz低通滤波
fc = 10;  % 截止频率为10Hz
[b,a] = butter(2,fc/(Fs/2),'low');  % 生成2阶巴特沃斯低通滤波器系数
y_noise = filtfilt(b,a,x_noise);  % 使用filtfilt函数对带噪声信号进行零相移滤波

% 绘制滤波前后的信号波形和频谱
figure;
subplot(2,2,1);
plot(t,x_noise);
title('带噪声信号');
xlabel('时间（秒）');
ylabel('幅度');
subplot(2,2,2);
plot(t,y_noise);
title('滤波后信号');
xlabel('时间（秒）');
ylabel('幅度');
subplot(2,2,3);
NFFT = length(x_noise);
f = Fs/2*linspace(0,1,NFFT/2+1);
X = fft(x_noise,NFFT)/NFFT;
Y = fft(y_noise,NFFT)/NFFT;
plot(f,2*abs(X(1:NFFT/2+1)));
hold on;
plot(f,2*abs(Y(1:NFFT/2+1)));
title('频谱');
xlabel('频率（Hz）');
ylabel('幅度');
legend('带噪声信号','滤波后信号');