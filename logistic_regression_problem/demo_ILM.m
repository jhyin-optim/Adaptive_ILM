%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%     Copyright (C) 2021 Jianghua Yin
% 
%     This program is free software: you can redistribute it and/or modify
%     it under the terms of the GNU General Public License as published by
%     the Free Software Foundation, either version 3 of the License, or
%     (at your option) any later version.
% 
%     This program is distributed in the hope that it will be useful,
%     but WITHOUT ANY WARRANTY; without even the implied warranty of
%     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%     GNU General Public License for more details.
% 
%     You should have received a copy of the GNU General Public License
%     along with this program.  If not, see <https://www.gnu.org/licenses/>.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% consider Tikhonov-regularized logistic regression
%
% $$ \displaystyle\min_x \frac{1}{m}\sum_{i=1}^m \log(1+ \exp(b_ia_i^Tx)) 
% + \lambda\|x\|_2^2,$$
% 
% where $(a_i,b_i)_{i=1}^m$ 为已知的待分类的数据集. 

%%
% set random seed 
clear;
seed = 97006855;
ss = RandStream('mt19937ar','Seed',seed);
RandStream.setGlobalStream(ss);

Itr_max = 2000;
% parameters for PILM
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

% parameters for OILMM
para2.Itr_max = Itr_max;
para2.alpha = 0.6;   % line search parameter
para2.beta = 0.7;    % compression ratio
para2.gamma = 0.8;
para2.delta = 1;
para2.eta = 0.8;
para2.rho = 0.5;
para2.tau = 2;
% para3.pcons = 2;
para2.zeta = 0.001;
para2.kappa = 0.001;

% the regularization parameter
lambda = 1e-2;

%% establish Latex table
fid_tex = fopen('mytext.txt','w'); 
for i=1:12
    dataset = {'a1a.t','a2a.t','a3a.t','a4a.t','a5a.t','a6a.t','a7a.t',...
    'a8a.t','a9a.t','colon-cancer','gisette_scale.t',...
    'madelon.t','covtype.libsvm.binary.scale','ijcnn1.t'};
    [b,A] = libsvmread(dataset{i});
    [m,n] = size(A);
    fprintf('name=%s, m=%d, n=%d, lambda=%.2f\n',dataset{i},m,n,lambda);

    % create function handle
    fun = @(x) lr_loss(A,b,m,x,lambda);
    % set the initial point
    x0 = zeros(n,1);
    %% start comparison %%
    [NF1,NinItr1,out1] = ILM(x0,fun,para1);
    T1 = out1.Tcpu;
    NI1 = out1.NI;
    [NF2,NinItr2,out2] = OILM(x0,fun,para2);
    T2 = out2.Tcpu;
    NI2 = out2.NI;
    fprintf('Norm_ILM=%.2e, Itr_ILM=%d, Norm_OILM=%.2e, Itr_OILM=%d\n',out1.objec(end),NI1,out2.objec(end),NI2);
    fprintf('Tcpu_ILM=%.3f, NCG_ILM=%d, Tcpu_OILM=%.3f, NCG_OILM=%d\n',T1,NinItr1,T2,NinItr2);
    fprintf(fid_tex,'%s & %d & %d & %d/%d/%.3e & %.3f & %d/%d/%.3e & %.3f\\\\ \r\n',...
                dataset{i},m,n,NI1,NinItr1,out1.objec(end),T1,NI2,NinItr2,out2.objec(end),T2); 
    % plot
%     fig = figure;   % semilogy,plot
    figure(i)
    k1 = 1:out1.NI;
    semilogy(k1-1, out1.objec, '-', 'Color',[0.2 0.1 0.99], 'LineWidth',2);
    hold on
    k2 = 1:out2.NI;
    semilogy(k2-1, out2.objec, '-.', 'Color',[0.99 0.1 0.2], 'LineWidth',1.8);
    % hold on
    % k3 = 1:10:out3.iter;
    % semilogy(k3-1, out3.nrmG(k3), '--', 'Color',[0.99 0.1 0.99], 'LineWidth',1.5);
    legend('PILM','OILM');
    ylabel('$\|F_k\|$', 'fontsize', 14, 'interpreter', 'latex');
    xlabel('Iteration No.');
%     grid on
%     title(dataset{i});
%     print(fig, '-depsc','lr_ILM.eps');  % -depsc2表示eps图像;-djpeg表示输出jpg图像
end
%% close file
fclose(fid_tex);

% %%%
% % 在 CINA 上的实验。
% seed = 97006855;
% ss = RandStream('mt19937ar','Seed',seed);
% RandStream.setGlobalStream(ss);
% dataset = 'CINA.test';
% [b,A] = libsvmread(dataset);
% [m,n] = size(A);
% x0 = zeros(n,1);
% lambda = 1e-2/m;
% fun = @(x) lr_loss(A,b,m,x,lambda);
% [NF3,NinItr3,out3] = ILM(x0,fun,para1);
% [NF4,NinItr4,out4] = OILM(x0,fun,para2);
% 
% %%%
% % 在 ijcnn1 上的实验。
% seed = 97006855;
% ss = RandStream('mt19937ar','Seed',seed);
% RandStream.setGlobalStream(ss);
% dataset = 'ijcnn1.test';
% [b,A] = libsvmread(dataset);
% [m,n] = size(A);
% lambda = 1e-2/m;
% fun = @(x) lr_loss(A,b,m,x,lambda);
% x0 = zeros(n,1);
% [NF5,NinItr5,out5] = ILM(x0,fun,para1);
% [NF6,NinItr6,out6] = OILM(x0,fun,para2);

% %% 结果可视化
% % 对于不同数据集，展示目标函数的梯度范数随着迭代步的变化。
% fig = figure;   % semilogy,plot
% k1 = 1:out1.NI;
% semilogy(k1-1, out1.objec, '-', 'Color',[0.2 0.1 0.99], 'LineWidth',2);
% hold on
% k2 = 1:out2.NI;
% semilogy(k2-1, out2.objec, '-.', 'Color',[0.99 0.1 0.2], 'LineWidth',1.8);
% % hold on
% % k3 = 1:10:out3.iter;
% % semilogy(k3-1, out3.nrmG(k3), '--', 'Color',[0.99 0.1 0.99], 'LineWidth',1.5);
% legend('PILM','OILM');
% ylabel('$\|F_k\|_2$', 'fontsize', 14, 'interpreter', 'latex');
% xlabel('Iteration');
% print(fig, '-depsc','lr_ILM.eps');  % -depsc2表示eps图像;-djpeg表示输出jpg图像

