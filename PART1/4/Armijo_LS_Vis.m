function Armijo_LS_Vis(f,df,x0,a, b, res,iter)

    C = [0.1, 0.5,0.7, 0.9]; 
    RHO = [0.1, 0.5,0.7, 0.9];
    X = linspace(a, b, res);
    Y=f(X);
    plot(X,Y, 'LineWidth', 2)
    hold on;
    for i = 1:length(C)
        c = C(i);
        for j = 1:length(RHO)
            rho = RHO(j);
            x = x0;
            p_examined = [];
            for k=0:iter
                p_examined = [p_examined x];
                x = Armijo_LS_basic(f, df, x, x0, c, rho, 10);
                x0 = x;
            end
            % Plot the points examined
                 scatter(p_examined, f(p_examined), 'filled', 'MarkerFaceColor', 'b');
            % Highlight the final point
                 scatter(x, f(x), 'filled', 'MarkerFaceColor', 'r');
            % The separator line corresponding to c
            separator_x = [min(X), max(X)];
            separator_y = c * separator_x;
            plot(separator_x, separator_y);
        end
    end
end
