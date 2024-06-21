clear,clc;
lpFilt = designfilt('lowpassfir','PassbandFrequency',0.25, ...
         'StopbandFrequency',0.35,'PassbandRipple',0.5, ...
         'StopbandAttenuation',65,'DesignMethod','kaiserwin');
fvtool(lpFilt)
dataIn = rand(1000,1);
figure;
subplot(211);
plot(dataIn);
dataOut = filter(lpFilt,dataIn);
subplot(212);
plot(dataOut);