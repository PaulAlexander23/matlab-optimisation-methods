%MAIN Script to dummy run the various optimisation methods

n = 2; % Probably best if even
x0=ones(n,1);
x0(1:2:end) = -1.2 * ones(n/2,1);

solver = 'newton';
%problem = @(x) testFunction(x,n);
problem = @testFunction3;


x = feval(solver,problem,x0);

%options = optimoptions('fsolve','SpecifyObjectiveGradient',true);
%x = feval(solver,problem,x0,options);

xe = norm(x - 1,'inf');

fprintf('Problem: %s, Solver: %s, Error: %g\n',func2str(problem),solver,xe);

function g = extendedRosenbrock(x,n)
    g = zeros(n,1);
    g(1:2:end) = 10 * (x(2:2:end) - x(1:2:end));
    g(2:2:end) = 1 - x(1:2:end);
end % Exact = 1;

function f = testFunction(x,n)
    f = zeros(n,1);
    f(1:2:end) = (x(1:2:end)-1) + (x(2:2:end)-1).^2;
    f(2:2:end) = (x(1:2:end)-1) .* (x(2:2:end)-1);
end

function [f,J] = testFunction2(x) % size(x) = [2,1];
    f = [(x(1)-1)^2 + (x(1)-1)^2;(x(1)-1)*(x(2)-1)];
    if nargout > 1
        J = [2*(x(1)-1),2*(x(2)-1);x(2)-1,x(1)-1];
    end
end

function [f, J] = testFunction3(x)
    eta = 0.1;
    f = [x(1)-1 + eta*(x(1)-1).*(x(2)-1);...
        x(2)-1 - eta*(x(1)-1).*(x(2)-1)];
    if nargout > 1
        J = [1 + eta*(x(2)-1), eta*(x(1)-1);
            - eta*(x(2)-1), 1 + eta*(x(1)-1)];
    end
end