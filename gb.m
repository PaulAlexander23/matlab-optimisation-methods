function x = gb(fun,x0,J0)
    %GOOD BROYDEN'S METHOD
    if nargin < 3, J0 = eye(length(x0)); end
    x = x0;
    f = fun(x);
    J = J0;
    
    n = 1;
    err = 1;
    while err > 1e-6 && n <= 20
        
        dx = - J\f;
        
        x = x + dx;
        
        df = fun(x) - f;
        
        f = f + df;
        
        J = J + (df - J * dx) * dx' / (norm(dx)^2);
        
        err = norm(f)
        
        n = n + 1;
    end
    n
end