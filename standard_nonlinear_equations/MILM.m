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
% Bao J, Yu C K W, Wang J, et al. Modified inexact Levenberg¨CMarquardt 
% methods for solving nonlinear least squares problems. Computational 
% Optimization and Applications, 2019, 74(2): 547-582.
%
function [NF,NinItr,out] = MILM(N0,para)

format long
% start the clock
tic;

% Set parameters
Itr_max = para.Itr_max;
sigma = para.sigma;
xi = para.xi;
gamma = para.gamma;
delta = para.delta;
rho = para.rho;
theta = para.theta;
zeta = para.zeta;

% index
NinItr = 0;
NF = 0;

% Set initial point
[nprob,x0,m,n] = init(N0);
Fk = feval(nprob,x0,m,n,1);   % evaluate the function value specified by nprob at x0
NF = NF+1;
Jk = feval(nprob,x0,m,n,2);   % evaluate the Jacobian value specified by nprob at x0
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
    %% using the FR CGM to the linear equations %%
    
    muk = xik*(out.objec(k))^alpha;
    [dk,InItr] = FRCG(Jk,Fk,muk,alpha,theta,tau,dk0);
    NinItr = NinItr+InItr;
    
    x_trial = x0+dk;
    Fk1_trial = feval(nprob,x_trial,m,n,1);   
    NF = NF+1;
    normFk1_trial = norm(Fk1_trial);
    % test the switching condition
    if normFk1_trial <= beta*(out.objec(k))
        x1 = x_trial;
    else
        %% start the Armijo line search %%
        psik = (out.objec(k))^2/2;
        tk = 1;
%         x_trial = x0+tk*dk;
%         Fk1_trial = feval(nprob,x_trial,m,n,1);
%         NF = NF+1;
%         normFk1_trial = norm(Fk1_trial);
        psik_trial = normFk1_trial^2/2;
        normdk2 = norm(dk)^2;
        while psik_trial > psik-sigma*tk*(1-tau)*muk*normdk2 && tk>10^(-10)
            tk = tk*rho;
            x_trial = x0+tk*dk;
            Fk1_trial = feval(nprob,x_trial,m,n,1);
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
    Jk = feval(nprob,x0,m,n,2);
    
end
out.NI = k;
out.Tcpu = toc;
%% ------------------SUBFUNCTION-----------------------------
