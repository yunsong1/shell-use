%%
clear;
A=imread('.\PIC\Բ.png');    %����ͼƬ
thresh1 = graythresh(A);          %�Զ�ȷ����ֵ����ֵ
U1= im2bw(A,thresh1);            %��ͼ���ֵ��
figure(1)
U1 = imresize(U1,[100 100]);    %����ͼ��ķֱ���Ϊ100*100
[c,d]=size(U1);
imshow(U1);      %��ʾ��ֵ���ҷֱ���Ϊ100*100��ͼƬ
title('��ֵ���ҷֱ���Ϊ100*100��ͼƬ');
%% ϸ�������紦��ͼ��
m=zeros(c+2,d+2);   %Ϊ��ֹͼƬ��Ե���ش���������ͼƬ���������Ҷ�����һ��ȫΪ��ıߣ���ʱͼƬ��Ϊ102*102
x=zeros(c,d);
for i=2:c+1
      for j=2:d+1
          m(i,j)=U1(i-1,j-1);
      end
end
circlenumber=0;     %����ѭ���������ж�ϵͳ���ڵڼ��ε���������
judge=0;                %�ж�ϵͳ������־
while judge==0     %���õ�����ֱ��ϵͳ����������Ϊֹ
    circlenumber=circlenumber+1;
    for i=1:c,             %ϵͳ�������
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
    for i=2:c      %���
         for j=2:d  
             xn(i,j)=-1+2*y(i,j)+8*m(i,j)-m(i-1,j-1)-m(i,j-1)-m(i,j+1)-m(i-1,j)-m(i-1,j+1)-m(i+1,j)-m(i+1,j-1)-m(i+1,j+1);
         end
    end
    for i=1:c     %���ݾ������ж��Ƿ�����
        for j=1:d
            if abs(xn(i,j))<1 
                judge=0;
            else judge=1;
            end
        end
    end    
    for i=1:c  %����ϸ��״̬�����ϵͳ������������whileѭ�������������������
         for j=1:d
             x(i,j)=xn(i,j);
         end
    end
end
for i=1:c  %ϵͳȫ�����󣬸���ϸ����ǰ״̬����ڰ����� 
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
title('MATLAB������ͼ��');
%% ����mif�ļ�  ��ʼ��ROM
N = (c+2)*(d+2);                                            %���ݵĳ��ȣ����洢����ȡ�
word_len = 8;                                                 %ÿ����Ԫ��ռ�ݵ�λ�������Լ��趨
data = reshape(m', 1, N);% 1��N��                 %ֱ�Ӷ�������ߺ��ͼ�񣬼�102*102��ͼƬ
fid=fopen('gray_image.mif', 'w');                     %���ļ�
fprintf(fid, 'DEPTH=%d;\n', N);
fprintf(fid, 'WIDTH=%d;\n', word_len);
fprintf(fid, 'ADDRESS_RADIX = UNS;\n');         % ָ����ַΪʮ����
fprintf(fid, 'DATA_RADIX = HEX;\n');                % ָ������Ϊʮ������
fprintf(fid, 'CONTENT\t');
fprintf(fid, 'BEGIN\n');
for i = 0 : N-1
    fprintf(fid, '\t%d\t:\t%x;\n',i, data(i+1));
end
fprintf(fid, 'END;\n');                 %%�����β
fclose(fid);                            %%�ر��ļ�
%% ����altera-modelsim�ķ�����������ʾ
fid = fopen('.\CELL\simulation\modelsim\data_record.txt','r');  %��altera-modelsim����ʱ���ɵ������ĵ�
data = fscanf(fid,'%d');                                                              %��ʮ���Ƶ���ʽ���뵽data������
fclose(fid);
for i=1:1:9180
    dataa(i)=data(i);
end
b=reshape(dataa,[102,90]);                                                     %��Ϊaltera-modelsim���ɵ������ĵ���һά�ģ����Եõ���
figure(3);
imshow(b');
title('modelsim������ͼ��');