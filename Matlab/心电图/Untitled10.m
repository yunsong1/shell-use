% ����һ������ź�
x = randn(1, 100);

% �����źŵ�DFT
X = fft(x);

% ��DFT������б任��λ
Y = fftshift(X);

% ���Ʊ任��λǰ���DFT���
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