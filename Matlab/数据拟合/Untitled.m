%非线性回归分析

clear,clc;
%{
创建样本数据
通常，您要通过测量获得数据。
在此示例中，请基于 A=40 和 λ=0.5 且带正态分布伪随机误差的模型创建人工数据。
%}
% rng default % for reproducibility
rng('default')

tdata = 0:0.1:10;
ydata = 40*exp(-0.5*tdata) + randn(size(tdata));

fun = @(x)sseval(x,tdata,ydata);%误差平方和

%{
求最优拟合参数
从随机正参数集 x0 开始，使用 fminsearch 求使得目标函数值最小的参数。
%}
x0 = rand(2,1);%生成2*1的向量
bestx = fminsearch(fun,x0)


%{
检查拟合质量
要检查拟合质量，请绘制数据和生成的拟合响应曲线。根据返回的模型参数创建响应曲线。
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


