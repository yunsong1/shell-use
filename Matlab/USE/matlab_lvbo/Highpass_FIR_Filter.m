clear,clc;
hpFilt = designfilt('highpassfir','StopbandFrequency',0.25, ...
         'PassbandFrequency',0.35,'PassbandRipple',0.5, ...
         'StopbandAttenuation',65,'DesignMethod','kaiserwin');
fvtool(hpFilt)
dataIn = randn(1000,1);
dataOut = filter(hpFilt,dataIn);