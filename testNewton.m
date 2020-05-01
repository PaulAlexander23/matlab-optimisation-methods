function tests = testNewton()
    tests = functiontests(localfunctions);
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
