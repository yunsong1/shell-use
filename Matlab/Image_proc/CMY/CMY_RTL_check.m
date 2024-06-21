clear,clc;
% 读取RGB图像

% 输入一个 565 格式的十进制像素数据
pixel = 35182;

c_variable = 200;
m_variable = 0;
y_variable = 0;

rgbImage = imread('CMY_check.jpg'); % 替换为您的图像文件路径
red_test = rgbImage(:,:,1);
c_test = 255- red_test;

if (c_test + c_variable) > 255
    c_out_test = 255;
else 
    c_out_test = c_test + c_variable;
end
r_test = 255 - c_out_test;

% 提取RGB通道分量，并转换为CMY分量
redChannel = 255- rgbImage(:,:,1);

% 修改CMY分量（这里以增加为例，可以根据需求进行修改）
modifiedRedChannel = redChannel + 200; % R通道增加50

%转换回RGB
modifiedRedChannel_R = 255- modifiedRedChannel;

subplot(1, 2, 1);
modifiedImageR_my = cat(3, r_test, rgbImage(:,:,2), rgbImage(:,:,3));
imshow(modifiedImageR_my);
title('my');

% 修改后的R通道
subplot(1, 2, 2);
modifiedImageR = cat(3, modifiedRedChannel_R, rgbImage(:,:,2), rgbImage(:,:,3));
imshow(modifiedImageR);
title('ku');

% 比较两个矩阵是否相等
if isequal(modifiedRedChannel_R, r_test)
    disp('两个矩阵相等');
else
    disp('两个矩阵不相等');
end

% 提取 RGB 分量
pix_R = bitshift(bitand(pixel, 63488), -11)*8;
pix_G = bitshift(bitand(pixel, 2016), -5)*4;
pix_B = bitand(pixel, 31)*8;



c = 255- pix_R;
m = 255- pix_G;
y = 255- pix_B;

if (c + c_variable) > 255
    c_out = 255;
else 
    c_out = c + c_variable;
end

if (m + m_variable) > 255
    m_out = 255;
else 
    m_out = m + m_variable;
end

if (y + y_variable) > 255
    y_out = 255;
else 
    y_out = y + y_variable;
end

R = 255 - c_out;
G = 255 - m_out;
B = 255 - y_out;


R_int = floor(R/8);
G_int = floor(G/4);
B_int = floor(B/8);
cmy_pix_data = R_int*2048 + G_int*32 + B_int;

disp([c,m,y]);
disp([c_out,m_out,y_out]);
disp([pix_R,pix_G,pix_B]);
disp([R,G,B]);
disp(cmy_pix_data);




