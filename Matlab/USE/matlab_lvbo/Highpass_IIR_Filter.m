clear,clc;
hpFilt = designfilt('highpassiir','FilterOrder',8, ...
         'PassbandFrequency',75e3,'PassbandRipple',0.2, ...
         'SampleRate',200e3);
fvtool(hpFilt)
dataIn = randn(1000,1);
dataOut = filter(hpFilt,dataIn);