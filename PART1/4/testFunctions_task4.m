% test functions
%example 1
f = @(x) 5*x.^2;
df = @(x) 10*x;
x0=0
a=-5
b=5
res=200
iter=10
%example 2
f = @(x) x.^3;
df = @(x) 3*x.^2;
x0=1
a=-2
b=6
res=100
iter=4
%example 3
f = @(x) exp(x);
df = @(x) exp(x);
x0=4
a=-6
b=6
res=100
iter=5
%examle 4
f = @(x) sin(x);
df = @(x) cos(x);
x0=0
a=-8
b=8
res=100
iter=8

