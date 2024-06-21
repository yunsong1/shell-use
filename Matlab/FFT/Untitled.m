% �����źŵĲ���Ƶ�ʺͲ���ʱ��
Fs = 1000;            % ����Ƶ�� (Hz)
T = 1/Fs;             % ����ʱ�� (s)

% �����źŵ�ʱ����
t = 0:T:1-T;          % ʱ���� (s)

% ����һ�������ź�
f1 = 10;              % ��Ƶ (Hz)
f2 = 50;              % ����г��Ƶ�� (Hz)
f3 = 100;             % ����г��Ƶ�� (Hz)
x = 0.7*sin(2*pi*f1*t) + 0.2*sin(2*pi*f2*t) + 0.1*sin(2*pi*f3*t);

% ���� FFT
N = length(x);        % �źŵĳ���
X = fft(x);           % ����Ҷ�任
X_mag = abs(X);       % ģֵ
X_phase = angle(X);   % ��λ

% ����Ƶ��
f = Fs*(0:N/2-1)/N;   % Ƶ����
X_mag = X_mag(1:N/2);             % ֻȡǰһ���ģֵ
X_phase = X_phase(1:N/2); % ֻȡǰһ�����λ

% �����ź�ʱ����
subplot(2,1,1);
plot(t, x);
title('ʱ����');
xlabel('ʱ�� (s)');
ylabel('��ֵ');

% �����ź�Ƶ����
subplot(2,1,2);
plot(f, X_mag);
title('Ƶ����');
xlabel('Ƶ�� (Hz)');
ylabel('ģֵ');

% ��֤�ο�˹�ض���
f_Nyquist = Fs/2;              % �ο�˹��Ƶ��
f_mag_max = max(f(X_mag~=0));  % ���Ƶ��
if f_mag_max <= f_Nyquist
    disp('FFT �ο�˹�ض�����֤�ɹ���');
else
    disp('FFT �ο�˹�ض�����֤ʧ�ܣ�');
end