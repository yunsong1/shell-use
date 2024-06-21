clear,clc;
bsFilt = designfilt('bandstopfir','FilterOrder',20, ...
         'CutoffFrequency1',500,'CutoffFrequency2',560, ...
         'SampleRate',1500);
fvtool(bsFilt)
dataIn = randn(1000,1);
dataOut = filter(bsFilt,dataIn);
