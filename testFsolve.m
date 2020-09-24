function tests = testFsolve()
    tests = functiontests(localfunctions);
end

function testRosenbrockClass(testCase)
    x0 = [-1; 1];
    a = 1;
    b = 100;

    solver = FsolveClass();

    expected = [a; a^2];
    actual = solver.solve(@(x)rosenbrock(x,a,b), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-2);
end

function testRosenbrockClassOptions(testCase)

    options = struct('AbsTol', 1e-7);

    solver = FsolveClass(options);

    verifyEqual(testCase, solver.options.AbsTol, 1e-7);
end

function testRosenbrock(testCase)
    x0 = [-1; 1];
    a = 1;
    b = 100;
    
    expected = [a; a^2];
    actual = fsolve(@(x)rosenbrock(x,a,b), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-2);
end

function testTrialFunction(testCase)
    x0 = [2; 2];
    eta = 0.1;
    
    expected = [1; 1];
    actual = fsolve(@(x) trialFunction(x, eta), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-1);
end

function testTrialFunctionClass(testCase)
    x0 = [2; 2];
    eta = 0.1;
    
    solver = FsolveClass();

    expected = [1; 1];
    actual = solver.solve(@(x) trialFunction(x, eta), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-1);
end

function testTrialFunctionClassOptions(testCase)
    x0 = [2; 2];
    eta = 0.1;
    
    options = optimoptions('fsolve', 'display', 'iter');

    solver = FsolveClass(options);

    expected = [1; 1];
    actual = solver.solve(@(x) trialFunction(x, eta), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-1);
end
