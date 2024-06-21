%�������Ҳ���MIF�ļ���ͬʱ��ʾ������
fs=256;%������
duration=1;%����ʱ��
depth=fs*duration;%��������
filename_sin='sin.mif';%MIF�ļ���
filename_cos='cos.mif';%MIF�ļ���
maxvolt=4;%����ѹ
minvolt=3;%��С��ѹ
A=(maxvolt-minvolt)/2;%���
offset=(maxvolt+minvolt)/2;%ƫ����
cell_sin=zeros(1,depth);%����һ������Ϊdepth������,���ڴ洢��������
cell_cos=zeros(1,depth);%����һ������Ϊdepth������,���ڴ洢��������
sin_mif=fopen(filename,'w');%����sinMIF�ļ�
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
fclose(sin_mif);%�ر��ļ�

cos_mif=fopen(filename_cos,'w');%����cosMIF�ļ�
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
fclose(cos_mif);%�ر��ļ�

%��ʾ�����Ҳ��Ĳ���ͼ
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
hold on;%������ͬһ��ͼ�ϻ��ƶ����ͼ���߻�ͼ��
plot(t,y1,'-r','DisplayName','sin');%������ɫ����ǩ
plot(t,y2,'-k','DisplayName','cos');%������ɫ����ǩ
hold off;
legend;
xlabel('Tim(s)');
ylabel('Voltage(V)');
title('sin_cos_wave');

figure%��ʾ�����ҵ����ֵ�ѹֵ������һ�����鱣�����ֵ�ѹֵ
hold on;
plot(t,cell_sin,'-r','DisplayName','sin');%������ɫ����ǩ
plot(t,cell_cos,'-k','DisplayName','cos');%������ɫ����ǩ
hold off;
legend;
y3=max(y1)*0.707;
%fprintf('length is:%d\n',depth);%����������������ַ���
disp(depth);%����ֱ�Ӵ�ӡ����������������������ַ���
%disp(cell_sin);


