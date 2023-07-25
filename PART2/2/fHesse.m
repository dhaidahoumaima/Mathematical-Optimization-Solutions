function [ ddf ] = fHesse(df,x)
% df: R^n->R^n gradient of some R^n->R objective
% x: interior point
% ddf: estimated Hessian using forward differentials of df 

    eps = 15e-9;
    n=size(x,1);
    H = zeros(n); %nxn 0-matrix
    dfx = df(x);
    for k=1:n
        dir = zeros(n,1);
        dir(k) = eps;
        dfxe = df(x+dir);
        H(:,k) = (dfxe-dfx)/eps;
    end
    % We force the symmetry of H, further refining our approximation of ddf
    ddf = (H+H')/2;
end
