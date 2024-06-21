% �������Ҳ��� MIF �ļ���ͬʱ��ʾ������
fs = 256; % ������
duration = 10; % ����ʱ��
depth = fs * duration; % ��������
filename1 = 'sin1.mif'; % ��һ�� MIF �ļ���
filename2 = 'sin2.mif'; % �ڶ��� MIF �ļ���
maxVolt1 = 5; % ��һ�����Ҳ�������ѹ
minVolt1 = 3; % ��һ�����Ҳ�����С��ѹ
maxVolt2 = 4; % �ڶ������Ҳ�������ѹ
minVolt2 = 2; % �ڶ������Ҳ�����С��ѹ
amplitude1 = (maxVolt1 - minVolt1) / 2; % ��һ�����Ҳ������
offset1 = (maxVolt1 + minVolt1) / 2; % ��һ�����Ҳ���ƫ����
amplitude2 = (maxVolt2 - minVolt2) / 2; % �ڶ������Ҳ������
offset2 = (maxVolt2 + minVolt2) / 2; % �ڶ������Ҳ���ƫ����

% ������һ�����Ҳ��� MIF �ļ�
qqq1 = fopen(filename1, 'w'); % ���� MIF �ļ�
fprintf(qqq1, 'DEPTH = %d;\n', depth);
fprintf(qqq1, 'WIDTH = 8;\n');
fprintf(qqq1, 'ADDRESS_RADIX = HEX;\n');
fprintf(qqq1, 'DATA_RADIX = HEX;\n');
fprintf(qqq1, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round(amplitude1 * sin(2 * pi * (i - 1) / fs) + offset1);
    fprintf(qqq1, '%02X:%02X;\n', i - 1, value);
end
fprintf(qqq1, 'END;\n');
fclose(qqq1); % �ر��ļ�

% �����ڶ������Ҳ��� MIF �ļ�
qqq2 = fopen(filename2, 'w'); % ���� MIF �ļ�
fprintf(qqq2, 'DEPTH = %d;\n', depth);
fprintf(qqq2, 'WIDTH = 8;\n');
fprintf(qqq2, 'ADDRESS_RADIX = HEX;\n');
fprintf(qqq2, 'DATA_RADIX = HEX;\n');
fprintf(qqq2, 'CONTENT BEGIN\n');
for i = 1:depth
    value = round(amplitude2 * sin(2 * pi * (i - 1) / fs) + offset2);
    fprintf(qqq2, '%02X:%02X;\n', i - 1, value);
end
fprintf(qqq2, 'END;\n');
fclose(qqq2); % �ر��ļ�

% ��ʾ�������Ҳ��Ĳ���ͼ
t = linspace(0, duration, depth);
y1 = amplitude1 * sin(2 * pi * t) + offset1;
y2 = amplitude2 * sin(2 * pi * t) + offset2;
subplot(2, 1, 1);
plot(t, y1);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Sine Wave 1');
subplot(2, 1, 2);
plot(t, y2);
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Sine Wave 2');