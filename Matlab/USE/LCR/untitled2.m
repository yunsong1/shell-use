clear,clc;
% 定义电感、电容和电阻的值
L = 1e-6; % 电感值 1 毫亨
C = 1e-6; % 电容值 1 微法(实际电容和电感内部有电阻)
R = 100; % 电阻值 1000 欧姆

% 计算 LC 并联电路的阻抗
f = logspace(1,12,100); % 生成 100 个对数均匀分布的频率点
%10e1到10e12
Z = 1j*2*pi*f*L./(1 - (2*pi*f).^2*L*C - 1j*2*pi*f*R*C); % 计算 LC 并联电路的阻抗

% 绘制阻抗模和阻抗角的频率特性
figure;
subplot(2,1,1);
semilogx(f,abs(Z),'LineWidth',2);
grid on;
xlabel('频率 (Hz)');
ylabel('阻抗模 (\Omega)');
title('LC 并联电路的阻抗模和阻抗角的频率特性');
subplot(2,1,2);
semilogx(f,angle(Z)*180/pi,'LineWidth',2);
grid on;
xlabel('频率 (Hz)');
ylabel('阻抗角 (°)');