clc,clear,close all;
str = 'C:\Users\付\Desktop\jierui.png';%直接指定图像文件的路径和名称


im = imread('E:\立创\子鼠.jpg');
figure(1);imshow(im);
g1=rgb2gray(im);

figure;imshow(g1);
BW=edge(g1,'sobel');
figure;imshow(BW);

[m,n] = size(g1);
d=g1;


for i = 2 : m-1
    for j = 2 : n-1
        Gx = (d(i+1,j-1) + 2*d(i+1,j) + d(i+1,j+1)) - (d(i-1,j-1) + 2*d(i-1,j) + d(i-1,j+1));
        Gy = (d(i-1,j-1) + 2*d(i,j-1) + d(i+1,j-1)) - (d(i-1,j+1) + 2*d(i,j+1) + d(i+1,j+1));
        %S1(i, j) = sqrt(Gx^2 + Gy^2);
        S2(i, j) = abs(Gx) + abs(Gy);
        if(S2(i,j) >= 30)
            F1(i,j)= 0xff;
        else
            F1(i,j)=0x00;
        end
    end
end
%figure;imshow(S1);

figure;imshow(F1);



