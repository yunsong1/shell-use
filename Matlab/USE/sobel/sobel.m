clc,clear,close all;
% 打开选择对话框
%允许用户选择一个图像文件
%允许用户选择一个图像文件
%[filename,pathname] = uigetfile({'*.jpg';'*.png';'*.jpeg';'*.bmp';},'选择图片');
%str = [pathname filename];
str = 'C:\Users\付\Desktop\jierui.png';%直接指定图像文件的路径和名称

im = imread(str);
 
hsi = rgb2hsi(im);
subplot(1,4,1);
imshow(hsi);title('hsi图像');
 
H = hsi(:,:,1);
S = hsi(:,:,2);
I = hsi(:,:,3);
 
% 中值滤波
i = medfilt2(I,[5,5]);
subplot(1,4,2);
imshow(im);title('原图像');
 
% 创建一个预定义的2D滤波器
m = fspecial('sobel'); % 应用sobel算子图像边缘检测
% 2D滤波器
j = filter2(m,i); % sobel算子滤波锐化
 BW = edge(i,'sobel');
subplot(1,4,3);imshow(BW);
title('sobel算子图像边缘检测');
 
t = max(j,0);
subplot(1,4,4);imshow(t);
title('max后的sobel算子图像');



