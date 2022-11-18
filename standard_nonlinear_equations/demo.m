% Matlab Model by Jianghua Yin (Apr.,2021,Nanning)
% Copyright (C) 2021 Jian Group
% All Rights Reserved
% Permission to use, copy, modify, and distribute this software and
% its documentation for any purpose and without fee is hereby
% granted, provided that the above copyright notice appear in all
% copies and that the copyright notice and this
% permission notice appear in all supporting documentation. 

clc;
clear all;
close all;
format long
format compact

Itr_max = 2000;
%% establish Latex table
fid_tex = fopen('mytext.txt','w'); 
%% set parameters
problem_set = [1:46 49:51 54:56 59:75];
np = length(problem_set); % from problem 1 to problem 5 % the number of the test problems
ns = 2;   % the number of the test algorithms
T = zeros(np,ns);
F = zeros(np,ns);
N = zeros(np,ns);

% parameters for ILM
para1.Itr_max = Itr_max;
para1.alpha = 1;
% para1.bart = 1;
para1.theta = 0;
para1.xik = 0.8;
para1.tau = 0.9; 
para1.beta = 0.8;
para1.rho = 0.7;      % compression ratio 0.7
para1.sigma = 0.6;    % line search parameter
para1.zeta = 0.001;
  
% % parameters for MILM
% para2.Itr_max = Itr_max;
% para2.sigma = 0.6;
% para2.xi = 0.7;
% para2.gamma = 0.8;
% para2.delta = 1;
% para2.rho = 2;
% para2.theta = 0.8;
% para2.zeta = 0.001;

% parameters for OLMM
para3.Itr_max = Itr_max;
para3.alpha = 0.6;   % line search parameter
para3.beta = 0.7;    % compression ratio
para3.gamma = 0.8;
para3.delta = 1;
para3.eta = 0.8;
para3.rho = 0.5;
para3.tau = 2;
% para3.pcons = 2;
para3.zeta = 0.001;
para3.kappa = 0.001;

%% 运行
for i=1:np
    ii = problem_set(i);
    [name,x0,m,n] = init(ii);
    % name=getname(nprob);
    [NF1,NinItr1,out1] = ILM(ii,para1);
    T1 = out1.Tcpu;   % the CPU time (in second)
    NI1 = out1.NI;    % the number of iterations
    [NF2,NinItr2,out2] = OILM(ii,para3);
    T2 = out2.Tcpu;
    NI2 = out2.NI;
    T(i,:) = [T1,T2];
    F(i,:) = [NinItr1,NinItr2];
    N(i,:) = [NI1,NI2];
    %% 输入到 latex 
    fprintf(fid_tex,'%s %d %d & %d/%d/%.3e & %.3f & %d/%d/%.3e & %.3f\\\\ \r\n',...
                name,m,n,NI1,NinItr1,out1.objec(end),T1,NI2,NinItr2,out2.objec(end),T2); 
end
%% 关闭文件
fclose(fid_tex);

% %% 画图
% clf;   %clf删除当前图形窗口中、
%        %%句柄未被隐藏(即它们的HandleVisibility属性为on)的图形对象。
figure(1);
%subplot(2,2,1);
perf(T,'logplot');
%title('时间性能');
%set(gca,'ylim',[0.3,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
legend('PILM','OILM');%,'DY+','HZ','location','best');%% 'CG\_descent'
% %subplot(2,2,2);
figure(2);
perf(F,'logplot');
%title('内迭代迭代计算性能');
% set(gca,'ylim',[0.1,1]);
xlabel('\tau','Interpreter','tex');                     %% 给x轴加注
ylabel('\rho(\tau)','Interpreter','tex');               %% 给y轴加注
legend('PILM','OILM');%,'DY+','HZ','location','best');%% 线分类说明'JHS','DHS','VHS','JPRP','DPRP','JHS','DHS',
%subplot(2,2,3);
figure(3);
perf(N,'logplot');
%title('迭代次数性能');
%set(gca,'ylim',[0.5,1]);
xlabel('\tau','Interpreter','tex');
ylabel('\rho(\tau)','Interpreter','tex');
legend('PILM','OILM');%,'DY+','HZ','location','best'); %'JFR','PRP',
% %hold on
% %text
% %axes
% %set(gca,'xtick',[],'ytick',[]) 
% %figure(2);
% %perf(T,'logplot');% 此“logplot”任何一个确定的常数都可以，只要保证有两个输入变量
