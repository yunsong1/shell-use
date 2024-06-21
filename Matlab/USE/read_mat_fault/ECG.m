load('100m.mat')
[TIME,M,Fs,siginfo]=rdmat('100m');
plot(TIME,M);