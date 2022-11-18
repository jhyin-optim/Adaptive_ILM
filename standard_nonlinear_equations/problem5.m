% Matlab Model by Jianghua Yin (Apr.,2021,Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation.                     


function out= problem5(x,m,n,model)
% Dan H, Yamashita N, Fukushima M. Convergence properties of the inexact 
% Levenberg-Marquardt method under local error bound conditions. 
% Optimization methods and software, 2002, 17(4): 605-626.

if model == 1
    out = zeros(m,1);
    for i=1:m
        out(i) = (x(i)+x(m+i))*(x(i)+x(m+i)-sqrt(i));
    end
else
    out = zeros(m,n);
    for i=1:m
        out(i,i) = 2*(x(i)+x(m+i))-sqrt(i);
        out(i,i+m) = 2*(x(i)+x(m+i))-sqrt(i);
    end
end
