  fs=get(handles.slider1,'value');
    %fs = 8000;           % 采样频率
    duration = 2;        % 时间长度(秒） 
    % 创建一个录音文件：fs =8000Hz, 16-bit, 单通道
    voice = audiorecorder(fs, 16, 1);   
    recordblocking(voice, duration);   % 录音2秒钟
    stop(voice);
    y = getaudiodata(voice);
    ymax = max(abs(y));  % 归一化
    y = y/ymax;
audiowrite('D:\录音.wav',y,fs); % 存储录音文件

