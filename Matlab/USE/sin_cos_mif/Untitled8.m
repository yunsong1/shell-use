%%清屏
clear ;
close all;
clc;


% param1：Excel文件名，无需扩展名
% param2：第几个Sheet，不是sheet的名，就是打开excel后，左下角的第几个
% param3：区域，表示方法和excel中的一样。
format short
[Num]=xlsread('THE',1,'A1:D5');
x=Num(:,1);
y1=Num(:,2);
y2=Num(:,3);
y3=Num(:,4);
xx=linspace(1,5);
yy1=spline(x,y1,xx);
yy2=spline(x,y2,xx);
yy3=spline(x,y3,xx);
% sets the hold state for the axes
figure
hold(gca,'on');
% 画出散点图
% plot(x,y1,'hexagram',x,y2,'o',x,y3,'square')
%plot(x,y1,'hexagram','MarkerFaceColor',[0 0.4470 0.7410],...
                  % 'MarkerEdgeColor',[0 0.4470 0.7410],'LineWidth',1.5)
%plot(x,y2,'o','MarkerFaceColor',[0.9290 0.6940 0.1250],...
                  % 'MarkerEdgeColor',[0.9290 0.6940 0.1250],'LineWidth',1.5)
%plot(x,y3,'square','MarkerFaceColor',[0.4940 0.1840 0.5560],...
                 %  'MarkerEdgeColor',[0.4940 0.1840 0.5560],'LineWidth',1.5)
% 画出拟合后的曲线图
% plot(xx,yy1,xx,yy2,xx,yy3)
plot(xx,yy1,'LineWidth',1.5,'Color',[0 0.4470 0.7410])
plot(xx,yy2,'LineWidth',1.5,'Color',[0.9290 0.6940 0.1250])
plot(xx,yy3,'LineWidth',1.5,'Color',[0.4940 0.1840 0.5560])
% 取消以下行的注释以保留坐标区的 X 范围
xlim(gca,[0.5 5.5]);
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(gca,[94 99]);
% 外边框开，gca：返回当前axes对象的句柄值
box(gca,'on');
% hold off
hold(gca,'off');
% 设置其余坐标区属性，可设置好了由代码生成
set(gca,'GridLineStyle','--','LineStyleOrder',{'-'},'LineWidth',0.75,...
    'MinorGridAlpha',0.1,'XGrid','on','XMinorGrid','on','XTick',[1 2 3 4 5],...
    'XTickLabel',{'1','2','3','4','5'},'YGrid','on','YMinorGrid','on','YTick',...
    [94 95 96 97 98 99]);

% 创建一个 3 行 2 列的矩阵
M = [1 2; 3 4; 5 6];

% 提取矩阵的第一列数据
x = M(:, 1);

% 输出结果
disp(x);

x = Num(:, 1);
y1 = Num(:, 2);
y2 = Num(:, 3);
y3 = Num(:, 4);
xx = linspace(1, 5);
yy1 = spline(x, y1, xx);
yy2 = spline(x, y2, xx);
yy3 = spline(x, y3, xx);

figure
% 设置 hold 状态为 on
hold(gca, 'on');

% 绘制三条平滑曲线
plot(xx, yy1, 'r', 'LineWidth', 2);
plot(xx, yy2, 'g', 'LineWidth', 2);
plot(xx, yy3, 'b', 'LineWidth', 2);

% 添加标题和轴标签
title('Smooth Curves');
xlabel('X Axis');
ylabel('Y Axis');

% 添加图例
legend('Curve 1', 'Curve 2', 'Curve 3');
