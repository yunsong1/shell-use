clear;
clc;

% 读取 RGB 图像
grayImage = imread('Gamma.jpg');
%grayImage = imread('zhifangtu.tif');
%grayImage = imread('zhifangtu.jpg');
% 创建显示窗口
figure('Name', 'Gamma');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 将图像转换为灰度图像
%grayImage = rgb2gray(rgbImage);

% 进行 gamma 变化
gammaValue = 2.2; % gamma 值
gammaCorrectedImage = imadjust(grayImage, [], [], gammaValue);

% 显示灰度图像
subplot(1, 2, 1);
imshow(grayImage);
title('原图');

% 显示 gamma 变化后的图像
subplot(1, 2, 2);
imshow(gammaCorrectedImage);
title('Gamma 变化后的图像');

disp('操作完成！');