% 清除命令窗口和工作空间
clear;
clc;

% 读取 RGB 图像
rgbImage = imread('char_add.jpg');

% 叠加字符
textOverlay = insertText(rgbImage, [10 10], 'Hello, World!', 'FontSize', 50, 'TextColor', 'black', 'BoxOpacity', 0);

% 创建显示窗口
figure('Name', '字符叠加');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 显示原始 RGB 图像
subplot(1, 2, 1);
imshow(rgbImage);
title('原图');

% 显示叠加字符后的图像
subplot(1, 2, 2);
imshow(textOverlay);
title('叠加字符后的图像');

disp('操作完成！');