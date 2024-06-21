   clear,clc
      li=30/72;  
    %采样频率：100
    x=0.01:0.01:2;
      a_pwav=0.25;
      d_pwav=0.09;
      t_pwav=0.16;  
     
      a_qwav=0.025;
      d_qwav=0.066;
      t_qwav=0.166;
      
      a_qrswav=1.6;
      d_qrswav=0.11;
      
      a_swav=0.25;
      d_swav=0.066;
      t_swav=0.09;
      
      a_twav=0.35;
      d_twav=0.142;
      t_twav=0.2;
      
      a_uwav=0.035;
      d_uwav=0.0476;
      t_uwav=0.433;
      
       pwav=p_wav(x,a_pwav,d_pwav,t_pwav,li);

 
 %qwav output
 qwav=q_wav(x,a_qwav,d_qwav,t_qwav,li);

    
 %qrswav output
 qrswav=qrs_wav(x,a_qrswav,d_qrswav,li);

 %swav output
 swav=s_wav(x,a_swav,d_swav,t_swav,li);

 
 %twav output
 twav=t_wav(x,a_twav,d_twav,t_twav,li);

 
 %uwav output
 uwav=u_wav(x,a_uwav,d_uwav,t_uwav,li);

 %ecg output
 ecg=pwav+qrswav+twav+swav+qwav+uwav;
 
 t=x;
% 产生高斯白噪声
noise_power = 0.1; % 噪声功率
noise = noise_power*randn(size(ecg)); % 产生高斯白噪声

% 叠加噪声
f_xiebo=50;
signal_with_noise = ecg + noise +5*sin(2*pi*t*f_xiebo); % 叠加高斯白噪声
% signal_with_noise = ecg + noise; % 叠加高斯白噪声
% figure(1)
% plot(t,ecg,'b');
figure(2)
plot(t, signal_with_noise, 'r');

% 进行 FFT 运算
changdu = length(signal_with_noise); % 信号长度
X = abs(fft(signal_with_noise, changdu))/changdu*2; % 计算 FFT 并取模
P1 = X(1:changdu/2+1);
P1(2:end-1) = 2*P1(2:end-1);
figure(7)
f = (1:changdu/2+1);
plot(f, P1, 'r');


y=lvbo_test(signal_with_noise);
figure(99)
% plot(t,-y);
figure(88)
Y1=fftshift(2*(abs(fft(y,200)))/200);%得到滤波后的频谱图
% plot(t,Y1);


