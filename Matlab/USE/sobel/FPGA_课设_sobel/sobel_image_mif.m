% Load the image
clc,clear,close all;
% 打开选择对话框
[filename,pathname] = uigetfile({'*.jpg';'*.png';'*.jpeg';'*.bmp';},'选择图片');
str = [pathname filename];
img = imread(str);

% Get the size of the image
[height, width, ~] = size(img);

% Open the MIF file for writing
fid = fopen('image.mif', 'w');

% Write the MIF file header
fprintf(fid, 'DEPTH = %d;\n', height * width);
fprintf(fid, 'WIDTH = 24;\n');
fprintf(fid, 'ADDRESS_RADIX = HEX;\n');
fprintf(fid, 'DATA_RADIX = HEX;\n');
fprintf(fid, 'CONTENT\n');
fprintf(fid, 'BEGIN\n');

%{m=height * width%交互输出
%cell=zeros(m,1);



% Loop through each pixel in the image and write its data to the MIF file
for y = 1:height
    for x = 1:width
        % Get the pixel data
        pixel = img(y, x, :);
        % Convert the pixel data to hexadecimal
        hex_data = dec2hex(pixel, 2);
        % Write the pixel data to the MIF file
        fprintf(fid, '%04X : %s%s%s;\n', (y-1)*width + x-1, hex_data(1,:), hex_data(2,:), hex_data(3,:));
    end
end

% Write the MIF file footer
fprintf(fid, 'END');%\请注意，上面的MATLAB程序假定输入图片为RGB格式（即每个像素由红、绿、蓝三个分量组成），并将其转换为24位深度的十六进制数据。如果您的输入图片格式不同，您需要根据情况进行修改。

%此外，该程序将像素数据保存为MIF文件。如果您需要将像素数据保存为其他格式，您需要相应地修改程序。

