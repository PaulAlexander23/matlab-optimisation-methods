function x = PTC(fun,x0,AbsTol)
    %NEWTON
    if nargin < 3
        AbsTol = 1e-6;
    end
    d0 = 1e-1;
    dmax = 1e6;
    phi = @(c) min(c, dmax);

    x = x0;
    d = d0;
    n = 1;
    [f,J] = fun(x);
    err = norm(f);

    V = eye(length(f));

    while err > AbsTol && n < 40
        s = - (d^(-1) * V + J)\f;

        x = x + s;

        [f,J] = fun(x);

        temp = norm(f);

        d = phi(d * err/temp);

        err = temp;

        n = n + 1;
    end
end
