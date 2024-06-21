%心电图导入及读取

% clear,clc;
[tm,signal,Fs,siginfo]=rdmat('100m');% 通过读取函数ramat对心电图进行处理

plot(signal);


% [tm,signal,Fs,siginfo]=rdmat(recordName)