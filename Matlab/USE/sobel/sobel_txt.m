clear,clc
%�������汣���txt�ļ�
fid = fopen('E:\quartus\EDA_PROJECT\project_3\Shifit_register\����\data_record.txt','r');
data =fscanf(fid,'%d');
fclose(fid);
sobel_cell=zeros(1,258600);
for i=1:1:258600
    sobel_cell(i)= data(i);
end
b=reshape(sobel_cell,[431,600]);
a=transpose(b);
figure;
imshow(a);
title('FPGA��Ե���ͼ��');
    
    
    
    
    