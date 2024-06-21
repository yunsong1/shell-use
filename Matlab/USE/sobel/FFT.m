L = input('Desired length = ');%显示长度40
A = input('Amplitude = ');%振幅1.5
omega = input('Angular frequency = ');%数字角频率0.1*pi
phi = input('Phase = ');%相位0
n = 0:L-1;%序列序号
x = A*cos(omega*n + phi);%正弦序列
stem(n,x);
xlabel('Time index');
ylabel('Amplitude');
ylim([-2,2])
title(['\omega_{o} = ',num2str(omega)]);
grid on

