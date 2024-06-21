clear,clc;
bpFilt = designfilt('bandpassfir','FilterOrder',20, ...
         'CutoffFrequency1',500,'CutoffFrequency2',560, ...
         'SampleRate',1500);
fvtool(bpFilt)
dataIn = randn(1000,1);
dataOut = filter(bpFilt,dataIn);
b = bpFilt.Coefficients
