function [ x ] = test_constrained_method(G,f,df,ddf,g,dg,ddg,h,dh,ddh,testpts,startpt,a,b,c,d,res)
% G: optimization method to test; required signature: (f,df,ddf,g,dg,ddg,h,dh,ddh,x0,iter)
% f: R^2->R objective
% df: gradient
% ddf: Hessian
% g,dg,ddg: inequality constraint function and derivatives, g: R^2->R^k
% h,dh,ddh: equality constraint function and derivatives, h: R^2->R^m
% testpts: number of iterations for G
% startpt: starting point
% a,b,c,d: rectangular region to plot = [a,b] x [c,d]
% res: plot resolution = res x res
% x: output after each iteration

    X = linspace(a,b,res);
    Y = linspace(c,d,res);
    Z = zeros(res,res);
    for i=1:res
        for j=1:res
            Z(i,j)=f([X(i);Y(j)]);
        end
    end

    x = zeros(testpts,2);
    x(1,:) = startpt;
    for j=2:testpts
        x(j,:) = G(f,df,ddf,g,dg,ddg,h,dh,ddh,[x(1,1);x(1,2)],j-1);
    end
    
    contourf(X,Y,Z',200); hold on
    ithcomp = @(expr,ind) expr(ind);
    try
        k = size(g(startpt),1);
        for j=1:k
            compfun = @(x,y) ithcomp(g([x;y]),j);
            fimplicit(compfun, [a,b,c,d], '--', 'LineWidth', 2.0);
        end
    catch
    end
    try
        k = size(h(startpt),1);
        for j=1:k
            compfun = @(x,y) ithcomp(h([x;y]),j);
            fimplicit(compfun, [a,b,c,d], '--', 'LineWidth', 2.0);
        end
    catch
    end
    scatter(x(:,1),x(:,2),'r','filled');
    hold off;
end
