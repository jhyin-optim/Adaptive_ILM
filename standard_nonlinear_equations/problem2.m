% Matlab Model by Jianghua Yin (Apr.,2021,Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem2(x,m,n,model)
% This problem is a modification of P2 given by the following paper:
% Bao J, Yu C K W, Wang J, et al. Modified inexact Levenberg¨CMarquardt 
% methods for solving nonlinear least squares problems. Computational 
% Optimization and Applications, 2019, 74(2): 547-582.

if model == 1
    out = zeros(m,1);
    for i=1:m
        out(i) = (3-2*x(2*i-1))*x(2*i-1)-2*sin(x(2*i))+1;
    end
else
    out = zeros(m,n);
    for i=1:m
        out(i,2*i-1) = 3-4*x(2*i-1);
        out(i,2*i) = -2*cos(x(2*i));
    end
end
