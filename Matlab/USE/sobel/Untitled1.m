% 生成正弦波信号
fs = 1000;                %采样频率
t = 0:1/fs:1-1/fs;        %时间序列
f1 = 50;                  %信号频率
x = sin(2*pi*f1*t);       %正弦波信号

% 计算信号的FFT
N = length(x);            %信号长度
X = fft(x);               %快速傅里叶变换
f = (0:N-1)*(fs/N);       %计算频率坐标
amplitude = abs(X)/N;     %幅度谱
phase = angle(X);         %相位谱

% 计算失真度
y = ifft(amplitude.*exp(1j*phase));  %合成信号
distortion = norm(x-y)/norm(x);      %计算失真度

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

fprintf('失真度 = %f\n', distortion);