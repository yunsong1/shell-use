% �������Ҳ��ź�
fs = 1000;                %����Ƶ��
t = 0:1/fs:1-1/fs;        %ʱ������
f1 = 50;                  %�ź�Ƶ��
x = sin(2*pi*f1*t);       %���Ҳ��ź�

% �����źŵ�FFT
N = length(x);            %�źų���
X = fft(x);               %���ٸ���Ҷ�任
f = (0:N-1)*(fs/N);       %����Ƶ������
amplitude = abs(X)/N;     %������
phase = angle(X);         %��λ��

% ����ʧ���
y = ifft(amplitude.*exp(1j*phase));  %�ϳ��ź�
distortion = norm(x-y)/norm(x);      %����ʧ���

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

fprintf('ʧ��� = %f\n', distortion);