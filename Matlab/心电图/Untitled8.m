clear;clc;
Fs=1000;    % 采集频率
T=1/Fs;     % 采集时间间隔
N=2000;     % 采集信号的长度--采样点数
f1=33;      % 第一个余弦信号的频率
f2=200;     % 第二个余弦信号的频率
t=(0:1:N-1)*T;  % 定义整个采集时间点
t=t';           % 转置成列向量
 
y=1.2+2.7*cos(2*pi*f1*t+pi/4)+5*cos(2*pi*f2*t+pi/6);  % 时域信号

%% 绘制时域信号
figure
plot(t,y)
xlabel('时间')
ylabel('信号值')
title('时域信号')

%% fft变换
Y=fft(y);          % Y为fft变换结果，复数向量
Y=Y(1:N/2+1);      % 只看变换结果的一半即可
A=abs(Y);          % 复数的幅值（模）
f=(0:1:N/2)*Fs/N;  % 生成频率范围
f=f';              % 转置成列向量
 
%% 幅值修正
A_adj=zeros(N/2+1,1);
A_adj(1)=A(1)/N;        % 频率为0的位置除以N
A_adj(end)=A(end)/N;    % 频率为Fs/2的位置也除以N
A_adj(2:end-1)=2*A(2:end-1)/N;  %其余频率点乘以2/N
 
%% 绘制频率幅值图
figure
subplot(2,1,1)
plot(f,A_adj)
xlabel('频率 (Hz)')
ylabel('幅值 (修正后)')
title('FFT变换幅值图')
grid on
 
%% 绘制频谱相位图