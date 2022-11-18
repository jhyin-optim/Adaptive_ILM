% Matlab Model by Jianghua Yin (Apr.,2021,Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem3(x,m,n,model)
% This problem is a modification of P3 given by the following paper:
% Bao J, Yu C K W, Wang J, et al. Modified inexact Levenberg–Marquardt 
% methods for solving nonlinear least squares problems. Computational 
% Optimization and Applications, 2019, 74(2): 547-582.

if model == 1
    out = zeros(m,1);
    for i=1:m
        out(i) = x(i)*x(m+i)*x(2*m+i)-nthroot(i,4);  % nthroot(a,n) 表示对实数a开n次方
    end
else
    out = zeros(m,n);
    for i=1:m
        out(i,i) = x(m+i)*x(2*m+i);
        out(i,m+i) = x(i)*x(2*m+i);
        out(i,2*m+i) = x(i)*x(m+i);
    end
end
