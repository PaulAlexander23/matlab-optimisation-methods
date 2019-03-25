function x = newton(fun,x0)
    %NEWTON
    x = x0;
    n = 1;
    err = 1;
    while err > 1e-6 && n <= 20
        [f,J] = fun(x);
        x = x - J\f;

        err = norm(f);
        
        n = n + 1;
    end
end