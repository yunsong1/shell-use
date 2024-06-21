clear,clc;
b_A = 7;  % 输入十进制整数
bComponent_A = convertToRGB565(b_A);

b_B = 240;
bComponent_B = b_B;

alpha = 25;

outputImage = (alpha*bComponent_A + (255-alpha)*bComponent_B)/256