% Test the constrained barrier method with logarithmic barrier
g   = @(x) x(1)^2 + x(2)^2-2;
dg  = @(x) [2*x(1) 2*x(2)];
ddg = @(x) [2 0;0 2];
f   = @(x) 25*(x(2)-x(1)^2)^2+(1-x(1))^2;
df  = @(x) [100*x(1)^3-100*x(1)*x(2)+2*x(1)-2;50*(x(2)-x(1)^2)];
ddf = @(x) [300*x(1)^2-100*x(2)+2 -100*x(1);-100*x(1) 50];

x = test_constrained_method(@logarithmic_barrier_method, f, df, ddf, g, dg, ddg, g, dg, ddg, 12, [0,0], -1.5, 1.5, -0.1, 1.4, 50);
