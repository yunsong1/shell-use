  fs=get(handles.slider1,'value');
    %fs = 8000;           % ����Ƶ��
    duration = 2;        % ʱ�䳤��(�룩 
    % ����һ��¼���ļ���fs =8000Hz, 16-bit, ��ͨ��
    voice = audiorecorder(fs, 16, 1);   
    recordblocking(voice, duration);   % ¼��2����
    stop(voice);
    y = getaudiodata(voice);
    ymax = max(abs(y));  % ��һ��
    y = y/ymax;
audiowrite('D:\¼��.wav',y,fs); % �洢¼���ļ�

