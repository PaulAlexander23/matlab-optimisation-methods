%MAIN Script to dummy run the various optimisation methods

n = 128; % Probably best if even
x0=ones(n,1);
x0(1:2:end) = -1.2 * ones(n/2,1);

solver = 'lmgb';
problem = @(x) testFunction(x,n);

x = feval(solver,problem,x0);

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