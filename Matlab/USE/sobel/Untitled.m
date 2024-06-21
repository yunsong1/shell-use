clear all 
clc 
 
 
%%������Ϣ

FS = 1250000; %����Ƶ��1.25m

fmin = 20000; % Ҫ���������Ƶ��ֵ

len = 1024;   %�������� 1024

time = 1/FS:1/FS:[1/FS]*len; 

x = 1:1:100000;

%windows =flattopwin(len); %������

windows =kaiser(len,50);

windows = windows';

er = zeros(1,100000); %10000�����

dat = zeros(6,100000); %10000�˷������Ϣ��f��U2��3��4��5��THDo��

cal = zeros(7,100000);%�����������ĸ�г����Ϣ

for i=1:100000

%%����г��ֵ��THDo

    U1 = 1;

    U2 = 0.05+0.25*rand();

    U3 = 0.05+0.25*rand();

    U4 = 0.05+0.25*rand();

    U5 = 0.05+0.25*rand();

    

    THDo = sqrt(U2^2+U3^2+U4^2+U5^2)/U1;

    %%�ź�

    f = fmin+(100000-fmin)*rand(); %������ź�Ƶ�� fmin��100k

    dat(1,i) = f;

    dat(2,i) = U2;

    dat(3,i) = U3;

    dat(4,i) = U4;

    dat(5,i) = U5;

    dat(6,i) = THDo;

    

    hold1=max([floor(len*f/(2*FS)),1]);

    y1 = sin(f*2*pi*time)+U2*sin(2*f*2*pi*time)+U3*sin(3*f*2*pi*time)+U4*sin(4*f*2*pi*time)+U5*sin(5*f*2*pi*time);


    y2 = y1.*windows; %����������

    %%fft

    after_fft = abs(fft(y2)); %����������������fft

    %pre_fft = abs(fft(y1));

    %plot(fre,after_fft) ;

    %figure;

    %plot(fre,pre_fft) ;

%%�����ݽ��д����������г����ֵ

    

    [U1x,maxX] = max(after_fft(1:len/2));

    U2x = max(after_fft(2*maxX-hold1:2*maxX+hold1));

    U3x = max(after_fft(3*maxX-hold1:3*maxX+hold1));

    U4x = max(after_fft(4*maxX-hold1:4*maxX+hold1));

    U5x = max(after_fft(5*maxX-hold1:5*maxX+hold1));

    THDx = sqrt(U2x^2+U3x^2+U4x^2+U5x^2)/U1x;

    er(i) = abs(THDo-THDx);

    cal(1,i) = f;

    cal(2,i) = U2x/U1x;

    cal(3,i) = U3x/U1x;

    cal(4,i) = U4x/U1x;

    cal(5,i) = U5x/U1x;

    cal(6,i) = THDx;

    cal(7,i) = abs(THDo-THDx);

end


er = er';

ermean = mean(er);

scatter(x,er,'.');

dat = dat';

cal = cal';

% fre = 0:FS/len:FS-[FS/len];

% figure;
 

















