function bComponent = convertToRGB565(input)
    % 将输入整数转换为RGB565格式
    r = bitshift(bitand(input, 0xF800), -11);
    g = bitshift(bitand(input, 0x07E0), -5);
    b = bitand(input, 0x001F);

    % 提取B分量的十进制值
    bComponent = double(b) * 8;

    % 显示转换后的RGB565格式的值（二进制形式）
    %fprintf('输入整数：%d\n', input);
    %fprintf('转换后的RGB565格式（二进制）：0b%s%s%s%s%s%s%s%s%s%s%s%s\n', ...
        %dec2bin(r, 5), dec2bin(g, 6), dec2bin(b, 5));
    fprintf('B分量的十进制值：%d\n', bComponent);
end