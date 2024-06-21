clear,clc
% 生成测试信号
fs = 1000; % 采样率
t = 0:1/fs:1-1/fs; % 时间轴
f1 = 50; % 基频
f2 = 200; % 第二个频率成分
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t); % 两个频率成分叠加

% 进行 FFT 运算
N = length(x); % 信号长度
test=fft(x, N);
X = abs(fft(x, N)); % 计算 FFT 并取模


% 计算频率轴
f = (0:N-1) * fs / N;

%{
% 绘制幅频特性图像
plot(f, X);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
%}


Fs = 8;     % 信号采样频率 8Hz
T = 1;      % 信号持续时长 2s
t = 0:1/Fs:T-1/Fs;
st = cos(2*pi*t);
figure
plot(t,st);
figure
Nfft_list = [8 16 32 64];
for i = 1 : length(Nfft_list)
    subplot(2,2,i);
    Nfft = Nfft_list(i);   % Nfft 点数 8
    f = [-Nfft/2:Nfft/2-1]/Nfft * Fs;
    stem(f, fftshift(abs(fft(st, Nfft)/Nfft*2)),"LineWidth",1.5);
    axis([-3.5 3.5 0 5.1]);
    xlabel("F/Hz");
    ylabel("Amplitude");
    title(strcat("Nfft = ", num2str(Nfft)));
end

