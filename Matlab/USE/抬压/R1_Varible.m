clear,clc;

x = [];%定义一个空变量x
Vos = 1.67 + 0.333*sin(x);%抬压后的电压
V2 = sin(x);%抬压前的电压
Vcc = 5;%电源电压
R1_register = 1;%R3的电阻值,单位k欧

%R1=x;
%R3=y;
%R2=z;

syms  x y z a b;
% z = R2_register;
% y = R3_register;
x = R1_register;
a = 1/3;%Vcc衰减的的大小
b = 1/3;%交流分量衰减的大小

eqns = [a==(z*y)/(x*z+x*y+z*y),b==(x*y)/(x*z+x*y+z*y)];

vars = [y,z];
% 求解方程
[y,z] = solve(eqns, vars);

% 显示解
cell=[y,z];

% format short; % 更改输出格式为短小数格式

fprintf("已设定电阻R3的值是：%.1f欧\n",R1_register*1000);

fprintf("电阻R1的值是：%.1f欧\n",cell(1)*1000);
fprintf("电阻R3的值是%.1f欧\n",cell(2)*1000);



% prompt = '请输入Vcc大小';
% Vcc = input(prompt);




syms a b c x;
eqn = a*x^2 + b*x + c == 0;
S = solve(eqn);
Sa = solve(eqn,a);



