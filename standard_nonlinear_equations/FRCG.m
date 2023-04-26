function [d1,InItr] = FRCG(J,F,d0,method,para)
% A = J'*J+mu*I;
% b = -J'*F;  % solve linear equations A*d-b=0
% the residual r(d) = A*d-b;

mu = para.mu;
tau = para.tau;

n = length(d0);
Jd = J*d0;
JtF = J'*F;
r0 = J'*Jd+mu*d0+JtF;
p0 = -r0;
r0tr0 = r0'*r0;
InItr = 0;
d1 = d0;
switch method
    case 'ILM'
        alpha = para.alpha;
        theta = para.theta;
        xi = para.xik;
        normF = norm(F);
%         normJtF = norm(JtF);
        parMIN = min(sqrt(n),xi*normF^(alpha+theta));
        while norm(r0) > tau*min(parMIN,mu*norm(d1)) %&& InItr<=100
            Jp0 = J*p0;
            Ap0 = J'*Jp0+mu*p0;
            p0Ap0 = p0'*Ap0;
            alphak = r0tr0/p0Ap0;  
            d1 = d1+alphak*p0;
            InItr = InItr+1;
            r0 = r0+alphak*Ap0;
            r0tr0_old = r0tr0;
            r0tr0 = r0'*r0;
            betak = r0tr0/r0tr0_old;
            p0 = -r0+betak*p0;
        end
    case 'ILMM'
        eta = para.eta;
        delta = para.delta;
        kappa = para.kappa;
        normJtF = norm(JtF);
        normF = norm(F);
        MINMIN = min(min(eta*normJtF,normF^tau*normJtF^delta),kappa*sqrt(n));
        while norm(r0) > MINMIN %&& InItr<=100
            Jp0 = J*p0;
            Ap0 = J'*Jp0+mu*p0;
            p0Ap0 = p0'*Ap0;
            alphak = r0tr0/p0Ap0;  
            d1 = d1+alphak*p0;
            InItr = InItr+1;
            r0 = r0+alphak*Ap0;
            r0tr0_old = r0tr0;
            r0tr0 = r0'*r0;
            betak = r0tr0/r0tr0_old;
            p0 = -r0+betak*p0;
        end
end

    
    
    
