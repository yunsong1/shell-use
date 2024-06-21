% 清除命令窗口和工作空间
clear;
clc;

% 读取 RGB 图像
rgbImage = imread('shift.jpg');

% 指定平移量
deltaX = 180; % 在 x 方向上的平移量
deltaY = 60; % 在 y 方向上的平移量

% 进行图像平移
translatedImage = imtranslate(rgbImage, [deltaX, deltaY]);

% 创建显示窗口
figure('Name', '图像平移');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 显示原始 RGB 图像
subplot(1, 2, 1);
imshow(rgbImage);
title('原图');

% 显示平移后的图像
subplot(1, 2, 2);
imshow(translatedImage);
title('平移后的图像');

disp('操作完成！');