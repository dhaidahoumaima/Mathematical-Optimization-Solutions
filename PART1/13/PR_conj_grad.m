function [ x ] = PR_conj_grad(f,df,x0,iter)
% f: vector->scalar objective function
% df: gradient function
% x0: starting point
% iter: number of iterations. Note that by "iteration", we refer to the
%    process of creating n=size(x0) potentially A-conjugate search
%    directions, i.e. it is essentially n optimization steps..

    eps=1e-12; % treshold for stability and directional minimization
    
    for k=1:iter
        x=x0;
        d = -df(x);
        % Initial search direction: steepest descent
        p = d;
        for i=1:size(x)
            if norm(d)>eps 
                fdir=@(t) f(x+t*p);
                tmax=eps;
                while fdir(tmax)<fdir(tmax/2)
                    tmax=2*tmax; % expand until has at least one minimizer
                end
                gamma = firstOrder_unimodal(fdir, 0, tmax, iter);
                % using the Polak–Ribiere formula
                x = x+gamma*p;
                beta = 1/(d'*d);
                d2 = -df(x);
                beta = beta * ((d2-d)'*d2);
                p = d2 +beta*p;
                if 0 > p'*d2
                    p = -p;
                end
            end
        end
        x0=x;
    end
end