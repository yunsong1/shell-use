clear,clc;
dFilt = designfilt('differentiatorfir','FilterOrder',7);
fvtool(dFilt,'MagnitudeDisplay','Zero-phase')
dataIn = randn(1000,1);
dataOut = filter(dFilt,dataIn);