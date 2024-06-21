%%����
clear ;
close all;
clc;


% param1��Excel�ļ�����������չ��
% param2���ڼ���Sheet������sheet���������Ǵ�excel�����½ǵĵڼ���
% param3�����򣬱�ʾ������excel�е�һ����
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
% ����ɢ��ͼ
% plot(x,y1,'hexagram',x,y2,'o',x,y3,'square')
%plot(x,y1,'hexagram','MarkerFaceColor',[0 0.4470 0.7410],...
                  % 'MarkerEdgeColor',[0 0.4470 0.7410],'LineWidth',1.5)
%plot(x,y2,'o','MarkerFaceColor',[0.9290 0.6940 0.1250],...
                  % 'MarkerEdgeColor',[0.9290 0.6940 0.1250],'LineWidth',1.5)
%plot(x,y3,'square','MarkerFaceColor',[0.4940 0.1840 0.5560],...
                 %  'MarkerEdgeColor',[0.4940 0.1840 0.5560],'LineWidth',1.5)
% ������Ϻ������ͼ
% plot(xx,yy1,xx,yy2,xx,yy3)
plot(xx,yy1,'LineWidth',1.5,'Color',[0 0.4470 0.7410])
plot(xx,yy2,'LineWidth',1.5,'Color',[0.9290 0.6940 0.1250])
plot(xx,yy3,'LineWidth',1.5,'Color',[0.4940 0.1840 0.5560])
% ȡ�������е�ע���Ա����������� X ��Χ
xlim(gca,[0.5 5.5]);
% ȡ�������е�ע���Ա����������� Y ��Χ
ylim(gca,[94 99]);
% ��߿򿪣�gca�����ص�ǰaxes����ľ��ֵ
box(gca,'on');
% hold off
hold(gca,'off');
% �����������������ԣ������ú����ɴ�������
set(gca,'GridLineStyle','--','LineStyleOrder',{'-'},'LineWidth',0.75,...
    'MinorGridAlpha',0.1,'XGrid','on','XMinorGrid','on','XTick',[1 2 3 4 5],...
    'XTickLabel',{'1','2','3','4','5'},'YGrid','on','YMinorGrid','on','YTick',...
    [94 95 96 97 98 99]);

% ����һ�� 3 �� 2 �еľ���
M = [1 2; 3 4; 5 6];

% ��ȡ����ĵ�һ������
x = M(:, 1);

% ������
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
% ���� hold ״̬Ϊ on
hold(gca, 'on');

% ��������ƽ������
plot(xx, yy1, 'r', 'LineWidth', 2);
plot(xx, yy2, 'g', 'LineWidth', 2);
plot(xx, yy3, 'b', 'LineWidth', 2);

% ��ӱ�������ǩ
title('Smooth Curves');
xlabel('X Axis');
ylabel('Y Axis');

% ���ͼ��
legend('Curve 1', 'Curve 2', 'Curve 3');
