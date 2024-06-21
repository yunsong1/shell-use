clear,clc;
% 读取RGB图像
originalImage = imread('mosaic.jpg');

% 马赛克块的大小（可根据需要进行调整）
blockSize = 50;

% 调整原始图像的大小与马赛克后的图像一致
originalImage = imresize(originalImage, [550 550]);

% 获取图像的尺寸
[rows, cols, ~] = size(originalImage);

% 计算每个通道的马赛克处理
mosaicImage = originalImage;

% 对每个通道进行马赛克处理
for i = 1:3
    channel = originalImage(:,:,i);
    channelMosaic = blockproc(channel, [blockSize blockSize], @(blockStruct) repmat(mean(blockStruct.data(:)), [blockSize blockSize]));
    mosaicImage(:,:,i) = channelMosaic;
end

figure('Name', '马赛克');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);

% 显示原始图像
subplot(1, 2, 1);
imshow(originalImage);
title('原图');

% 显示马赛克后的图像
subplot(1, 2, 2);
imshow(mosaicImage);
title('马赛克后的图像');