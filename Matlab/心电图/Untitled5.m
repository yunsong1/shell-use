clear,clc
% ���ɲ����ź�
fs = 1000; % ������
t = 0:1/fs:1-1/fs; % ʱ����
f1 = 50; % ��Ƶ
f2 = 200; % �ڶ���Ƶ�ʳɷ�
x = sin(2*pi*f1*t) + 0.5*sin(2*pi*f2*t); % ����Ƶ�ʳɷֵ���

% ���� FFT ����
N = length(x); % �źų���
test=fft(x, N);
X = abs(fft(x, N)); % ���� FFT ��ȡģ


% ����Ƶ����
f = (0:N-1) * fs / N;

%{
% ���Ʒ�Ƶ����ͼ��
plot(f, X);
xlabel('Frequency (Hz)');
ylabel('Magnitude');
%}


Fs = 8;     % �źŲ���Ƶ�� 8Hz
T = 1;      % �źų���ʱ�� 2s
t = 0:1/Fs:T-1/Fs;
st = cos(2*pi*t);
figure
plot(t,st);
figure
Nfft_list = [8 16 32 64];
for i = 1 : length(Nfft_list)
    subplot(2,2,i);
    Nfft = Nfft_list(i);   % Nfft ���� 8
    f = [-Nfft/2:Nfft/2-1]/Nfft * Fs;
    stem(f, fftshift(abs(fft(st, Nfft)/Nfft*2)),"LineWidth",1.5);
    axis([-3.5 3.5 0 5.1]);
    xlabel("F/Hz");
    ylabel("Amplitude");
    title(strcat("Nfft = ", num2str(Nfft)));
end

