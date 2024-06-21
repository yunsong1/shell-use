clear;
clc;

% 读取 RGB 图像
rgbImage = imread('binary.jpg');

% 创建显示窗口
figure('Name', '二值化');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 将图像转换为灰度图像
grayImage = rgb2gray(rgbImage);

binaryImage = region_bin_auto(grayImage,5,0.99);

% 显示灰度图像
subplot(1, 2, 1);
imshow(grayImage);
title('原图');

% 显示二值化后的图像
subplot(1, 2, 2);
imshow(binaryImage);
title('二值化后的图像');

disp('操作完成！');