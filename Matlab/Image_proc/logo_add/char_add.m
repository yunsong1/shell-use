% 清除命令窗口和工作空间
clear;
clc;

% 读取 RGB 图像
rgbImage = imread('char_add.jpg');

% 读取 Logo 图像并调整大小
logoImage = imread('logo_add.jpg');
logoImage = imresize(logoImage, 0.2); % 调整为原来的一半大小

% 叠加 Logo
combinedImage = imfuse(rgbImage, logoImage, 'blend');

% 创建显示窗口
figure('Name', 'logo叠加');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 显示原始 RGB 图像
subplot(1, 2, 1);
imshow(rgbImage);
title('原图');

% 显示叠加后的图像
subplot(1, 2, 2);
imshow(combinedImage);
title('叠加后的图像');

disp('操作完成！');