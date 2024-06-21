clear,clc
% 读取数据文件
file_id = fopen('sine_wave.txt', 'r');
data_cell1 = textscan(file_id, '%s', 'Delimiter', '\n');
fclose(file_id);

% 处理数据
data_str = data_cell1{1};
data_str = strtrim(data_str);
data_array = cellfun(@(x) strsplit(x, ':'), data_str, 'UniformOutput', false);

% 打印数组大小
fprintf('数组大小为：%d x %d\n', size(data_array));

data_cell = zeros(1, 256);  % 生成一个 1 行 256 列的全一矩阵

for i=1:256
 data_cell(i) = str2double(regexprep(data_array{i+8,1}{1,2}, '\D', ''));
end   

volatge_cell=zeros(1,256);
for i=1:256
 volatge_cell(i)=data_cell(i)*5/256;
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

%a=1;
%fprintf("%d\n",a);
%str=sprintf("大家好\n");
%disp(str);
%disp(volatge_cell);

volatge_max=max(volatge_cell);
volatge_min=min(volatge_cell);
fprintf("离散值_最大值是%.4f\n",volatge_max);

%{
figure
a = 1:1:6;  %横坐标
b = [8.0 9.0 10.0 15.0 35.0 40.0]; %纵坐标
%画平滑曲线的方法
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:), 'g');
%}

sample_num = 8000;
pingfang_cell = zeros(1,sample_num-1);
qiuhe=0;
for i=1:sample_num-1
    position=floor(i/32)+1;
    %(1)别工程值--被2.5减去的话计算应为1.6773，理论为1.674
    %pingfang_cell(i)=(2.5-volatge_cell(position))^2;%(1)
    %(2)别工程值--没有被2.5减去的话计算应为1.1969，理论为1.3789
    pingfang_cell(i)=volatge_cell(position)^2;%(2)
end
for i=1:sample_num-1
    qiuhe=qiuhe+pingfang_cell(i);
end
youxiaozhi=sqrt(qiuhe/(sample_num-1));
fprintf("采样点_8000_离散值_有效值是%.8f\n",youxiaozhi);

% 离散正弦波参数
A = 1.95; % 振幅
f = 1; % 频率
phi = 0; % 相位

% 采样频率和时间长度
fs = 128000-1; % 采样频率为1000Hz
t =0:1/fs:1; % 时间长度为1秒

% 生成离散正弦波信号
x = A*sin(2*pi*f*t + phi);

% 计算离散正弦波信号的均方根值
rms_x = rms(x);

% 输出结果
fprintf('128000_采样点_标准正弦波离散信号的有效值为：%.4f\n', rms_x);





















