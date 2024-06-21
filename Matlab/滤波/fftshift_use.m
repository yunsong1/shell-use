fs=100;%采样频率
N=256;%采样点数   
n=0:N-1;
% t=n/fs;  %也就是t=nTs
t=(0:N-1)/fs;%表示n个采样时间
x=sin(2*pi*10*t)+2*sin(2*pi*20*t); 
%x=sin(2*pi*10*n/fs)+2*sin(2*pi*20*n/fs); 
 
y1=fft(x,N);    
y2=fftshift(y1);

% f1=n*fs/N;    
f1=(0:N-1)*fs/N;%表示n个采样频率，从0到fs-fs/N,以fs/N的采样间隔

% f2=n*fs/N-fs/2;%为了让横轴按照（-fs/2到0到fs/2）显示
f2=(-N/2:N/2-1)*fs/N;%表示-fs/2到fs/2，以fs/N的采样间隔

figure(1); plot(f1,abs(y1));
figure(2); plot(f2,abs(y2));

% %采样点数
% N=256;
% 
% %采样频率
% fs=100;
% 
% %时间
% t=(0:N-1)/fs;%表示n个采样时间
% 
% %FFT横轴
% f=(0:N-1)*fs/N;%表示n个采样频率，从0到fs-fs/N,以fs/N的采样间隔
% 
% %fftshift横轴
% f=(-N/2:N/2-1)*fs/N;%表示-fs/2到fs/2，以fs/N的采样间隔







