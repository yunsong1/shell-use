% ���ɲ���Ƶ��Ϊ100Hz����������Ϊ200���ź�
Fs = 100;  % ����Ƶ��
t = 0:1/Fs:2-1/Fs;  % ʱ����������0�뵽2�룬ÿ��1/Fs�����һ��
x = sin(2*pi*20*t) + 0.5*sin(2*pi*40*t);  % �����źţ�����20Hz��40Hz�ĳɷ�

% ���Ӹ�˹������
SNR = 10;  % �����Ϊ10dB
Px = mean(abs(x).^2);  % �����źŹ���
Pn = Px/(10^(SNR/10));  % ������������
n = sqrt(Pn)*randn(size(x));  % ���ɸ�˹������
x_noise = x + n;  % ��������

% 10Hz��ͨ�˲�
fc = 10;  % ��ֹƵ��Ϊ10Hz
[b,a] = butter(2,fc/(Fs/2),'low');  % ����2�װ�����˹��ͨ�˲���ϵ��
y_noise = filtfilt(b,a,x_noise);  % ʹ��filtfilt�����Դ������źŽ����������˲�

% �����˲�ǰ����źŲ��κ�Ƶ��
figure;
subplot(2,2,1);
plot(t,x_noise);
title('�������ź�');
xlabel('ʱ�䣨�룩');
ylabel('����');
subplot(2,2,2);
plot(t,y_noise);
title('�˲����ź�');
xlabel('ʱ�䣨�룩');
ylabel('����');
subplot(2,2,3);
NFFT = length(x_noise);
f = Fs/2*linspace(0,1,NFFT/2+1);
X = fft(x_noise,NFFT)/NFFT;
Y = fft(y_noise,NFFT)/NFFT;
plot(f,2*abs(X(1:NFFT/2+1)));
hold on;
plot(f,2*abs(Y(1:NFFT/2+1)));
title('Ƶ��');
xlabel('Ƶ�ʣ�Hz��');
ylabel('����');
legend('�������ź�','�˲����ź�');