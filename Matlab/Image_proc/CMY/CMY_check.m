clear,clc;
% 读取RGB图像
rgbImage = imread('CMY_check.jpg'); % 替换为您的图像文件路径
red_test = rgbImage(:,:,1);
% 提取RGB通道分量，并转换为CMY分量
redChannel = 255- rgbImage(:,:,1);
greenChannel =255 - rgbImage(:,:,2);
blueChannel = 255 - rgbImage(:,:,3);

% 修改CMY分量（这里以增加为例，可以根据需求进行修改）
modifiedRedChannel = redChannel + 200; % R通道增加50
modifiedGreenChannel = greenChannel + 100; % G通道增加30
modifiedBlueChannel = blueChannel + 200; % B通道增加20

%转换回RGB
modifiedRedChannel_R = 255- modifiedRedChannel;
modifiedGreenChannel_G = 255 - modifiedGreenChannel;
modifiedBlueChannel_B = 255 - modifiedBlueChannel;

figure('Name', 'CMY');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 600]);

% 原图
subplot(2, 2, 1);
imshow(rgbImage);
title('原图');

% 修改后的R通道
subplot(2, 2, 2);
modifiedImageR = cat(3, modifiedRedChannel_R, rgbImage(:,:,2), rgbImage(:,:,3));
imshow(modifiedImageR);
title('增强C分量(青)');

% 修改后的G通道
subplot(2, 2, 3);
modifiedImageG = cat(3, rgbImage(:,:,1), modifiedGreenChannel_G, rgbImage(:,:,3));
imshow(modifiedImageG);
title('增强M分量(品红)');

% 修改后的B通道
 subplot(2, 2, 4);
 modifiedImageB = cat(3, rgbImage(:,:,1), rgbImage(:,:,2), modifiedBlueChannel_B);
 imshow(modifiedImageB);
 title('增强Y分量(黄)');

% 修改后的B通道
 %subplot(2, 2, 4);
 %modifiedImageB = cat(3, modifiedRedChannel_R, modifiedGreenChannel_G, modifiedBlueChannel_B);
 %imshow(modifiedImageB);
 %title('增强Y分量(黄)');