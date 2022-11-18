% Matlab Model by Jianghua Yin (Apr.,2021,Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem1(x,m,n,model)
% Bao J, Yu C K W, Wang J, et al. Modified inexact Levenberg¨CMarquardt 
% methods for solving nonlinear least squares problems. Computational 
% Optimization and Applications, 2019, 74(2): 547-582.

if model == 1
    out = zeros(m,1);
    for i=1:m
        out(i) = x(i)*x(i+m)-sqrt(i);  % x(i)*x(i+m)+exp(1-x(i))-sqrt(i);
    end
else
    % compute the Jacobian
    out = zeros(m,n);
    for i=1:m
        out(i,i) = x(i+m);   % x(i+m)-exp(1-x(i));
        out(i,i+m) = x(i);
    end
end
