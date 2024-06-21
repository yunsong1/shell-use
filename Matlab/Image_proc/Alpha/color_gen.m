% 创建彩条图像
colorBarImage = zeros(720, 768, 3, 'uint8'); % 创建空白图像，大小为720x768像素，3通道（RGB）

% 定义彩条颜色（十六进制）
colors = ['#FF0000'; % 红色
          '#FFA500'; % 橙色
          '#FFFF00'; % 黄色
          '#00FF00'; % 绿色
          '#0000FF'; % 蓝色
          '#4B0082'; % 靛蓝色
          '#EE82EE'; % 紫色
          '#FFFFFF']; % 白色

% 绘制彩条
barWidth = size(colorBarImage, 2) / size(colors, 1); % 每个彩条的宽度
for i = 1:size(colors, 1)
    color = sscanf(colors(i,:), '#%2x%2x%2x', [1 3]); % 将十六进制颜色转换为RGB值
    colorBarImage(:, (i-1)*barWidth+1:i*barWidth, :) = repmat(reshape(color, [1 1 3]), [size(colorBarImage, 1) barWidth 1]);
end

% 显示彩条图像
imshow(colorBarImage);
title('彩条图像');

% 保存彩条图像
imwrite(colorBarImage, 'color_bar_image.jpg');
disp('彩条图像已保存！');