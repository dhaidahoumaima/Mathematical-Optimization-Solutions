% Test function 1: Simple paraboloid
x1 = linspace(-10, 10, 100);
y1 = linspace(-10, 10, 100);
[X1, Y1] = meshgrid(x1, y1);
Z1 = 2*X1.^2 - 3*X1.*Y1 + 4*Y1.^2 + 1*X1 + 2*Y1 + 5;
[a1, b1, c1, d1, e1, f1] = Paraboloid(X1(:), Y1(:), Z1(:));

% Test function 2: Elliptical paraboloid
x2 = linspace(-10, 10, 100);
y2 = linspace(-10, 10, 100);
[X2, Y2] = meshgrid(x2, y2);
Z2 = 3*X2.^2 + 2*X2.*Y2 + 4*Y2.^2 - 2*X2 + 5*Y2 + 10;
[a2, b2, c2, d2, e2, f2] = Paraboloid(X2(:), Y2(:), Z2(:));

