function x = newton(fun,x0,AbsTol)
    %NEWTON
    if nargin < 3
        AbsTol = 1e-6;
    end
    x = x0;
    n = 1;
    err = 1;
    while err > AbsTol && n <= 400
        [f,J] = fun(x);
        x = x - J\f;

        err = norm(f);
        n = n + 1;
    end
end
