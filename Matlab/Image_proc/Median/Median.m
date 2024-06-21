% 清除命令窗口和工作空间
clear;
clc;

% 读取 RGB 图像
rgbImage = imread('Median.jpg');

% 将图像转换为灰度图像
grayImage = rgb2gray(rgbImage);

% 添加椒盐噪声
saltPepperImage = imnoise(grayImage, 'salt & pepper', 0.2);

% 中值滤波
filteredImage = medfilt2(saltPepperImage);

% 创建显示窗口
figure('Name', 'Median');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);


% 显示添加椒盐噪声后的图像
subplot(1, 2, 1);
imshow(saltPepperImage);
title('添加椒盐噪声后的图像');

% 显示中值滤波去噪后的图像
subplot(1, 2, 2);
imshow(filteredImage);
title('中值滤波去噪后的图像');

figure;

% 显示原始 RGB 图像
subplot(1, 3, 1);
imshow(grayImage);
title('原图');
disp('操作完成！');