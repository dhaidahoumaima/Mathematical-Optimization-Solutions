% test functions
%example 1
f = @(x) 5*x.^2;
df = @(x) 10*x;
x0=0
iter=10
%example 2
f = @(x) x.^3;
df = @(x) 3*x.^2;
x0=1
iter=4
%example 3
f = @(x) exp(x);
df = @(x) exp(x);
x0=4
iter=5
%examle 4
f = @(x) sin(x);
df = @(x) cos(x);
x0=0
iter=8

