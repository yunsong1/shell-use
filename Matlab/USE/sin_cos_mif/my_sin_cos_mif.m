clear,clc
% �������Ҳ��� MIF �ļ���ͬʱ��ʾ������
fs =256; % ������
%duration = 20; % ����ʱ��
duration = 1; % ����ʱ��
depth = fs * duration; % ��������
filename = 'sin.mif'; % MIF �ļ���
filenam_cos = 'cos.mif'; % MIF �ļ���
maxVolt = 4.5; % ����ѹ
minVolt = 3; % ��С��ѹ
amplitude = (maxVolt - minVolt) / 2; % ���
offset = (maxVolt + minVolt) / 2; % ƫ����
cell_sin = zeros(1, depth); % ����һ������Ϊ depth �����飬���ڴ洢��������
cell_cos = zeros(1, depth); % ����һ������Ϊ depth �����飬���ڴ洢��������
qqq = fopen(filename, 'w'); % ���� MIF �ļ�
fprintf(qqq, 'DEPTH = %d;\n', depth);
fprintf(qqq, 'WIDTH = 8;\n');
fprintf(qqq, 'ADDRESS_RADIX = UNS;\n');
fprintf(qqq, 'DATA_RADIX = UNS;\n');
fprintf(qqq, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round((amplitude * sin(2 * pi * (i - 1) / fs) + offset)/5*256);
    cell_sin(i) = value;
    fprintf(qqq, '%d:%d;\n', i - 1, value);
end
fprintf(qqq, 'END;\n');
fclose(qqq); % �ر��ļ�

qqq_cos = fopen(filenam_cos, 'w'); % ���� MIF �ļ�
fprintf(qqq_cos, 'DEPTH = %d;\n', depth);
fprintf(qqq_cos, 'WIDTH = 8;\n');
fprintf(qqq_cos, 'ADDRESS_RADIX = UNS;\n');
fprintf(qqq_cos, 'DATA_RADIX = UNS;\n');
fprintf(qqq_cos, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round((amplitude * cos(2 * pi * (i - 1) / fs) + offset)/5*256);
    cell_cos(i) = value;
    fprintf(qqq_cos, '%d:%d;\n', i - 1, value);
end
fprintf(qqq_cos, 'END;\n');
fclose(qqq_cos); % �ر��ļ�

% ��ʾ�����Ҳ��Ĳ���ͼ
t = linspace(0, duration, depth);
y1 = amplitude * sin(2 * pi * t) + offset;
y2 = amplitude * cos(2 * pi * t) + offset;


%{
subplot(2,1,1);
plot(t, y1);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('sin Wave1');

subplot(2,1,2);
plot(t, y2);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('cos Wave1');
%}
figure
%set(gcf, 'Color', 'k')
hold on;%������ͬһ��ͼ�ϻ��ƶ����ͼ���߻�ͼ��
plot(t,y1,'-r','DisplayName','sin');%������ɫ����ǩ
plot(t,y2,'-k','DisplayName','cos');%������ɫ����ǩ
hold off;
legend;
xlabel('Time (s)');
ylabel('Voltage (V)');
title('sin Wave1');

figure%��ʾ�����ҵ����ֵ�ѹֵ������һ�����鱣�����ֵ�ѹֵ
hold on
%plot(t,cell_sin, 'o', 'Color','-r','DisplayName','sin');%������ɫ����ǩ
plot(t,cell_sin, 'Color','r','DisplayName','sin');%������ɫ����ǩ
plot(t,cell_cos, 'Color','k','DisplayName','cos');%������ɫ����ǩ
hold off
legend;
y3=max(y1)*0.707;
%fprintf('length is:%d\n',depth);%����������������ַ���
disp(depth);%����ֱ�Ӵ�ӡ����������������������ַ���
%disp(cell_sin);


volatge_cell=zeros(1,256);
for i=1:256
 volatge_cell(i)=cell_sin(i)*5/256;
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

volatge_max=max(volatge_cell);
volatge_min=min(volatge_cell);
fprintf("��ɢֵ_���ֵ��%.4f\n",volatge_max);


sample_num = 8000;
pingfang_cell = zeros(1,sample_num-1);
qiuhe=0;
for i=1:sample_num-1
    position=floor(i/32)+1;
    %(1)�𹤳�ֵ--��2.5��ȥ�Ļ�����ӦΪ1.6773������Ϊ1.674
    %pingfang_cell(i)=(2.5-volatge_cell(position))^2;%(1)
    %(2)�𹤳�ֵ--û�б�2.5��ȥ�Ļ�����ӦΪ1.1969������Ϊ1.3789
    pingfang_cell(i)=(volatge_cell(position))^2;%(2)
end
for i=1:sample_num-1
    qiuhe=qiuhe+pingfang_cell(i);
end
youxiaozhi=sqrt(qiuhe/(sample_num-1));
fprintf("������_8000_��ɢֵ_��Чֵ��%.8f\n",youxiaozhi);
