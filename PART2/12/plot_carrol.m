function [ x ] = plot_carrol(f,g,rho)
    x = zeros(100,2);
    x(1,:) = [2;-1];
    x0 = [x(1,1);x(1,2)];
    for k=2:100
        x(k,:)= carrol_barrier_path(f,g,rho,x0,k-1);         
    end
end

function [ x ] = carrol_barrier_path(f,g,rho,x0,iter)
% f: R^n->R objective
% df, ddf: gradient and Hessian
% g: R^n->R^k inequality constraints, g_i(x)<=0 must be satisfied
% dg: R^{kxn} matrix, the derivative of g, containing the gradients of g_i-s as rows
% x0: interior(!) starting point, i.e. g_i(x0)<0 must hold
% iter: number of iterations
    mul = 2;
    tiledlayout(1,2);
    ax1 = nexttile;
    x = x0;
    for l=1:iter
        frho = @(x) f(x)+1/rho*Carrol_barrier(g,x);
        rho = rho*mul;
                a= linspace(-10,10,50);
                b = linspace(-10,10,50);
                z_mod_func = zeros(50,50);
                for i=1:50
                    for j=1:50
                        z_mod_func(i,j)=frho([a(i);b(j)]);
                    end
                end 
                plot3(x(1),x(2),f([x(1);x(2)]),'.','Color','r','MarkerSize',15)
                hold on
                surf(a,b,z_mod_func); 
                title('Modified function')
                hold on   
    end
    c = linspace(-10,10,50);
    d = linspace(-10,10,50);
    z_obj_fun = ones(50,50);
    for i=1:50
        for j=1:50
             z_obj_fun(i,j)=f([c(i);d(j)]);
        end
    end
    ax2 = nexttile; 
    colormap cool
    surf(c,d,z_obj_fun); 
    title('Objective function')
    colormap(ax2,'parula')
    hold
end
function [ gx ] = Carrol_barrier(g,x)
% returns the eval of the Carrol-type barrier at point x
    gx = -sum(1./g(x));
end







