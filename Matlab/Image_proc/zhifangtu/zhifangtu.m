clear;
clc;

% 读取 RGB 图像
rgbImage = imread('Gamma.jpg');
%grayImage = imread('zhifangtu.tif');
% 创建显示窗口
figure('Name', '直方图均衡');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 将图像转换为灰度图像
grayImage = rgb2gray(rgbImage);

% 进行直方图均衡
equaImage = histeq(grayImage);

% 显示灰度图像
subplot(1, 2, 1);
imshow(grayImage);
title('原图');

% 显示直方图均衡后的图像
subplot(1, 2, 2);
imshow(equaImage);
title('直方图均衡后的图像');

disp('操作完成！');