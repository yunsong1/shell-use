clear,clc;
mbFilt = designfilt('arbmagfir','FilterOrder',60, ...
         'Frequencies',0:50:500,'Amplitudes',[1 1 1 0 0 0 0 1 1 0 0], ...
         'SampleRate',1000);
fvtool(mbFilt)
dataIn = randn(1000,1);
dataOut = filter(mbFilt,dataIn);