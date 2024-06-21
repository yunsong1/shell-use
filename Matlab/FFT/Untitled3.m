%% FFTСʵ��
%���ܣ��������FFT����������
%2019��8��16��15:02:20
close all;clc;clear all;
fs = 256;%������
N = 256;%��������
delta_f = fs/N;%Ƶ�ʷֱ���
t = (0:1/fs:N/fs);%1/fs������������ N/fs��ʾ����ʱ��
%% ģ��һ���ź�,������������
Adc = 2;%ֱ������
A1 = 3;%�ź�1�ķ�ֵ��Ƶ�ʺ���λ
f1 = 50;
p1 = 30;
A2 = 1.5;%�ź�2�ķ�ֵ��Ƶ�ʺ���λ
f2 = 75;
p2 = 90;
St = Adc + A1*cos(2*pi*f1*t - pi*p1/180) + A2*cos(2*pi*f2*t + pi*p2/180);
%% ��ͼ
figure
plot(St);
title('ʱ����')
figure
res_fft = fft(St,N);
abs_res_fft = abs(res_fft);
plot(abs_res_fft);
title('һάFFT���')
%��ʵ�ķ��Ⱥ�Ƶ��
real_amp = abs_res_fft/(N/2);
real_amp(1) = abs_res_fft(1)/N;
real_freq = ((1:N)-1)*fs/N;
figure
plot(real_freq,real_amp)
title('��ʵ�ķ�ֵ��Ƶ��')
xlabel('Ƶ��')
ylabel('����')
ylim([0, 4]); % �������᷶Χ
%��ʵ����λ
figure;
Phrase=(1:N/2);
for i=1:N/2
    Phrase(i)=phase(res_fft(i)); %������λ
    Phrase(i)=Phrase(i)*180/pi; %����Ϊ�Ƕ�
end
plot(real_freq(1:N/2),Phrase(1:N/2));   %��ʾ��λͼ
title('��λ-Ƶ������ͼ');
xlabel('Ƶ��')
ylabel('��λ')