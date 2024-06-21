%%
clear;
A=imread('.\PIC\圆.png');    %读入图片
thresh1 = graythresh(A);          %自动确定二值化阈值
U1= im2bw(A,thresh1);            %对图像二值化
figure(1)
U1 = imresize(U1,[100 100]);    %调整图像的分辨率为100*100
[c,d]=size(U1);
imshow(U1);      %显示二值化且分辨率为100*100的图片
title('二值化且分辨率为100*100的图片');
%% 细胞神经网络处理图像
m=zeros(c+2,d+2);   %为防止图片边缘像素处理不到，在图片的上下左右都扩充一条全为零的边，此时图片变为102*102
x=zeros(c,d);
for i=2:c+1
      for j=2:d+1
          m(i,j)=U1(i-1,j-1);
      end
end
circlenumber=0;     %定义循环次数，判断系统是在第几次迭代后收敛
judge=0;                %判断系统收敛标志
while judge==0     %设置迭代，直到系统迭代到收敛为止
    circlenumber=circlenumber+1;
    for i=1:c,             %系统输出方程
        for j=1:d,     
            if x(i,j)>=1
                f(i,j)=1;
            elseif x(i,j)<=-1
                 f(i,j)=-1;
            else f(i,j)=x(i,j);
            end
        y(i,j)=f(i,j);    
        end
    end
    for i=2:c      %卷积
         for j=2:d  
             xn(i,j)=-1+2*y(i,j)+8*m(i,j)-m(i-1,j-1)-m(i,j-1)-m(i,j+1)-m(i-1,j)-m(i-1,j+1)-m(i+1,j)-m(i+1,j-1)-m(i+1,j+1);
         end
    end
    for i=1:c     %根据卷积结果判断是否收敛
        for j=1:d
            if abs(xn(i,j))<1 
                judge=0;
            else judge=1;
            end
        end
    end    
    for i=1:c  %更新细胞状态，如果系统收敛，则跳出while循环，否则继续迭代处理
         for j=1:d
             x(i,j)=xn(i,j);
         end
    end
end
for i=1:c  %系统全收敛后，根据细胞当前状态输出黑白像素 
     for j=1:d
         if x(i,j)>=1
             a(i,j)=1;
         elseif x(i,j)<=-1
             a(i,j)=0;
         end
     end
end
figure(2);
imshow(a);    
title('MATLAB仿真后的图像');
%% 生成mif文件  初始化ROM
N = (c+2)*(d+2);                                            %数据的长度，即存储器深度。
word_len = 8;                                                 %每个单元的占据的位数，需自己设定
data = reshape(m', 1, N);% 1行N列                 %直接读入扩充边后的图像，即102*102的图片
fid=fopen('gray_image.mif', 'w');                     %打开文件
fprintf(fid, 'DEPTH=%d;\n', N);
fprintf(fid, 'WIDTH=%d;\n', word_len);
fprintf(fid, 'ADDRESS_RADIX = UNS;\n');         % 指定地址为十进制
fprintf(fid, 'DATA_RADIX = HEX;\n');                % 指定数据为十六进制
fprintf(fid, 'CONTENT\t');
fprintf(fid, 'BEGIN\n');
for i = 0 : N-1
    fprintf(fid, '\t%d\t:\t%x;\n',i, data(i+1));
end
fprintf(fid, 'END;\n');                 %%输出结尾
fclose(fid);                            %%关闭文件
%% 调出altera-modelsim的仿真结果进行显示
fid = fopen('.\CELL\simulation\modelsim\data_record.txt','r');  %打开altera-modelsim仿真时生成的数据文档
data = fscanf(fid,'%d');                                                              %以十进制的形式读入到data数组中
fclose(fid);
for i=1:1:9180
    dataa(i)=data(i);
end
b=reshape(dataa,[102,90]);                                                     %因为altera-modelsim生成的数据文档是一维的，所以得调整
figure(3);
imshow(b');
title('modelsim仿真后的图像');