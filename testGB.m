function tests = testGB()
    tests = functiontests(localfunctions);
end

function testRosenbrock(testCase)
    x0 = [2; 2];
    a = 1;
    b = 100;
    
    expected = [a; a^2];
    actual = gb(@(x)rosenbrockSquare(x,a,b), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-2);
end

function testTrialFunction(testCase)
    x0 = [2; 2];
    eta = 0.1;
    
    expected = [1; 1];
    actual = gb(@(x) trialFunction(x, eta), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-1);
end
