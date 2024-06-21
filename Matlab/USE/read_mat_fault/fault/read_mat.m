clear,clc;
% test_cell=load('100m.mat');

load('E:\Matlab 2019b\matlab_lvbo_test\100m');%����Ҫ����mat�ļ�������val����

N=10000;%��������
fs=1000;%����Ƶ��

t=(0:N-1)/fs;%��ʾn������ʱ��

data=zeros(1,N);%����data_cell��Ҫ����Ԥ����
                         %�����С�����Žű��е����������ı�
for i=1:N
    data(i)=val(i);
end

% ������˹������
noise_power = 2; % ��������
noise = noise_power*randn(size(data)); % ������˹������

signal=noise + data + 5*sin(2*pi*50*t) + 0.1*sin(2*pi*200*t);

figure(1);
subplot(331);
plot(t,signal);%���Ƶ����ź�
title('signal');
% subplot(334);
% plot(t,ecg);%�����ĵ��ź�
% title('ecg');

fft_signal=fftshift(2*(abs(fft(signal,N)))/N);
subplot(332);
% fshift=(-N/2:N/2-1) * N/N;
fshift=(-N/2:N/2-1) * fs/N;%Ƶ�׵ĺ���
plot(fshift,fft_signal);%�����ĵ��źŵ�Ƶ��
title('fft-signal');

       
%�����˲�
d = designfilt('lowpassiir', ...        % Response type ��Ӧ����
       'PassbandFrequency',100, ...     % Frequency constraints Ƶ��ϵ��
       'StopbandFrequency',110, ...     %ͨ��Ƶ�ʣ����Ƶ��
       'PassbandRipple',0.5, ...          % Magnitude constraints ����ϵ�� 
       'StopbandAttenuation',80, ...    %ͨ�����ƣ����˥��
       'DesignMethod','butter', ...      % Design method ��Ʒ���
       'MatchExactly','passband', ...   % Design method options ���ѡ��
       'SampleRate',1000);               % Sample rate ������
signal_lvbo = filter(d,signal); %�����˲�������d�����е�ͨ�˲�
% signal_lvbo = filtfilt(d,signal); 
% signal_lvbo = filter(Hd,signal); 
subplot(334);
plot(t,signal_lvbo);%���Ƶ�ͨ�˲�����ĵ��ź�
title('signal-lvbo');

fft_signal_lvbo=fftshift(2*(abs(fft(signal_lvbo,N)))/N);
subplot(335);
fshift=(-N/2:N/2-1) * fs/N;
plot(fshift,fft_signal_lvbo);%���Ƶ�ͨ�˲�����ĵ��źŵ�Ƶ��
title('fft-signal-lvbo');


bpFilt = designfilt('bandstopiir', ...       % Response type ��Ӧ����
       'FilterOrder',4,...             %�˲�������
       'HalfPowerFrequency1',49, ...    % Frequency constraints Ƶ��ϵ��
       'HalfPowerFrequency2',51, ...    %�빦�ʵ�(3db),
       'DesignMethod','butter', ...      % Design method ��Ʒ���
       'SampleRate',1000);               % Sample rate ������
signal_lvbo_remove_50 = filter(bpFilt,signal_lvbo);%50hz�����˲�
subplot(333);
plot(t,signal_lvbo_remove_50);%���Ƶ�ͨ�˲���Ĵ���50hz�˲�����ĵ��ź�
title('signal-lvbo-remove-50');

fft_signal_lvbo_remove_50=fftshift(2*(abs(fft(signal_lvbo_remove_50,N)))/N);
fshift=(-N/2:N/2-1) * fs/N;
subplot(336);
plot(fshift,fft_signal_lvbo_remove_50);%���Ƶ�ͨ�˲�����ĵ��źŵĴ���50hz�˲����Ƶ��
title('fft-signal-lvbo-remove-50');
   
fvtool(d)%���Ƶ�ͨ�˲��ķ�Ƶ��������
fvtool(bpFilt)%����50hz�����˲��ķ�Ƶ��������
filtord(d)%��ʾ��ͨ�˲��Ľ���
filtord(bpFilt)%��ʾ50hz�����˲��Ľ���

fprintf("��ͨ�˲��Ľ���:%d\n",filtord(d));
fprintf("50hz�����˲��Ľ���:%d\n",filtord(bpFilt));














