clear,clc;
x = linspace(0,4000,21)';%产生0到4000的等差的21个数据
y = linspace(0,20,21)';%产生0到20的等差的21个数据
% function [fitresult, gof] = createFit(x, y)
[fitresult, gof] = createFit(x, y);
% createFit(x, y);