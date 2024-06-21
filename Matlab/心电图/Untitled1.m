clear,clc
% 定义信号参数
fs = 1000;     % 采样频率
t = 0:1/fs:1;  % 时间范围

% 生成心电图信号
f1 = 5;
f2 = 10;
f3 = 60;
f4 = 100;
f5 = 150;
f6 = 200;
f7 = 250;
f8 = 300;
f9 = 350;
f10 = 400;
f11 = 450;
f12 = 500;
f13 = 550;
f14 = 600;
f15 = 650;
f16 = 700;
f17 = 750;
f18 = 800;
f19 = 850;
f20 = 900;
ecg = 550*sin(2*pi*f1*t) + 5*sin(2*pi*f2*t) + 5*sin(2*pi*f3*t) + 5*sin(2*pi*f4*t) + 0.91*sin(2*pi*f5*t) + 51*sin(2*pi*f6*t) + 0.30*sin(2*pi*f7*t) + 0.55*sin(2*pi*f8*t) + 35*sin(2*pi*f9*t) + 0.35*sin(2*pi*f10*t)+0.5*sin(2*pi*f11*t) + 0.66*sin(2*pi*f12*t) + 0.5*sin(2*pi*f13*t) + 9*sin(2*pi*f14*t) + 0.5*sin(2*pi*f15*t)+ 5*sin(2*pi*f16*t) + 0.5*sin(2*pi*f17*t) + 0.6*sin(2*pi*f18*t) + 0.7*sin(2*pi*f19*t) + 0.6*sin(2*pi*f20*t);

% 定义滤波器参数
fc = 100;  % 截止频率

% 计算滤波器系数
[b, a] = butter(2, fc/(fs/2));

% 进行滤波
ecg_filtered = filter(b, a, ecg);

% 绘制结果
subplot(2,1,1);
plot(t, ecg);
title('原始心电图信号');
xlabel('时间 (s)');
ylabel('幅度');
grid on;

subplot(2,1,2);
plot(t, ecg_filtered);
title('滤波后心电图信号');
xlabel('时间 (s)');
ylabel('幅度');
grid on;