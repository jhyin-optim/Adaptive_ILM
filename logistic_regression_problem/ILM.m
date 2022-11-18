% Consider the following nonlinear equations
% F(x)=0,
% where F:R^{n}-->R^{m} is continuously differentiable and m¡Ü n.
%
% Use the inexact LM (ILM) method to solve the above equations. At each
% iteration, find an approximate solution of the following linear equations
% (J_k^{T}J_k+\mu_k I)d=-J_k^{T}F_k
% such that the residual
% R_k:=(J_k^{T}J_k+\mu_k I)d_k+J_k^{T}F_k
% satifies
% ||R_k||¡Ü\tau min{1,\xi_k||F_k||^{\alpha+\theta},\mu_k ||d_k||}.
%
% The test data see the following paper:
% Yin J.H.: A globally convergent inexact Levenberg-Marquardt method for solving 
% nonlinear equations.
%
function [NF,NinItr,out] = ILM(x0,fun,para,varargin)

format long
% start the clock
tic;

% Set parameters
Itr_max = para.Itr_max;
alpha = para.alpha;
% theta = para.theta;
% bart = para.bart;
xik = para.xik;
tau = para.tau; 
beta = para.beta;
rho = para.rho;
sigma = para.sigma;
zeta = para.zeta;

% index
NinItr = 0;
NF = 0;
n = length(x0);
 % evaluate the function value and the Jacobian at x0
[Fk, Jk] = feval(fun, x0, varargin{:}); 
NF = NF+1;
% initial trial direction
dk0 = -Jk'*Fk;

for k=1:Itr_max
    
    if k==1
        out.objec(k) = norm(Fk);
    else
        out.objec(k) = normFk1_trial;
    end
    if out.objec(k) <= 10^(-8)*sqrt(n)
        break;
    end
    %% apply the FR CGM to solve the linear equations %%
    
    muk = min(xik*(out.objec(k))^alpha,zeta);
    para.mu = muk;
    [dk,InItr] = FRCG(Jk,Fk,dk0,'ILM',para);
    NinItr = NinItr+InItr;
    
    x_trial = x0+dk;
    Fk1_trial = feval(fun, x_trial, varargin{:});    
    NF = NF+1;
    normFk1_trial = norm(Fk1_trial);
    % test the switching condition
    if normFk1_trial <= beta*(out.objec(k))
        x1 = x_trial;
    else
        %% start the Armijo line search %%
        tk = 1;
        psik = (out.objec(k))^2/2;
%         x_trial = x0+tk*dk;
%         Fk1_trial = feval(nprob,x_trial,m,n,1);
%         NF = NF+1;
%         normFk1_trial = norm(Fk1_trial);
        psik_trial = normFk1_trial^2/2;
        normdk2 = norm(dk)^2;
        while psik_trial > psik-sigma*tk*(1-tau)*muk*normdk2 && tk>10^(-10)
            tk = tk*rho;
            x_trial = x0+tk*dk;
            Fk1_trial = feval(fun, x_trial, varargin{:}); 
            NF = NF+1;
            normFk1_trial = norm(Fk1_trial);
            psik_trial = normFk1_trial^2/2;
        end
        x1 = x_trial;
    end
    % update
    x0 = x1;
    dk0 = dk;
    Fk = Fk1_trial;
    [~,Jk] = feval(fun, x_trial, varargin{:}); 
    
end
out.NI = k;
out.Tcpu = toc;
% if k==Itr_max
%     NF = NaN;
%     out.NI = NaN;
%     NinItr = NaN;
%     out.Tcpu = NaN;
%     out.objec(k) = NaN;
% end
%% ------------------SUBFUNCTION-----------------------------
