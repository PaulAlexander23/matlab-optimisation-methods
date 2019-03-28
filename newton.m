function x = newton(fun,x0)
    %NEWTON
    x = x0;
    n = 1;
    err = 1;
    while err > 1e-7 && n <= 400
        [f,J] = fun(x);
        x = x - J\f;

        err = norm(f);
        n = n + 1;
    end
end
