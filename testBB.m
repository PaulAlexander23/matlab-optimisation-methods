function tests = testBB()
    tests = functiontests(localfunctions);
end

function testRosenbrock(testCase)
    x0 = [2; 2];
    a = 1;
    b = 100;
    
    expected = [a; a^2];
    actual = bb(@(x) rosenbrockSquare(x, a, b), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-1);
end

function testTrialFunction(testCase)
    x0 = [2; 2];
    eta = 0.1;
    
    expected = [1; 1];
    actual = bb(@(x) trialFunction(x, eta), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-1);
end
