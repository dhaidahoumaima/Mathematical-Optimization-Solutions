function ddf = SecondOrder_FiniteDifference(f, x)
n = size(x, 1);
eps = 15e-9;
H = zeros(n);
fx = f(x);
i = 1;
while i <= n
    ei=zeros(n,1);
    ei(i) = eps;
    j = 1;
    while j <= n
         ej = zeros(n,1);
         ej(j) = eps;   
        H(i, j) = ((f(x+ ei+ ej)) - (f(x + ei)) - (f(x + ej)) + fx) / (eps^2);
        
        j = j + 1;
    end
    i = i + 1;
end
ddf = (H + H') / 2;
end
       
    
   
    