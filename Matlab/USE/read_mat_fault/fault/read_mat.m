clear,clc;
% test_cell=load('100m.mat');

load('E:\Matlab 2019b\matlab_lvbo_test\100m');%必须要加载mat文件，产生val数组

N=10000;%采样点数
fs=1000;%采样频率

t=(0:N-1)/fs;%表示n个采样时间

data=zeros(1,N);%变量data_cell需要声明预分配
                         %否则大小会随着脚本中迭代次数而改变
for i=1:N
    data(i)=val(i);
end

% 产生高斯白噪声
noise_power = 2; % 噪声功率
noise = noise_power*randn(size(data)); % 产生高斯白噪声

signal=noise + data + 5*sin(2*pi*50*t) + 0.1*sin(2*pi*200*t);

figure(1);
subplot(331);
plot(t,signal);%绘制叠加信号
title('signal');
% subplot(334);
% plot(t,ecg);%绘制心电信号
% title('ecg');

fft_signal=fftshift(2*(abs(fft(signal,N)))/N);
subplot(332);
% fshift=(-N/2:N/2-1) * N/N;
fshift=(-N/2:N/2-1) * fs/N;%频谱的横轴
plot(fshift,fft_signal);%绘制心电信号的频谱
title('fft-signal');

       
%代码滤波
d = designfilt('lowpassiir', ...        % Response type 响应类型
       'PassbandFrequency',100, ...     % Frequency constraints 频率系数
       'StopbandFrequency',110, ...     %通带频率，阻带频率
       'PassbandRipple',0.5, ...          % Magnitude constraints 幅度系数 
       'StopbandAttenuation',80, ...    %通带波纹，阻带衰减
       'DesignMethod','butter', ...      % Design method 设计方法
       'MatchExactly','passband', ...   % Design method options 设计选项
       'SampleRate',1000);               % Sample rate 采样率
signal_lvbo = filter(d,signal); %利用滤波器对象d，进行低通滤波
% signal_lvbo = filtfilt(d,signal); 
% signal_lvbo = filter(Hd,signal); 
subplot(334);
plot(t,signal_lvbo);%绘制低通滤波后的心电信号
title('signal-lvbo');

fft_signal_lvbo=fftshift(2*(abs(fft(signal_lvbo,N)))/N);
subplot(335);
fshift=(-N/2:N/2-1) * fs/N;
plot(fshift,fft_signal_lvbo);%绘制低通滤波后的心电信号的频谱
title('fft-signal-lvbo');


bpFilt = designfilt('bandstopiir', ...       % Response type 响应类型
       'FilterOrder',4,...             %滤波器阶数
       'HalfPowerFrequency1',49, ...    % Frequency constraints 频率系数
       'HalfPowerFrequency2',51, ...    %半功率点(3db),
       'DesignMethod','butter', ...      % Design method 设计方法
       'SampleRate',1000);               % Sample rate 采样率
signal_lvbo_remove_50 = filter(bpFilt,signal_lvbo);%50hz带阻滤波
subplot(333);
plot(t,signal_lvbo_remove_50);%绘制低通滤波后的带阻50hz滤波后的心电信号
title('signal-lvbo-remove-50');

fft_signal_lvbo_remove_50=fftshift(2*(abs(fft(signal_lvbo_remove_50,N)))/N);
fshift=(-N/2:N/2-1) * fs/N;
subplot(336);
plot(fshift,fft_signal_lvbo_remove_50);%绘制低通滤波后的心电信号的带阻50hz滤波后的频谱
title('fft-signal-lvbo-remove-50');
   
fvtool(d)%绘制低通滤波的幅频特性曲线
fvtool(bpFilt)%绘制50hz带阻滤波的幅频特性曲线
filtord(d)%显示低通滤波的阶数
filtord(bpFilt)%显示50hz带阻滤波的阶数

fprintf("低通滤波的阶数:%d\n",filtord(d));
fprintf("50hz带阻滤波的阶数:%d\n",filtord(bpFilt));














