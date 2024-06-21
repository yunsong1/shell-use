% 生成一些数据
x = [1, 2, 3, 4, 5];
y = [10, 20, 30, 40, 50];

% 将数据组合成一个矩阵
data = [x' y'];

% 指定文件名和路径
filename = 'data.csv';
filepath = 'E:\Matlab 2019b\simulink_CSV';

% 将数据写入 CSV 文件
csvwrite(fullfile(filepath, filename), data);