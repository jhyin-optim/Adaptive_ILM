% Matlab Model by Jianghua Yin (Apr.,2021,Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem4(x,m,n,model)
% Bao J, Yu C K W, Wang J, et al. Modified inexact Levenberg¨CMarquardt 
% methods for solving nonlinear least squares problems. Computational 
% Optimization and Applications, 2019, 74(2): 547-582.

if model == 1
    out = zeros(m,1);
    for i=1:m
        if mod(i,2)==1
            out(i) = sqrt(i)*exp((x(2*i-1)+x(2*i)+x(2*i+1)+x(2*i+2))/m)-sqrt(i);
        else
            out(i) = sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i))*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i)-1);
        end
    end
else
    out = zeros(m,n);
    for i=1:m
        if mod(i,2)==1
            out(i,2*i-1) = sqrt(i)/m*exp((x(2*i-1)+x(2*i)+x(2*i+1)+x(2*i+2))/m);
            out(i,2*i) = sqrt(i)/m*exp((x(2*i-1)+x(2*i)+x(2*i+1)+x(2*i+2))/m);
            out(i,2*i+1) = sqrt(i)/m*exp((x(2*i-1)+x(2*i)+x(2*i+1)+x(2*i+2))/m);
            out(i,2*i+2) = sqrt(i)/m*exp((x(2*i-1)+x(2*i)+x(2*i+1)+x(2*i+2))/m);
        else
            out(i,2*i-3) = sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i)-1)+sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i));
            out(i,2*i-2) = sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i)-1)+sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i));
            out(i,2*i-1) = sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i)-1)+sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i));
            out(i,2*i) = sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i)-1)+sqrt(i)*(x(2*i-3)+x(2*i-2)+x(2*i-1)+x(2*i));
        end
    end
end
