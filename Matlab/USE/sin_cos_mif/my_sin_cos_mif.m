clear,clc
% 生成正弦波的 MIF 文件并同时显示出波形
fs =256; % 采样率
%duration = 20; % 持续时间
duration = 1; % 持续时间
depth = fs * duration; % 采样点数
filename = 'sin.mif'; % MIF 文件名
filenam_cos = 'cos.mif'; % MIF 文件名
maxVolt = 4.5; % 最大电压
minVolt = 3; % 最小电压
amplitude = (maxVolt - minVolt) / 2; % 振幅
offset = (maxVolt + minVolt) / 2; % 偏移量
cell_sin = zeros(1, depth); % 创建一个长度为 depth 的数组，用于存储波形数据
cell_cos = zeros(1, depth); % 创建一个长度为 depth 的数组，用于存储波形数据
qqq = fopen(filename, 'w'); % 创建 MIF 文件
fprintf(qqq, 'DEPTH = %d;\n', depth);
fprintf(qqq, 'WIDTH = 8;\n');
fprintf(qqq, 'ADDRESS_RADIX = UNS;\n');
fprintf(qqq, 'DATA_RADIX = UNS;\n');
fprintf(qqq, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round((amplitude * sin(2 * pi * (i - 1) / fs) + offset)/5*256);
    cell_sin(i) = value;
    fprintf(qqq, '%d:%d;\n', i - 1, value);
end
fprintf(qqq, 'END;\n');
fclose(qqq); % 关闭文件

qqq_cos = fopen(filenam_cos, 'w'); % 创建 MIF 文件
fprintf(qqq_cos, 'DEPTH = %d;\n', depth);
fprintf(qqq_cos, 'WIDTH = 8;\n');
fprintf(qqq_cos, 'ADDRESS_RADIX = UNS;\n');
fprintf(qqq_cos, 'DATA_RADIX = UNS;\n');
fprintf(qqq_cos, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round((amplitude * cos(2 * pi * (i - 1) / fs) + offset)/5*256);
    cell_cos(i) = value;
    fprintf(qqq_cos, '%d:%d;\n', i - 1, value);
end
fprintf(qqq_cos, 'END;\n');
fclose(qqq_cos); % 关闭文件

% 显示正余弦波的波形图
t = linspace(0, duration, depth);
y1 = amplitude * sin(2 * pi * t) + offset;
y2 = amplitude * cos(2 * pi * t) + offset;


%{
subplot(2,1,1);
plot(t, y1);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('sin Wave1');

subplot(2,1,2);
plot(t, y2);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('cos Wave1');
%}
figure
%set(gcf, 'Color', 'k')
hold on;%开启在同一幅图上绘制多个绘图曲线或图形
plot(t,y1,'-r','DisplayName','sin');%带有颜色，标签
plot(t,y2,'-k','DisplayName','cos');%带有颜色，标签
hold off;
legend;
xlabel('Time (s)');
ylabel('Voltage (V)');
title('sin Wave1');

figure%显示正余弦的数字电压值，利用一个数组保存数字电压值
hold on
%plot(t,cell_sin, 'o', 'Color','-r','DisplayName','sin');%带有颜色，标签
plot(t,cell_sin, 'Color','r','DisplayName','sin');%带有颜色，标签
plot(t,cell_cos, 'Color','k','DisplayName','cos');%带有颜色，标签
hold off
legend;
y3=max(y1)*0.707;
%fprintf('length is:%d\n',depth);%可以输出带变量的字符串
disp(depth);%可以直接打印变量，不能输出带变量的字符串
%disp(cell_sin);


volatge_cell=zeros(1,256);
for i=1:256
 volatge_cell(i)=cell_sin(i)*5/256;
end 

data_num=256;%256个mif数据
period=1;%显示时长为1

t=0:period/data_num:1-period/data_num;

figure
%subplot(1,2,1);
plot(t,volatge_cell,'-');
xlabel('time(s)');
ylabel('voltage(V)');
title('sin');

figure
smooth_volatge_cell = smooth(volatge_cell, 10); 
% 使用smooth函数对数据进行平滑处理，第二个参数为平滑窗口大小
%subplot(1,2,2);
plot(t, 2.5-smooth_volatge_cell);

xlabel('time(s)');
ylabel('voltage(V)');
title('sin');

volatge_max=max(volatge_cell);
volatge_min=min(volatge_cell);
fprintf("离散值_最大值是%.4f\n",volatge_max);


sample_num = 8000;
pingfang_cell = zeros(1,sample_num-1);
qiuhe=0;
for i=1:sample_num-1
    position=floor(i/32)+1;
    %(1)别工程值--被2.5减去的话计算应为1.6773，理论为1.674
    %pingfang_cell(i)=(2.5-volatge_cell(position))^2;%(1)
    %(2)别工程值--没有被2.5减去的话计算应为1.1969，理论为1.3789
    pingfang_cell(i)=(volatge_cell(position))^2;%(2)
end
for i=1:sample_num-1
    qiuhe=qiuhe+pingfang_cell(i);
end
youxiaozhi=sqrt(qiuhe/(sample_num-1));
fprintf("采样点_8000_离散值_有效值是%.8f\n",youxiaozhi);
