    % 低通滤波器代码
    % 定义信号
    fs = 1000; % 采样频率
    t = 0:1/fs:1-1/fs; % 时间范围为0到1秒
    f1 = 50; % 基频频率为50Hz的正弦波
    f2 = 120; % 第二个频率为120Hz的正弦波
    x = sin(2*pi*f1*t) + sin(2*pi*f2*t); % 合成两个正弦波信号
    % 定义低通滤波器参数
    fc = 80; % 截止频率为80Hz，即只保留80Hz以下的信号成分
    order = 6; % 滤波器阶数
    % 创建低通滤波器对象并进行滤波操作
    [b,a] = butter(order, fc/(fs/2)); % 设计Butterworth滤波器系数
    y = filter(b, a, x); % 对原始信号进行低通滤波操作
    % 绘制原始信号和滤波后的信号图形以及相应频谱图形（可选）
    figure;
    subplot(211);
    plot(t, x);
    title('原始信号');
    xlabel('时间 (秒)');
    ylabel('幅度');
    ylim([-3,3]);
    grid on;
    subplot(212);
    plot(t, y);
    title('低通滤波后的信号');
    xlabel('时间 (秒)');
    ylabel('幅度');
    ylim([-3,3]);
    grid on;
    figure;
    freqz(b,a); % 绘制滤波器的频率响应图形