clear,clc;
bsFilt = designfilt('bandstopiir','FilterOrder',20, ...
         'HalfPowerFrequency1',500,'HalfPowerFrequency2',560, ...
         'SampleRate',1500);
fvtool(bsFilt)
dataIn = randn(1000,1);
dataOut = filter(bsFilt,dataIn);