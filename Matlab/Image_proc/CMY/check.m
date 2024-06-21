% 读取RGB图像
rgbImage = imread('CMY_check.jpg'); % 替换为您的图像文件路径

% 转换为CMY图像
cmyImage = 1 - double(rgbImage) / 255;

% 分别提高C、M、Y分量，其他分量保持不变
enhancedC = cat(3, cmyImage(:,:,1) - 0.6, cmyImage(:,:,2), cmyImage(:,:,3));
enhancedM = cat(3, cmyImage(:,:,1), cmyImage(:,:,2) - 0.6, cmyImage(:,:,3));
enhancedY = cat(3, cmyImage(:,:,1), cmyImage(:,:,2), cmyImage(:,:,3) - 0.6);

% 创建显示窗口并显示图像
figure('Name', 'CMY');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 600]);

% 显示图像
subplot(2, 2, 1);
imshow(rgbImage);
title('原图');

subplot(2, 2, 2);
imshow(enhancedC);
title('降低C分量(青)');

subplot(2, 2, 3);
imshow(enhancedM);
title('降低M分量(洋红)');

subplot(2, 2, 4);
imshow(enhancedY);
title('降低Y分量(黄)');