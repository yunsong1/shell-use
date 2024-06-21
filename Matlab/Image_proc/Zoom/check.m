% 读取 RGB 图像
rgbImage = imread('zoom.jpg');



% 缩放比例
scaleFactor = 0.4;   % 缩小为原来的一半
enlargeFactor = 1.5; % 放大为原来的1.5倍

% 缩小后的图像尺寸
[h, w, ~] = size(rgbImage);
scaledSize = round([h * scaleFactor, w * scaleFactor]);
scaledImage = imresize(rgbImage, scaledSize, 'bilinear');

% 放大后的图像尺寸
enlargedSize = round([h * enlargeFactor, w * enlargeFactor]);
enlargedImage = imresize(rgbImage, enlargedSize, 'bilinear');

% 图像对比显示 - 放大后的图像 vs 原始 RGB 图像
figure('Name', '图像放大');
imshowpair(rgbImage, enlargedImage, 'montage');
title(sprintf('原图 (分辨率: %dx%d)      vs      放大后的图像 (分辨率: %dx%d)', h, w, enlargedSize(1), enlargedSize(2)));
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);  % 调整窗口大小

% 图像对比显示 - 缩小后的图像 vs 原始 RGB 图像
figure('Name', '图像缩小');
imshowpair(rgbImage, scaledImage, 'montage');
title(sprintf('原图 (分辨率: %dx%d)      vs      缩小后的图像 (分辨率: %dx%d)', h, w, scaledSize(1), scaledSize(2)));
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);  % 调整窗口大小

disp('操作完成！');