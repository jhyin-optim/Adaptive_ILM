% the $\ell_{2}$-regularized logistic regression problem
% $\min \frac{1}{m}\sum_{i=1}^m \log(1+ \exp(-b_ia_i^Tx)) + \mu\|x\|_2^2$
function [F,J] = lr_loss(A,b,m,x,mu)
n = length(x);
Ax = A*x;
Atran = A';
expba = exp(-b.*Ax);
%% f = sum(log(1 + expba))/m + mu*norm(x,2)^2; %%
% compute the gradient of the objective function at point x
% ( when |nargout|>1, compute the Jacobian.£©

% %% F(x)=\frac{1}{m}\sum_{i=1}^m a_i(b_i-b_i/(1+\exp(b_ia_i^Tx)))+mu x
%% F(x)=\frac{1}{m}\sum_{i=1}^m -b_i\exp(-b_ia_i^Tx)a_i/(1+\exp(-b_ia_i^Tx))+2\mu x
F = Atran*(b./(1+expba) - b)/m + 2*mu*x;
%% J(x)=\frac{1}{m}\sum_{i=1}^m\exp(-b_ia_i^Tx)a_ia_i^T/(1+\exp(-b_ia_i^Tx))^2+mu I
if nargout > 1
    expcoe = expba./((1+expba).^2);
    J = Atran*(A.*repmat(expcoe,1,n))/m + 2*mu*eye(n);
end
end