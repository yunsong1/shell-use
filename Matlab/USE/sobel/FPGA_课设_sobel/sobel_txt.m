clear,clc
%调出仿真保存的txt文件
fid = fopen('E:\quartus\EDA_PROJECT\project_3\Shifit_register\资料\data_record.txt','r');
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
title('FPGA边缘检测图像');
    
    
    
    
    