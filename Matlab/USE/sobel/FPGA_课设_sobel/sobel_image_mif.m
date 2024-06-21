% Load the image
clc,clear,close all;
% ��ѡ��Ի���
[filename,pathname] = uigetfile({'*.jpg';'*.png';'*.jpeg';'*.bmp';},'ѡ��ͼƬ');
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

%{m=height * width%�������
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
fprintf(fid, 'END');%\��ע�⣬�����MATLAB����ٶ�����ͼƬΪRGB��ʽ����ÿ�������ɺ졢�̡�������������ɣ���������ת��Ϊ24λ��ȵ�ʮ���������ݡ������������ͼƬ��ʽ��ͬ������Ҫ������������޸ġ�

%���⣬�ó����������ݱ���ΪMIF�ļ����������Ҫ���������ݱ���Ϊ������ʽ������Ҫ��Ӧ���޸ĳ���

