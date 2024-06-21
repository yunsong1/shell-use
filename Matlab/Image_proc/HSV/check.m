% 读取 RGB 图片
rgbImage = imread('HSV_check.jpg');

% 将 RGB 转换为 HSV
hsvImage = rgb2hsv(rgbImage);

% 调整 H 分量
modifiedHsvImageH = hsvImage;
modifiedHsvImageH(:,:,1) = mod(modifiedHsvImageH(:,:,1) + 0.4, 1);

% 调整 S 分量
modifiedHsvImageS = hsvImage;
modifiedHsvImageS(:,:,2) = modifiedHsvImageS(:,:,2) + 0.524;

% 调整 V 分量
modifiedHsvImageV = hsvImage;
modifiedHsvImageV(:,:,3) = modifiedHsvImageV(:,:,3) + 0.57;

% 将修改后的 HSV 转换为 RGB 图像
modifiedRgbImageH = hsv2rgb(modifiedHsvImageH);
modifiedRgbImageS = hsv2rgb(modifiedHsvImageS);
modifiedRgbImageV = hsv2rgb(modifiedHsvImageV);

% 创建显示窗口并显示图像
figure('Name', 'HSV');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 600]);
% 第一行第一列：原始 RGB 图像
subplot(2, 2, 1);
imshow(rgbImage);
title('原图');

% 第一行第二列：调整 H 分量后的 RGB 图像
subplot(2, 2, 2);
imshow(modifiedRgbImageH);
title('增强 H 分量(色相)');

% 第二行第一列：调整 S 分量后的 RGB 图像
subplot(2, 2, 3);
imshow(modifiedRgbImageS);
title('增强 S 分量(饱和度)');

% 第二行第二列：调整 V 分量后的 RGB 图像
subplot(2, 2, 4);
imshow(modifiedRgbImageV);
title('增强 V 分量(明度)');

disp('操作完成！');