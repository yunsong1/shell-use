% 读取 RGB 图片
rgbImage = imread('YUV_check.jpg');

% 将 RGB 转换为 YUV
yuvImage = rgb2ycbcr(rgbImage);

% 调整亮度（示例：将亮度调整为原来的3倍）
modifiedYuvImage = yuvImage;
modifiedYuvImage(:,:,1) = modifiedYuvImage(:,:,1) * 2.5;

% 调整 U 分量
modifiedYuvImageU = yuvImage;
modifiedYuvImageU(:,:,2) = modifiedYuvImageU(:,:,2) * 1.6;

% 调整 V 分量
modifiedYuvImageV = yuvImage;
modifiedYuvImageV(:,:,3) = modifiedYuvImageV(:,:,3) * 1.3;

% 将修改后的 YUV 转换为 RGB 图像
modifiedRgbImageY = ycbcr2rgb(modifiedYuvImage);
modifiedRgbImageU = ycbcr2rgb(modifiedYuvImageU);
modifiedRgbImageV = ycbcr2rgb(modifiedYuvImageV);

% 创建显示窗口并显示图像
figure('Name', 'YUV');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 600]);
% 第一行第一列：原始 RGB 图像
subplot(2, 2, 1);
imshow(rgbImage);
title('原图');

% 第一行第二列：调整亮度后的 RGB 图像
subplot(2, 2, 2);
imshow(modifiedRgbImageY);
title('增强 Y 分量(亮度)');

% 第二行第一列：调整 U 分量后的 RGB 图像
subplot(2, 2, 3);
imshow(modifiedRgbImageU);
title('增强 U 分量(色度蓝差)');

% 第二行第二列：调整 V 分量后的 RGB 图像
subplot(2, 2, 4);
imshow(modifiedRgbImageV);
title('增强 V 分量(色度红差)');

disp('操作完成！');