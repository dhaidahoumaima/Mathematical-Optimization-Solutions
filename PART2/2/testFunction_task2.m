% test functions
% Example 1
f1 = @(x) sin(x(1)) + cos(x(2));
df1 = @(x) [cos(x(1)); -sin(x(2))];
fh1 = fHesse(df1, [0; 0]);
SO_finite_diff1 = SecondOrder_FiniteDifference(f1, [0; 0]);
result1 = norm(fh1 - SO_finite_diff1);
fprintf('Result for Example 1: %.3f\n', result1);

% Example 2
f2 = @(x) (x(1)^2 + x(2) - 11)^2 + (x(1) + x(2)^2 - 7)^2;
df2 = @(x) [4*x(1)*(x(1)^2 + x(2) - 11) + 2*(x(1) + x(2)^2 - 7); 2*(x(1)^2 + x(2) - 11) + 4*x(2)*(x(1) + x(2)^2 - 7)];
fh2 = fHesse(df2, [0; 0]);
SO_finite_diff2 = SecondOrder_FiniteDifference(f2, [0; 0]);
result2 = norm(fh2 - SO_finite_diff2);
fprintf('Result for Example 2: %.3f\n', result2);
