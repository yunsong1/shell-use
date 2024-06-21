% 设置信号的采样频率和采样时间
Fs = 1000;           % 采样频率 (Hz)
T = 1/Fs;            % 采样时间 (s)

% 设置信号的时间轴
t = 0:T:1-T;         % 时间轴 (s)

% 生成方波信号
f = 10;              % 方波频率 (Hz)
x = square(2*pi*f*t);% 方波信号

% 计算 FFT
N = length(x);       % 信号的长度
X = fft(x);          % 傅里叶变换
X_mag = abs(X);      % 模值
X_phase = angle(X);  % 相位

% 计算频谱
f = Fs*(0:N/2-1)/N;  % 频率轴
X_mag = X_mag(1:N/2);            % 只取前一半的模值
X_phase = X_phase(1:N/2);% 只取前一半的相位

% 绘制信号时域波形
subplot(2,1,1);
plot(t, x);
title('方波的时域波形');
xlabel('时间 (s)');
ylabel('幅值');
ylim([-1.5, 1.5]); % 设置纵轴范围

% 绘制信号频域波形
subplot(2,1,2);
plot(f, X_mag);
title('方波的频域波形');
xlabel('频率 (Hz)');
ylabel('模值');
ylim([0, max(X_mag)*1.2]); % 设置纵轴范围

% 验证奈奎斯特定理
f_Nyquist = Fs/2;             % 奈奎斯特频率
f_mag_max = max(f(X_mag~=0)); % 最大频率
if f_mag_max <= f_Nyquist
    disp('FFT 奈奎斯特定理验证成功！');
else
    disp('FFT 奈奎斯特定理验证失败！');
end