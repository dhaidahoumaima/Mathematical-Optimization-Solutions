function fibonacci_task_7(f, a, b, iter)
    % f: real->real objective function
    % [a,b]: search interval
    % iter: number of iterations
    
    % Create a Fibonacci
    F = zeros(1, iter+1);
    F(1) = 1;
    F(2) = 1;
    for i = 3:iter+1
        F(i) = F(i - 1) + F(i - 2);
    end
    % Initialization
    x1 = b - ((b - a)*(F(iter - 1) / F(iter)));
    y1 = a + ((b - a)*(F(iter - 1) / F(iter)));
    if f(x1) > f(y1)
        a = x1;
        j = 2;
    elseif f(x1) <= f(y1)
        b = y1;
         j = 1;
    end
    while j <= iter - 1
        d0 = b - a;
        dj = d0* (F(iter - j) / F(iter - j + 1)) ;
        xj = b - dj;
        yj = a + dj;
        if f(xj) > f(yj)
            a = xj;
        elseif f(xj) <= f(yj)
            b = yj;
        end
        j = j + 1;
    end
        disp(['a = ', num2str(a)]);
        disp(['x = ', num2str(xj)]);
        disp(['y = ', num2str(yj)]);
        disp(['b = ', num2str(b)]);

    
end

