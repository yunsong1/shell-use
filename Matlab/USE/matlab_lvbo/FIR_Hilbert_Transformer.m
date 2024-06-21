clear,clc;
hFilt = designfilt('hilbertfir','FilterOrder',18,'TransitionWidth',0.25);
fvtool(hFilt,'MagnitudeDisplay','magnitude')
dataIn = randn(1000,1);
dataOut = filter(hFilt,dataIn);
