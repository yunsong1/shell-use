% ����һЩ����
x = [1, 2, 3, 4, 5];
y = [10, 20, 30, 40, 50];

% ��������ϳ�һ������
data = [x' y'];

% ָ���ļ�����·��
filename = 'data.csv';
filepath = 'E:\Matlab 2019b\simulink_CSV';

% ������д�� CSV �ļ�
csvwrite(fullfile(filepath, filename), data);