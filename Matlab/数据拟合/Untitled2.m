z=@(x,y) fzero(@(z) z-sin((z*x-0.5)^2+2*x*y^2-z/10) *exp(-((x-0.5-exp(-y+z))^2+y^2-z/5+3)),rand);

z(2,0.5) %求x=2, y=0.5时的z值

%绘制z(x,y)的图像

[X,Y]=meshgrid(-1:0.1:7,-2:0.1:2);

Z=arrayfun(@(x,y) z(x,y),X,Y);

surf(X,Y,Z)

xlabel('x')

ylabel('y')

zlabel('z')

title('函数z(x,y)的图像')