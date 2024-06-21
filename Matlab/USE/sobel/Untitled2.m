% �������Ҳ��ź�
fs = 1000;                %����Ƶ��
t = 0:1/fs:1-1/fs;        %ʱ������
f1 = 50;                  %�ź�Ƶ��
x = sin(2*pi*f1*t);       %���Ҳ��ź�

% ���г���ɷ�
f2 = 100;                 %�ڶ���Ƶ�ʳɷ�
h2 = 0.2;                 %�ڶ���г������
x = x + h2*sin(2*pi*f2*t); %��ӵڶ���г���ɷ�

% �����źŵ�FFT
N = length(x);            %������һ��MATLAB����ʾ������������һ����һ��THDʧ��ȵ����Ҳ�������ʾ���źŵ�FFTͼ���THDֵ��

%matlab
% �������Ҳ��ź�
fs = 1000;                %����Ƶ��
t = 0:1/fs:1-1/fs;        %ʱ������
f1 = 50;                  %�ź�Ƶ��
x = sin(2*pi*f1*t);       %���Ҳ��ź�

% ���г���ɷ�
f2 = 100;                 %�ڶ���Ƶ�ʳɷ�
h2 = 0.2;                 %�ڶ���г������
x = x + h2*sin(2*pi*f2*t); %��ӵڶ���г���ɷ�

% �����źŵ�FFT
N = length(x);            %�źų���
X = fft(x);               %���ٸ���Ҷ�任
f = (0:N-1)*(fs/N);       %����Ƶ������
amplitude = abs(X)/N;     %������
amplitude(1) = 0;         %ȥ��ֱ��������������THD��
fundamental_power = amplitude(f1) ^ 2;                  %��Ƶ����
harmonic_power = sum(amplitude(2:end).^2); %��г������
THD = sqrt(harmonic_power/fundamental_power); %THD

% ��ʾ���
figure;
subplot(2,1,1);
plot(t,x);
xlabel('ʱ�� (s)');
ylabel('��ֵ');
title('���Ҳ�ʱ��ͼ��');

subplot(2,1,2);
plot(f,amplitude);
xlabel('Ƶ�� (Hz)');
ylabel('��ֵ');
title('���Ҳ�Ƶ��ͼ��');

fprintf('THD = %f%%\n', THD*100);


