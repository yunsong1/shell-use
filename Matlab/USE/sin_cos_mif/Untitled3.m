x = 0:0.1:2*pi;
y = sin(x);

plot(x, y)

text(x(1), max(y), 'This is the sine wave', 'HorizontalAlignment', 'left')
text(x(end), min(y), 'x axis label', 'HorizontalAlignment', 'right')
text(x(1), min(y), 'y axis label', 'HorizontalAlignment', 'left', 'VerticalAlignment', 'top')