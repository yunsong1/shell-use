%生成正弦波的MIF文件并同时显示出波形
fs=256;%采样率
duration=1;%持续时间
depth=fs*duration;%采样点数
filename_sin='sin.mif';%MIF文件名
filename_cos='cos.mif';%MIF文件名
maxvolt=4;%最大电压
minvolt=3;%最小电压
A=(maxvolt-minvolt)/2;%振幅
offset=(maxvolt+minvolt)/2;%偏移量
cell_sin=zeros(1,depth);%创建一个长度为depth的数组,用于存储波形数据
cell_cos=zeros(1,depth);%创建一个长度为depth的数组,用于存储波形数据
sin_mif=fopen(filename,'w');%创建sinMIF文件
fprintf(sin_mif,'DEPTH=%d;\n',depth);
fprintf(sin_mif,'WIDTH=8;\n');
fprintf(sin_mif,'ADDRESS_RADIX=UNS;\n');
fprintf(sin_mif,'DATA_RADIX=UNS;\n');
fprintf(sin_mif,'CONTENT BEGIN\n');
for i=1:depth
    value = round((A*sin(2*pi*(i-1)/fs)+offset)/5*256);
    cell_sin(i)=value;
    fprintf(sin_mif,'%d:%d;\n',i-1,value);
end
fprintf(sin_mif,'END;\n');
fclose(sin_mif);%关闭文件

cos_mif=fopen(filename_cos,'w');%创建cosMIF文件
fprintf(cos_mif,'DEPTH=%d;\n',depth);
fprintf(cos_mif,'WIDTH=8;\n');
fprintf(cos_mif,'ADDRESS_RADIX=UNS;\n');
fprintf(cos_mif,'DATA_RADIX=UNS;\n');
fprintf(cos_mif,'CONTENT BEGIN\n');
for i=1:depth
    value = round((A*cos(2*pi*(i-1)/fs)+offset)/5*256);
    cell_cos(i)=value;
    fprintf(cos_mif,'%d:%d;\n',i-1,value);
end
fprintf(cos_mif,'END;\n');
fclose(cos_mif);%关闭文件

%显示正余弦波的波形图
t=linspace(0,duration,depth);
y1=A*sin(2*pi*t)+offset;
y2=A*sin(2*pi*t)+offset;

%{
    subplot(2,1,1);
    plot(t,y1);
    xlabel('Time(s)');
    ylabel('Voltage(V)');
    title('sinwave');

    subplot(2,1,2);
    plot(t,y2);
    xlabel('TIM(s)');
    ylabel('Voltage(V)');
    title('coswave');

%}

figure 
%set(gcf,'Color','k');
hold on;%开启在同一幅图上绘制多个绘图曲线或图形
plot(t,y1,'-r','DisplayName','sin');%带有颜色，标签
plot(t,y2,'-k','DisplayName','cos');%带有颜色，标签
hold off;
legend;
xlabel('Tim(s)');
ylabel('Voltage(V)');
title('sin_cos_wave');

figure%显示正余弦的数字电压值，利用一个数组保存数字电压值
hold on;
plot(t,cell_sin,'-r','DisplayName','sin');%带有颜色，标签
plot(t,cell_cos,'-k','DisplayName','cos');%带有颜色，标签
hold off;
legend;
y3=max(y1)*0.707;
%fprintf('length is:%d\n',depth);%可以输出带变量的字符串
disp(depth);%可以直接打印变量，不能输出带变量的字符串
%disp(cell_sin);


