function tests = testNewton()
    tests = functiontests(localfunctions);
end

function testRosenbrockClass(testCase)
    x0 = [-1; 1];
    a = 1;
    b = 100;

    solver = NewtonClass();

    expected = [a; a^2];
    actual = solver.solve(@(x)rosenbrock(x,a,b), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-2);
end

function testRosenbrockClassOptions(testCase)

    options = struct('AbsTol', 1e-7);

    solver = NewtonClass(options);

    verifyEqual(testCase, solver.options.AbsTol, 1e-7);
end

function testRosenbrock(testCase)
    x0 = [-1; 1];
    a = 1;
    b = 100;
    
    expected = [a; a^2];
    actual = newton(@(x)rosenbrock(x,a,b), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-2);
end

function testTrialFunction(testCase)
    x0 = [2; 2];
    eta = 0.1;
    
    expected = [1; 1];
    actual = newton(@(x) trialFunction(x, eta), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-1);
end
