clear,clc;
% 定义电阻和电容的值
R = 1000; % 电阻值 1000 欧姆
C = 1e-6; % 电容值 1 微法

% 计算 RC 并联电路的阻抗
f = logspace(1,6,100); % 生成 100 个对数均匀分布的频率点
Z = R./(1 + 1j*2*pi*f*R*C); % 计算 RC 并联电路的阻抗

% 绘制阻抗模和阻抗角的频率特性
figure;
subplot(2,1,1);
semilogx(f,(abs(Z)),'LineWidth',2);
grid on;
xlabel('频率 (Hz)');
ylabel('阻抗模 (dB)');
title('RC 并联电路的阻抗模和阻抗角的频率特性');
subplot(2,1,2);
semilogx(f,angle(Z)*180/pi,'LineWidth',2);
grid on;
xlabel('频率 (Hz)');
ylabel('阻抗角 (°)');