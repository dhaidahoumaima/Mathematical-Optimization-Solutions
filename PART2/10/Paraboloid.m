function [a, b, c, d, e, f] = Paraboloid(x, y, z)
    M = [x.^2, x.*y, y.^2, x, y, ones(size(x))];
    parameters = linear_LSq(M, z);
    a = parameters(1);
    b = parameters(2);
    c = parameters(3);
    d = parameters(4);
    e = parameters(5);
    f = parameters(6);
    figure;
    scatter3(x, y, z);
    hold on;
    [X, Y] = meshgrid(min(x):max(x), min(y):max(y));
    Z = a*X.^2 + b*X.*Y + c*Y.^2 + d*X + e*Y + f;
    surf(X, Y, Z);
    hold off;
end

