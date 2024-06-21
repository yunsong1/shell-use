clear;
clc;

% 读取 RGB 图像
rgbImage = imread('binary.jpg');

% 创建显示窗口
figure('Name', '腐蚀膨胀');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 将 RGB 图像转换为灰度图像
grayImage = rgb2gray(rgbImage);

binaryImage = region_bin_auto(grayImage,5,0.99);

% 初始化腐蚀和膨胀的强度
erosionStrength = 2;
dilationStrength = 6;

% 腐蚀操作
seErode = strel('disk', erosionStrength); % 设定腐蚀结构元素
erodedImage = imerode(binaryImage, seErode);

% 膨胀操作
seDilate = strel('disk', dilationStrength); % 设定膨胀结构元素
dilatedImage = imdilate(erodedImage, seDilate);

% 定义膨胀的结构元素
%se = strel('square', 3); %
% 进行膨胀操作
%dilatedImage = imdilate(binaryImage, se);




% 显示腐蚀后的图像
subplot(1, 2, 1);
imshow(erodedImage);
title('腐蚀');

% 显示膨胀后的图像
subplot(1, 2, 2);
imshow(dilatedImage);
title('膨胀');

% 创建显示窗口
figure('Name', '腐蚀膨胀');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);
% 显示二值图像
subplot(1, 3, 1);
imshow(binaryImage);
title('原图');

disp('操作完成！');