function x = Armijo_LS_basic(f, df, ~, x0, ~, ~, iter)
% f: real->real function -- the objective
% df: derivative
% x0: starting point
% This method repeatedly (exactly "iter" times) performs a linesearch on f in the descent direction;
%		each iteration runs until the Armijo condition is satisfied for some fixed parameter values.

    init_alpha = 1; %initial step length
    rho = 0.9; %step length multiplier
    c = 0.2; %Armijo condition modifier
    
    for k=1:iter
        alpha = init_alpha;
        f0 = f(x0);
        df0 = df(x0);
        if df0 > 0
            alpha = -alpha; % selecting the descent direction
        end
        x = x0+alpha;
        fx = f(x);
        
        while fx < f0 + c*alpha*df0
            alpha = alpha/rho;
            x = x0+alpha;
            fx = f(x);
        end
        while fx > f0 + c*alpha*df0
            alpha = rho*alpha;
            x = x0+alpha;
            fx = f(x);
        end
        
       x0 = x; %update the starting point for the next iteration
    end
end