clear,clc;
load census
plot(cdate,pop,'ro')
title('U.S. Population from 1790 to 1990')
corrcoef(cdate,pop)
[p,ErrorEst] = polyfit(cdate,pop,2);
pop_fit = polyval(p,cdate,ErrorEst);
plot(cdate,pop_fit,'-',cdate,pop,'+');
title('U.S. Population from 1790 to 1990')
legend('Polynomial Model','Data','Location','NorthWest');
xlabel('Census Year');
ylabel('Population (millions)');
