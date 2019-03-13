function x = bb(fun,x0,invJ0)
    %BAD BROYDEN'S METHOD
    if nargin < 3, invJ0 = -eye(length(x0)); end
    x = x0;
    f = fun(x);
    invJ = invJ0;
    
    n = 1;
    err = 1;
    while err > 1e-6 && n <= 20
        
        dx = - invJ*f;
        
        x = x + dx;
        
        df = fun(x) - f;
        
        f = f + df;
        
        %invJ = invJ + (dx - invJ * df) * (dx' * invJ) / (dx' * invJ * df);
        invJ = invJ + (dx - invJ * df) * df' / (norm(df)^2);
        
        err = norm(f)
        
        n = n + 1;
    end
    n
end