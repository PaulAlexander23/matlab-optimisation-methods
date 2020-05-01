function [f, J] = trialFunction(x, eta)
    f = [x(1)-1 + eta*(x(1)-1).*(x(2)-1);...
        x(2)-1 - eta*(x(1)-1).*(x(2)-1)];
    if nargout > 1
        J = [1 + eta*(x(2)-1), eta*(x(1)-1);
            - eta*(x(2)-1), 1 + eta*(x(1)-1)];
    end
end
