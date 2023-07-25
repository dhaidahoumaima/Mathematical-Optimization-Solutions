function [ X ] = firstOrder_unimodal(fdir, tmin, tmax, iter)
    a = tmin;
    b = tmax;
    syms  X; 
    dfdir = diff(fdir, X);  

    for i = 1:iter
        x = (a + b) / 2; 
        if dfdir(x) > 0
            b = x;
        elseif dfdir(x) < 0
            a = x;
        else
            break;
        end
    end
    X = (a + b) / 2;
end