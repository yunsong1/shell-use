% �����ź�
fs = 1000; % ������
duration = 1; % �ź�ʱ�����룩
t = 0:1/fs:duration-1/fs; % ʱ����
f = 10; % �ź�Ƶ��
signal = sin(2*pi*f*t); % ���������ź�

% ������˹������
noise_power = 3; % ��������
noise = noise_power*randn(size(signal)); % ������˹������

% ��������
signal_with_noise = signal + noise; % ���Ӹ�˹������

% ����Ҷ����
N = length(signal_with_noise); % �źų���
Y = fft(signal_with_noise)/N; % �����źŵĸ���Ҷ�任������һ�����
f = (0:N-1)*(fs/N); % ����Ƶ����
amplitude = 2*abs(Y(1:N/2)); % �����źŵ������
phase = angle(Y(1:N/2)); % �����źŵ���λ��

% �����źź͵�����������ź�
figure;
subplot(2,1,1);
plot(t, signal, 'b', t, signal_with_noise, 'r');
xlabel('ʱ�䣨�룩');
ylabel('���');
title('�źź͵�����������ź�');
legend('ԭʼ�ź�', '������������ź�');

%{
�����źŵ������
subplot(2,1,2);
plot(f(1:N/2), amplitude);
xlabel('Ƶ�ʣ�Hz��');
ylabel('���');
title('�źŵ������');
%}

% �����������ֵ�ͨ�˲���
fc = 2;  % ��ֹƵ��
fs = 100;  % ������
N = 101;  % �˲���������������
n = -(N-1)/2:(N-1)/2;  % ʱ����
h = 2 * fc / fs * sinc(2 * fc / fs * n);  % �����ͨ�˲���ϵ��

% �����˲�����Ƶ��Ӧ����Ƶ��Ӧ
[H, w] = freqz(h, 1, 1024, fs);  % �����˲�����Ƶ����Ӧ
%{
figure;
subplot(2, 1, 1);
plot(w, abs(H));  % ��Ƶ��Ӧ
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Filter Frequency Response');
subplot(2, 1, 2);
plot(w, angle(H));  % ��Ƶ��Ӧ
xlabel('Frequency (Hz)');
ylabel('Phase');
title('Filter Phase Response');
%}