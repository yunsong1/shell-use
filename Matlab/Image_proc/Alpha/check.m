clear;
clc;

% 图片A和B的路径
pathA = 'E:\工作&学习&资料\2023FPGA创新设计竞赛\matlab\Alpha\color_bar_image.jpg';
pathB = 'E:\工作&学习&资料\2023FPGA创新设计竞赛\matlab\Alpha\Lenna.jpg';

% 读取图片A和B
imageA = imread(pathA);
imageB = imread(pathB);
[h, w, ~] = size(imageB);
scaledSize = [h,w];
% 将图片A和B调整为相同的大小
imageA = imresize(imageA, scaledSize, 'bilinear');

alpha = 0.5;
outputImage = alpha*imageA + (1-alpha)*imageB;

% 显示一行三列的图片，第一个显示A，第二个显示B，第三个显示叠加之后的结果
figure('Name', 'α通道融合');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);



subplot(1, 2, 1);
imshow(imageB);
title('Image');

subplot(1, 2, 2);
imshow(outputImage);
title('Alpha Blended');

figure;
subplot(1, 3, 1);
imshow(imageA);
title('Image A');