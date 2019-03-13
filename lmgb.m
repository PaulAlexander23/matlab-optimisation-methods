function [x,fval,exitflag] = lmgb(fun,x0)
    %LIMITED MEMORY GOOD BROYDEN'S METHOD
    n = length(x0);
    x = x0;
    fval = fun(x);
    
    p = 5;% Number of columns for c and d. Not sure what p should be. p < n
    q = p - 1;% or p - 2
    c = zeros(n,p);
    d = zeros(n,p);
    m = 0;
    
    k = 0;
    exit = false;
    while ~exit
        B = eye(p) - d'*c;
        dx = fval + c * (B \ (d' * fval));
        x = x + dx;
        df = fun(x) - fval;
        fval = fval + df;
        if m == p
            % Not necessarily the most efficient update.
            c(:,q+1:p) = zeros(n,p-q);
            d(:,q+1:p) = zeros(n,p-q);

            m = q;
        end
        ndx = norm(dx);
        c(:,m+1) = (df + dx - c(:,1:m) * d(:,1:m)' * dx)/ndx;
        d(:,m+1) = dx/ndx;
        m = m + 1;
        
        k = k + 1;
        
        % Tolerance values could be tuned for better stopping performance.
        if norm(fval,'inf') < 1e-6, exit = true; exitflag = 1; end
        if norm(dx) < 1e-6, exit = true; exitflag = 2; end
        if norm(df) < 1e-12, exit = true; exitflag = 3; end
        if k >= 50, exit = true; exitflag = 0; end
        if any(isnan(x),'all'), exit = true; exitflag = -2; end
    end
end