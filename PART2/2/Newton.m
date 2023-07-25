function [ x ] = Newton(f,x0,iter)
% f: vector->scalar objective function; not used!
% df: gradient function
% ddf: Hessian
% x0: starting point
% iter: number of iterations
    rho=0.9;
    c=0.2; 
    x=x0;
    delta = 15e-9; 
 for k=1:iter
    H = SecondOrder_FiniteDifference(f,x); % Approximate the Hessian using second-order finite difference
    [Q, D] = eig(H); 
    D(D < delta) = 1 / delta;
    D(D >= delta) = 1 ./ D(D >= delta);
    dfx = fdiff(f, x); % Approximate the gradient using finite difference
    p = -(Q * (D * (Q' * dfx))); % Compute p=-inv(H)*df(x)
    alpha = norm(p);
    p = p / norm(p);
    if norm(p) < delta
        break;
    end    
    gamma = Armijo_LS(f, p, x, alpha, rho, c);
    x = x + gamma * p;
end
end






