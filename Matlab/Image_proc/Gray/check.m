% 读取 RGB 图片
rgbImage = imread('Lenna.jpg');

% 将 RGB 图片转换为灰度图像
grayImage = rgb2gray(rgbImage);

% 创建显示窗口并显示图像
figure('Name', 'Gray');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);
% 第一行第一列：原始 RGB 图像
subplot(1, 2, 1);
imshow(rgbImage);
title('原图');

% 第一行第二列：灰度图像
subplot(1, 2, 2);
imshow(grayImage);
title('灰度图像');

disp('操作完成！');