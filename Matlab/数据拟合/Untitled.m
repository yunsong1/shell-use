%�����Իع����

clear,clc;
%{
������������
ͨ������Ҫͨ������������ݡ�
�ڴ�ʾ���У������ A=40 �� ��=0.5 �Ҵ���̬�ֲ�α�������ģ�ʹ����˹����ݡ�
%}
% rng default % for reproducibility
rng('default')

tdata = 0:0.1:10;
ydata = 40*exp(-0.5*tdata) + randn(size(tdata));

fun = @(x)sseval(x,tdata,ydata);%���ƽ����

%{
��������ϲ���
������������� x0 ��ʼ��ʹ�� fminsearch ��ʹ��Ŀ�꺯��ֵ��С�Ĳ�����
%}
x0 = rand(2,1);%����2*1������
bestx = fminsearch(fun,x0)


%{
����������
Ҫ��������������������ݺ����ɵ������Ӧ���ߡ����ݷ��ص�ģ�Ͳ���������Ӧ���ߡ�
%}
A = bestx(1);
lambda = bestx(2);
yfit = A*exp(-lambda*tdata);
plot(tdata,ydata,'*');
hold on
plot(tdata,yfit,'r');
xlabel('tdata')
ylabel('Response Data and Curve')
title('Data and Best Fitting Exponential Curve')
legend('Data','Fitted Curve')
% legend('Fitted Curve','Data')
hold off


