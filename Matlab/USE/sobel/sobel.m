clc,clear,close all;
% ��ѡ��Ի���
%�����û�ѡ��һ��ͼ���ļ�
%�����û�ѡ��һ��ͼ���ļ�
%[filename,pathname] = uigetfile({'*.jpg';'*.png';'*.jpeg';'*.bmp';},'ѡ��ͼƬ');
%str = [pathname filename];
str = 'C:\Users\��\Desktop\jierui.png';%ֱ��ָ��ͼ���ļ���·��������

im = imread(str);
 
hsi = rgb2hsi(im);
subplot(1,4,1);
imshow(hsi);title('hsiͼ��');
 
H = hsi(:,:,1);
S = hsi(:,:,2);
I = hsi(:,:,3);
 
% ��ֵ�˲�
i = medfilt2(I,[5,5]);
subplot(1,4,2);
imshow(im);title('ԭͼ��');
 
% ����һ��Ԥ�����2D�˲���
m = fspecial('sobel'); % Ӧ��sobel����ͼ���Ե���
% 2D�˲���
j = filter2(m,i); % sobel�����˲���
 BW = edge(i,'sobel');
subplot(1,4,3);imshow(BW);
title('sobel����ͼ���Ե���');
 
t = max(j,0);
subplot(1,4,4);imshow(t);
title('max���sobel����ͼ��');



