clc,clear,close all;
%str = 'C:\Users\付\Desktop\新建文件夹\jierui.png';%直接指定图像文件的路径和名称


im = imread('E:\立创\子鼠.jpg');
figure(1);imshow(im);
title('image');
g1=rgb2gray(im);
filename='gray.mif';% MIF 文件名
qqq = fopen(filename, 'w'); % 创建 MIF 文件
depth=int32(600)*int32(431);
fprintf(qqq, 'DEPTH = %d;\n', depth);
fprintf(qqq, 'WIDTH = 8;\n');
fprintf(qqq, 'ADDRESS_RADIX = UNS;\n');
fprintf(qqq, 'DATA_RADIX = UNS;\n');
fprintf(qqq, 'CONTENT BEGIN\n');
gray_cell_zhuanzhi=transpose(g1);%转置函数
gray_cell=reshape(gray_cell_zhuanzhi,1,depth);
%gray_cell(1)=3;
for i = 1:depth
    fprintf(qqq, '%d:%d;\n', i-1, gray_cell(i));
end

%{
gray_cell=zeros(1,600*431);
for i=1:600
    for j=1:431
        postion=postion+1;
        gray_cell(i,j)=g1(i,j);
        fprintf(qqq, '%d:%d;\n', postion, gray_cell(i,j));
    end
end
%}
       
fprintf(qqq, 'END;\n');
fclose(qqq); % 关闭文件

figure;imshow(g1);
title('gray');
BW_sobel=edge(g1,'sobel');
BW_canny=edge(g1,'canny');
figure
imshow(BW_sobel);
title('soble');
figure
imshow(BW_canny);
title('canny');

[m,n] = size(g1);
d=g1;

for i = 2 : m-1
    for j = 2 : n-1
        Gx = (d(i+1,j-1) + 2*d(i+1,j) + d(i+1,j+1)) - (d(i-1,j-1) + 2*d(i-1,j) + d(i-1,j+1));
        Gy = (d(i-1,j-1) + 2*d(i,j-1) + d(i+1,j-1)) - (d(i-1,j+1) + 2*d(i,j+1) + d(i+1,j+1));
        %S1(i, j) = sqrt(Gx^2 + Gy^2);
        S2(i, j) = abs(Gx) + abs(Gy);
        if(S2(i,j) >= 30)
            BW_MY(i,j)= 0xff;
        else
            BW_MY(i,j)=0x00;
        end
    end
end
%figure;imshow(S1);

figure;imshow(BW_MY);
title('myself');
disp(depth);



