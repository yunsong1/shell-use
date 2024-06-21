% 读取 RGB 图像
rgbImage = imread('laplacian.jpg');

% 将图像转换为灰度图像
grayImage = rgb2gray(rgbImage);

% 创建显示窗口
figure('Name', '锐化');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 模糊处理
gaussianImage = imgaussfilt(grayImage, 5); % 使用高斯滤波器，标准差为3
subplot(1, 2, 1);
imshow(gaussianImage);
title('原图');

% Laplacian锐化
sharpenedStrength = 3.5; % 修改锐化强度，可以根据需要进行调整
laplacianImage = imsharpen(grayImage, 'Amount', sharpenedStrength);
subplot(1, 2, 2);
imshow(laplacianImage);
title('Laplacian锐化图');

disp('操作完成！');