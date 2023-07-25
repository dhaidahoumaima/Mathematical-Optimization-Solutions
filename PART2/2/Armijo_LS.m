function [ gamma ] = Armijo_LS(f, df, p, x0, alpha, rho, c)
% f: vector->scalar function -- the objective
% df: gradient function
% p: search direction; must be a descent direction at starting point x
% x: starting point
% alpha: initial step length
% rho: step length multiplier
% c: "sufficient decrease" condition multiplier
% This method performs a single unexact line search on f in the descent direction p and returns the chosen step length;
%terminates when the Armijo conditions are satisfied w.r.t. input parameters alpha, rho and c.

    f0 = f(x0);
    g0 = df(x0);
    gamma = alpha;
    x = x0 + gamma .* p;
    fk = f(x);
    dp = (g0'*p); %directional derivative at x0
    
    % repeat until the Armijo conditions are satisfied
    while fk < f0 + gamma * c * dp
      gamma = gamma / rho;
      x = x0 + gamma * p;
      fk = f(x);
    end
    while fk > f0 + c * gamma * dp
      gamma = rho * gamma;
      x = x0 + gamma * p;
      fk = f(x);
    end
end
