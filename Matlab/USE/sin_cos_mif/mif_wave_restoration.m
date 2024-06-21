clear,clc
% ��ȡ�����ļ�
file_id = fopen('sine_wave.txt', 'r');
data_cell1 = textscan(file_id, '%s', 'Delimiter', '\n');
fclose(file_id);

% ��������
data_str = data_cell1{1};
data_str = strtrim(data_str);
data_array = cellfun(@(x) strsplit(x, ':'), data_str, 'UniformOutput', false);

% ��ӡ�����С
fprintf('�����СΪ��%d x %d\n', size(data_array));

data_cell = zeros(1, 256);  % ����һ�� 1 �� 256 �е�ȫһ����

for i=1:256
 data_cell(i) = str2double(regexprep(data_array{i+8,1}{1,2}, '\D', ''));
end   

volatge_cell=zeros(1,256);
for i=1:256
 volatge_cell(i)=data_cell(i)*5/256;
end 

data_num=256;%256��mif����
period=1;%��ʾʱ��Ϊ1

t=0:period/data_num:1-period/data_num;

figure
%subplot(1,2,1);
plot(t,volatge_cell,'-');
xlabel('time(s)');
ylabel('voltage(V)');
title('sin');

figure
smooth_volatge_cell = smooth(volatge_cell, 10); 
% ʹ��smooth���������ݽ���ƽ�������ڶ�������Ϊƽ�����ڴ�С
%subplot(1,2,2);
plot(t, 2.5-smooth_volatge_cell);

xlabel('time(s)');
ylabel('voltage(V)');
title('sin');

%a=1;
%fprintf("%d\n",a);
%str=sprintf("��Һ�\n");
%disp(str);
%disp(volatge_cell);

volatge_max=max(volatge_cell);
volatge_min=min(volatge_cell);
fprintf("��ɢֵ_���ֵ��%.4f\n",volatge_max);

%{
figure
a = 1:1:6;  %������
b = [8.0 9.0 10.0 15.0 35.0 40.0]; %������
%��ƽ�����ߵķ���
values = spcrv([[a(1) a a(end)];[b(1) b b(end)]],3);
plot(values(1,:),values(2,:), 'g');
%}

sample_num = 8000;
pingfang_cell = zeros(1,sample_num-1);
qiuhe=0;
for i=1:sample_num-1
    position=floor(i/32)+1;
    %(1)�𹤳�ֵ--��2.5��ȥ�Ļ�����ӦΪ1.6773������Ϊ1.674
    %pingfang_cell(i)=(2.5-volatge_cell(position))^2;%(1)
    %(2)�𹤳�ֵ--û�б�2.5��ȥ�Ļ�����ӦΪ1.1969������Ϊ1.3789
    pingfang_cell(i)=volatge_cell(position)^2;%(2)
end
for i=1:sample_num-1
    qiuhe=qiuhe+pingfang_cell(i);
end
youxiaozhi=sqrt(qiuhe/(sample_num-1));
fprintf("������_8000_��ɢֵ_��Чֵ��%.8f\n",youxiaozhi);

% ��ɢ���Ҳ�����
A = 1.95; % ���
f = 1; % Ƶ��
phi = 0; % ��λ

% ����Ƶ�ʺ�ʱ�䳤��
fs = 128000-1; % ����Ƶ��Ϊ1000Hz
t =0:1/fs:1; % ʱ�䳤��Ϊ1��

% ������ɢ���Ҳ��ź�
x = A*sin(2*pi*f*t + phi);

% ������ɢ���Ҳ��źŵľ�����ֵ
rms_x = rms(x);

% ������
fprintf('128000_������_��׼���Ҳ���ɢ�źŵ���ЧֵΪ��%.4f\n', rms_x);





















