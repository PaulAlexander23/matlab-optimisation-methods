function [f, J] = rosenbrock(x, a, b)
    f = (a - x(1))^2 + b * (x(2) - x(1)^2)^2;

    if nargout == 2
        J = [-2 * (a - x(1)) - 4 * b * (x(2) - x(1)^2) * x(1), ...
            2 * b * (x(2) - x(1)^2)];
    end
end
