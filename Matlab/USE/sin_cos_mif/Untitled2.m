% 生成正弦波的 MIF 文件并同时显示出波形
fs = 256; % 采样率
duration = 10; % 持续时间
depth = fs * duration; % 采样点数
filename1 = 'sin1.mif'; % 第一个 MIF 文件名
filename2 = 'sin2.mif'; % 第二个 MIF 文件名
maxVolt1 = 5; % 第一个正弦波的最大电压
minVolt1 = 3; % 第一个正弦波的最小电压
maxVolt2 = 4; % 第二个正弦波的最大电压
minVolt2 = 2; % 第二个正弦波的最小电压
amplitude1 = (maxVolt1 - minVolt1) / 2; % 第一个正弦波的振幅
offset1 = (maxVolt1 + minVolt1) / 2; % 第一个正弦波的偏移量
amplitude2 = (maxVolt2 - minVolt2) / 2; % 第二个正弦波的振幅
offset2 = (maxVolt2 + minVolt2) / 2; % 第二个正弦波的偏移量

% 创建第一个正弦波的 MIF 文件
qqq1 = fopen(filename1, 'w'); % 创建 MIF 文件
fprintf(qqq1, 'DEPTH = %d;\n', depth);
fprintf(qqq1, 'WIDTH = 8;\n');
fprintf(qqq1, 'ADDRESS_RADIX = HEX;\n');
fprintf(qqq1, 'DATA_RADIX = HEX;\n');
fprintf(qqq1, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round(amplitude1 * sin(2 * pi * (i - 1) / fs) + offset1);
    fprintf(qqq1, '%02X:%02X;\n', i - 1, value);
end
fprintf(qqq1, 'END;\n');
fclose(qqq1); % 关闭文件

% 创建第二个正弦波的 MIF 文件
qqq2 = fopen(filename2, 'w'); % 创建 MIF 文件
fprintf(qqq2, 'DEPTH = %d;\n', depth);
fprintf(qqq2, 'WIDTH = 8;\n');
fprintf(qqq2, 'ADDRESS_RADIX = HEX;\n');
fprintf(qqq2, 'DATA_RADIX = HEX;\n');
fprintf(qqq2, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round(amplitude2 * sin(2 * pi * (i - 1) / fs) + offset2);
    fprintf(qqq2, '%02X:%02X;\n', i - 1, value);
end
fprintf(qqq2, 'END;\n');
fclose(qqq2); % 关闭文件

% 显示两个正弦波的波形图
t = linspace(0, duration, depth);
y1 = amplitude1 * sin(2 * pi * t) + offset1;
y2 = amplitude2 * sin(2 * pi * t) + offset2;
subplot(2, 1, 1);
plot(t, y1);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Sine Wave 1');
subplot(2, 1, 2);
plot(t, y2);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Sine Wave 2');