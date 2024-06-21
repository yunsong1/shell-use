% 清除命令窗口和工作空间
clear;
clc;

% 读取 RGB 图像
rgbImage = imread('rotate.jpg');

% 指定旋转角度（以度为单位）
angle = 39; % 顺时针旋转 30 度

% 进行图像旋转
rotatedImage = imrotate(rgbImage, angle, 'crop');

% 创建显示窗口
figure('Name', '图像旋转');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 显示原始 RGB 图像
subplot(1, 2, 1);
imshow(rgbImage);
title('原图');

% 显示旋转后的图像
subplot(1, 2, 2);
imshow(rotatedImage);
title('旋转后的图像');

disp('操作完成！');