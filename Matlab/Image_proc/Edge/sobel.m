% 读取 RGB 图像
rgbImage = imread('sobel.jpg');

% 将 RGB 图像转换为灰度图像
grayImage = rgb2gray(rgbImage);

% 定义 Sobel 算子卷积核
sobelKernelX = [-1 0 1; -2 0 2; -1 0 1];
sobelKernelY = [-1 -2 -1; 0 0 0; 1 2 1];

% 定义 Scharr 算子卷积核
scharrKernelX = [-3 0 3; -10 0 10; -3 0 3];
scharrKernelY = [-3 -10 -3; 0 0 0; 3 10 3];

% 使用 Sobel 算子进行边缘检测
sobelImageX = imfilter(double(grayImage), sobelKernelX);
sobelImageY = imfilter(double(grayImage), sobelKernelY);
sobelImage = sqrt(sobelImageX.^2 + sobelImageY.^2);

% 使用 Scharr 算子进行边缘检测
scharrImageX = imfilter(double(grayImage), scharrKernelX);
scharrImageY = imfilter(double(grayImage), scharrKernelY);
scharrImage = sqrt(scharrImageX.^2 + scharrImageY.^2);

% 设定阈值
threshold = 96;

% 根据阈值进行二值化
sobelBinary = sobelImage < threshold;
scharrBinary = scharrImage < threshold;

% 创建显示窗口
figure('Name', '边缘检测');
set(gcf, 'MenuBar', 'none');
set(gcf, 'ToolBar', 'none');
set(gcf, 'Units', 'pixels');
set(gcf, 'Position', [100, 100, 1119, 300]);  % 调整窗口大小

% 显示灰度图像
subplot(1, 2, 1);
imshow(grayImage);
title('原图');

% 显示 Sobel 算子边缘检测结果
%subplot(1, 3, 2);
%imshow(sobelBinary);
%title('Sobel 算子边缘检测');

% 显示 Scharr 算子边缘检测结果
subplot(1, 2, 2);
imshow(scharrBinary);
title('Scharr 算子边缘检测');

disp('操作完成！');