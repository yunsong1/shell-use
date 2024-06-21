% 读取 RGB 图像
rgbImage = imread('Gauss.jpg');

% 将图像转换为灰度图像
grayImage = rgb2gray(rgbImage);

% 创建显示窗口
figure('Name', 'Gauss');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 添加高斯噪声
noiseStdDev = 0.1; % 噪声标准差
noisyImage = imnoise(grayImage, 'gaussian', 0, noiseStdDev);


% 第二列：添加高斯噪声后的图像
subplot(1, 2, 1);
imshow(noisyImage);
title(sprintf('添加高斯噪声后的图像'));

% 高斯滤波
filterStdDev = 3; % 滤波标准差
kernelSize = [15, 15]; % 核大小
filteredImage = imgaussfilt(noisyImage, filterStdDev, 'FilterSize', kernelSize);

% 第三列：高斯滤波后的图像
subplot(1, 2, 2);
imshow(filteredImage);
title(sprintf('高斯滤波后的图像'));

figure;
% 第一列：原始灰度图像
subplot(1, 3, 1);
imshow(grayImage);
title('原图');


disp('操作完成！');