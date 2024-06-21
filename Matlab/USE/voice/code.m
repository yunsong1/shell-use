clear,clc
myVoice = audiorecorder(8000, 16, 1);
disp('Start speaking.');
recordblocking(myVoice, 2);
disp('End of recording. Playing back ...');
play(myVoice);