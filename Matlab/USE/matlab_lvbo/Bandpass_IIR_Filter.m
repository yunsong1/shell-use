clear,clc;
bpFilt = designfilt('bandpassiir','FilterOrder',20, ...
         'HalfPowerFrequency1',500,'HalfPowerFrequency2',560, ...
         'SampleRate',1500);
fvtool(bpFilt)
dataIn = randn(1000,1);
dataOut = filter(bpFilt,dataIn);