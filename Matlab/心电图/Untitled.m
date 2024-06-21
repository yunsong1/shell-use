% ����ģ����ĵ�ͼ
fs = 1000;              % ������
t = 0:1/fs:10-1/fs;     % ʱ����
f1 = 0.5;               % ��ͨ��ֹƵ��
f2 = 50;                % ��ͨ��ֹƵ��
ecg = 0.5*sin(2*pi*1*t);% ����ģ���ĵ�ͼ

% ����˲���
[b, a] = butter(2, [f1 f2]/(fs/2));  % ���װ�����˹�˲���

% �˲�
filtered_ecg = filtfilt(b, a, ecg);

% �����ĵ�ͼ���˲�����ĵ�ͼ
figure;
subplot(2, 1, 1);
plot(t, ecg);
title('ģ���ĵ�ͼ');
xlabel('Time (s)');
ylabel('Amplitude (mV)');
subplot(2, 1, 2);
plot(t, filtered_ecg);
title('�˲�����ĵ�ͼ');
xlabel('Time (s)');
ylabel('Amplitude (mV)');

