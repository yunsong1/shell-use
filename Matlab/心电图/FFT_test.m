clc
li=30/72; 
x=0.01:0.01:10;
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
%采样率：100hz ,采样点数：1000
t=0.01:0.01:10;
signal = 1*sin(2*pi*2*t)+2*sin(2*pi*30*t)+3*sin(2*pi*4*t)+4*sin(2*pi*16*t);
figure(1);
plot(t,signal);

fft_signal=fftshift(2*(abs(fft(signal,1000)))/1000);
figure(2);
fshift = -50:0.1:50-0.1;
f = (0:length(signal)-1);
plot(fshift,fft_signal);

% signal_lvbo=lvbo_last(signal);
signal_lvbo = filter(Hd,signal); 
figure(3);
plot(t,signal_lvbo);

fft_signal_lvbo=fftshift(2*(abs(fft(signal_lvbo,1000)))/1000);
figure(4);
fshift = -50:0.1:50-0.1;
f = (0:length(signal_lvbo)-1);
plot(fshift,fft_signal_lvbo);




