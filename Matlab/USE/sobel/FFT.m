L = input('Desired length = ');%��ʾ����40
A = input('Amplitude = ');%���1.5
omega = input('Angular frequency = ');%���ֽ�Ƶ��0.1*pi
phi = input('Phase = ');%��λ0
n = 0:L-1;%�������
x = A*cos(omega*n + phi);%��������
stem(n,x);
xlabel('Time index');
ylabel('Amplitude');
ylim([-2,2])
title(['\omega_{o} = ',num2str(omega)]);
grid on

