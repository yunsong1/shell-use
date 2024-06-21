% 生成一个随机信号
x = randn(1, 100);

% 计算信号的DFT
X = fft(x);

% 对DFT结果进行变换移位
Y = fftshift(X);

% 绘制变换移位前后的DFT结果
f = linspace(-0.5, 0.5, length(X));
subplot(2, 1, 1);
plot(f, abs(X));
title('DFT of x');
xlabel('Normalized frequency');
ylabel('|X(f)|');
subplot(2, 1, 2);
plot(f, abs(Y));
title('FFTshift(DFT of x)');
xlabel('Normalized frequency');
ylabel('|Y(f)|');