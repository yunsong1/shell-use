clc;

% 读取 .mat 文件
% data_in = load('E:\spyder\python\project\data_in.mat');
% 从结构体中提取数据
% pt_data = data_in.data_in;
% pt_data = squeeze(pt_data);
% pt_data = double(pt_data);

% data = load('E:\spyder\python\project\image_check.mat');
% image = data.img;
% image = double(image);
% image = image./255;
% pt_data = image;

% 读取图片
% image = imread('E:\spyder\python\project\test\0\2106.png'); 
image = imread('E:\spyder\python\project\test\7\223.png');
% 调整图片大小为 32x32
image = imresize(image, [32 32]);
image = double(image);
% image = image./255;
pt_data = image;

% pt_data = randi([0, 255], 32, 32);

pt_data_mif = transpose(reshape(pt_data.', 1, []));

fid = fopen('pt_data_data.mif', 'w');
% 写入MIF文件的头部信息
depth = length(pt_data_mif);
width = 9;
fprintf(fid, 'WIDTH=%d;\n', width);
fprintf(fid, 'DEPTH=%d;\n', depth);
fprintf(fid, 'ADDRESS_RADIX=DEC;\n');
fprintf(fid, 'DATA_RADIX=BIN;\n');
fprintf(fid, 'CONTENT BEGIN\n');
test_binaryData = zeros(1024,1);
% 将一维数组逐行写入文件
for i = 1:depth
    binaryData = dec2bin(pt_data_mif(i), width);
    fprintf(fid, '%d : %s;\n', i-1, binaryData);
end

fprintf(fid, 'END;\n');
fclose(fid);


load('E:\spyder\python\project\weights.mat');
conv1_weight = permute(getfield(weights, 'conv1.weight'), [3, 4, 2, 1]);
conv1_bias   =    reshape(getfield(weights, 'conv1.bias'), [1, 1, 6]);
conv2_weight = permute(getfield(weights, 'conv2.weight'), [3, 4, 2, 1]);
conv2_bias   =    reshape(getfield(weights, 'conv2.bias'), [1, 1, 16]);
fc1_weight   = transpose(getfield(weights, 'fc1.weight'));
fc1_bias     =    (getfield(weights, 'fc1.bias'));
fc2_weight   = transpose(getfield(weights, 'fc2.weight'));
fc2_bias     = (getfield(weights, 'fc2.bias'));
fc3_weight   = transpose(getfield(weights, 'fc3.weight'));
fc3_bias     = (getfield(weights, 'fc3.bias'));


% 8bit量化
conv1_weight = floor(conv1_weight * 255) ;
conv1_bias = floor(conv1_bias * 255) ;%8位和16位对结果误差不大
% conv1_bias = floor(conv1_bias * 255* 256) ;
conv2_weight = floor(conv2_weight * 255) ;
conv2_bias = floor(conv2_bias * 255* 256) ;
fc1_weight = floor(fc1_weight * 255) ;
fc1_bias = floor(fc1_bias * 255* 256) ;
fc2_weight = floor(fc2_weight * 255) ;
fc2_bias = floor(fc2_bias * 255* 256) ;
fc3_weight = floor(fc3_weight * 255) ;
fc3_bias = floor(fc3_bias * 255* 256) ;

% 打开文本文件进行写入
fileID = fopen('conv1_weight_data.txt', 'w');

% 将数组的元素逐个写入文本文件（以有符号二进制格式）
for channel = 1:size(conv1_weight, 4)
    for row = 1:size(conv1_weight, 1)
        for col = 1:size(conv1_weight, 2)
            % 将有符号整数转换为二进制字符串
            x_in = conv1_weight(row, col, 1, channel);
            N_bits = 9;
            if(x_in>=0)
                bin_x = dec2bin(x_in,N_bits);
            else 
                % 求补码
                bin_x = dec2bin(2^N_bits + x_in, N_bits);
            end          
            fprintf(fileID, '%s\n', bin_x);
            % fprintf(fileID, '%d\n', x_in);
        end
    end
    % fprintf(fileID, '\n');
end

% 打开文本文件进行写入
fileID = fopen('conv1_bias_data.txt', 'w');
for channel = 1:size(conv1_bias, 3)
    x_in = conv1_bias(1, 1, channel);
    N_bits = 9;
    if(x_in>=0)
        bin_x = dec2bin(x_in,N_bits);
    else 
        bin_x = dec2bin(2^N_bits + x_in, N_bits);
    end          
    fprintf(fileID, '%s\n', bin_x);
    % fprintf(fileID, '%d\n', x_in);
end


test_conv1_weight = conv1_weight(:,:,1,1) ;
% test_conv1_weight = permute(conv1_weight,[2, 1, 3, 4]);
% test_conv1_weight = reshape(test_conv1_weight, 1, []);%正确的顺序
% 关闭文件
fclose(fileID);

% 创建一个包含 6 个卷积结果的高维数组
convResults = zeros(28, 28, 6);
windowSize = 5;  % 窗口大小为 5x5
%6通道的卷积
for i = 1:6
    % 获取当前卷积核
    convKernel_in = conv1_weight(:, :, :, i);
    for m = 1 : size(pt_data, 1) - windowSize + 1
        for n = 1 : size(pt_data, 2) - windowSize + 1
            window = pt_data(m : m + windowSize - 1, n : n + windowSize - 1);
            convResult = sum(sum(window .* convKernel_in));  % 进行卷积操作
            convResults(m, n ,i) = convResult + conv1_bias(i);  % 将卷积结果的中心值放入输出矩阵
        end
    end

end

test_convResults = convResults;

% Relu函数
convResults = max(convResults, 0);

% 创建一个大小为 (14, 14, 6) 的数组，用于保存池化结果
poolingResult = zeros(14, 14, 6);

% 分别对每个维度进行最大池化操作
for i = 1:6
    % 获取当前输入数据
    inputDataSingle = convResults(:, :, i);
    
    % 使用最大池化操作对当前输入数据进行处理
    for row = 1:14
        for col = 1:14
            % 计算池化窗口的起始位置
            startRow = (row - 1) * 2 + 1;
            startCol = (col - 1) * 2 + 1;
            
            % 提取池化窗口内的数据
            windowData = inputDataSingle(startRow:startRow+1, startCol:startCol+1);
            
            % 对池化窗口内的数据取最大值
            poolingResult(row, col, i) = max(windowData(:));
        end
    end
end

test_poolingResult = poolingResult;

poolingResult = poolingResult/256;

% 创建一个大小为 10*10*16 的高维数组
minResults = zeros(10, 10);
finalResults = zeros(10, 10, 16);
convResult_pp = zeros(10, 10);
% 对每个 14x14 数组进行 16 次卷积，并将结果相加后加上偏置，保存在高维数组中
for i = 1:16
    for j = 1:6   
        % 获取当前输入数据
        inputDataSingle = poolingResult(:, :, j);

        % 获取当前卷积核
        convKernel = conv2_weight(:, :, j, i);

        for m = 1 : size(inputDataSingle, 1) - windowSize + 1
            for n = 1 : size(inputDataSingle, 2) - windowSize + 1
                window = inputDataSingle(m : m + windowSize - 1, n : n + windowSize - 1);
                convResult_pp(m, n)= sum(sum(window .* convKernel));  % 进行卷积操作 
                 % 将卷积结果的中心值放入输出矩阵
            end
        end

        % 将卷积结果保存在高维数组中
        minResults = minResults + convResult_pp;
    end
    % 加上偏置
    finalResults(:, :, i) = minResults + conv2_bias(:, :, i);
    minResults = zeros(size(minResults));

end

% Relu函数
finalResults = max(finalResults, 0);

% 创建一个大小为 (5, 5, 16) 的数组，用于保存池化结果
poolingResult_out = zeros(5, 5, 16);

% 分别对每个维度进行最大池化操作
for i = 1:16
    % 获取当前输入数据
    inputDataSingle = finalResults(:, :, i);
    
    % 使用最大池化操作对当前输入数据进行处理
    for row = 1:5
        for col = 1:5
            % 计算池化窗口的起始位置
            startRow = (row - 1) * 2 + 1;
            startCol = (col - 1) * 2 + 1;
            
            % 提取池化窗口内的数据
            windowData = inputDataSingle(startRow:startRow+1, startCol:startCol+1);
            
            % 对池化窗口内的数据取最大值
            poolingResult_out(row, col, i) = max(windowData(:));
        end
    end
end

poolingResult_out = poolingResult_out/256;

% 将数组展平为一维数组
data_flattened = permute(poolingResult_out,[2, 1, 3]);
data_flattened = transpose(data_flattened(:));

% 全连接
fc1_out_data = (data_flattened * fc1_weight) + fc1_bias;
% Relu函数
fc1_out_data = max(fc1_out_data, 0);

fc1_out_data = fc1_out_data/256;

% 全连接
fc2_out_data = (fc1_out_data * fc2_weight) + fc2_bias;
% Relu函数
fc2_out_data = max(fc2_out_data, 0);

fc2_out_data = fc2_out_data/256;

% 全连接
fc3_out_data = (fc2_out_data * fc3_weight) + fc3_bias;

fc3_out_data = fc3_out_data/256/256;
% fc3_out_data = fc3_out_data/256;

% softmax
fc3_out_data_exp = exp(fc3_out_data);
fc3_out_data_pp = fc3_out_data_exp ./ sum(fc3_out_data_exp);

% 找到最大元素的索引
[~, index] = max(fc3_out_data_pp);

% 打印最大元素的索引
disp(transpose(fc3_out_data_pp));
disp(index-1);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % 读取 .mat 文件
% % data = load('E:\spyder\python\project\x_conv1.mat');
% % data = load('E:\spyder\python\project\x_conv1_relu.mat');
% % data = load('E:\spyder\python\project\x_conv1_relu_max.mat');
% % data = load('E:\spyder\python\project\x_conv2.mat');
% % data = load('E:\spyder\python\project\x_conv2_relu.mat');
% % data = load('E:\spyder\python\project\x_conv2_relu_max.mat');
% % data = load('E:\spyder\python\project\x_fc1_relu.mat');
% % data = load('E:\spyder\python\project\x_fc2_relu.mat');
% data = load('E:\spyder\python\project\x_fc3.mat');
% % 从结构体中提取数据
% data = data.x_fc3;
% cnn_data = fc3_out_data;
% 
% % 使用 transpose 函数进行维度转换
% % check_data = permute(data,[3, 4, 2, 1]);
% check_data = data;
% 
% % 比较
% % test_cnn_data = (cnn_data(:,:,1));
% % test_check_data = check_data(:,:,1);
% test_cnn_data = cnn_data;
% test_check_data = check_data;
% 
% % 测试
% show_conv1_weight = conv1_weight(:,:,1,1);
% show_pt_data = pt_data(8:12,17:21);
% show_conv = sum(sum(show_conv1_weight .* show_pt_data)) + conv1_bias(1);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% number = 2;%//1---6//
% weight_bias_number = number;%//1---6//
% 
% 
% data = importdata('E:\spyder\FPGA\src\TXT\conv1_data_check.txt');
% conv1_data = floor((test_convResults(:,:,weight_bias_number)));
% fpga_conv1_data = transpose(reshape(data, 28, 28));
% % 比较两个数组是否相等
% if isequal(conv1_data, fpga_conv1_data)
%     disp('卷积层结果相同');
% else
%     disp('卷积层结果不同');
% end
% 
% data = importdata('E:\spyder\FPGA\src\TXT\pool_data_check.txt');
% pool_data = floor((test_poolingResult(:,:,weight_bias_number)));
% fpga_pool_data = transpose(reshape(data, 14, 14));
% % 比较两个数组是否相等
% if isequal(pool_data, fpga_pool_data)
%     disp('池化层结果相同');
% else
%     disp('池化层结果不同');
% end








