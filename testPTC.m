function tests = testPTC()
    tests = functiontests(localfunctions);
end

function testTimeDependentProblem(testCase)
    x0 = 2;
    
    expected = 1;
    actual = PTC(@(x) timeDependentProblem(x), x0);

    verifyEqual(testCase, actual, expected, 'RelTol', 1e-2);
end

function testDampedOscillator(testCase)
    x0 = [1.1; 0];
    
    expected = [1; 0];
    actual = PTC(@(x) dampedOscillator(x), x0);

    verifyEqual(testCase, actual, expected, 'AbsTol', 1e-2);
end

function [f, J] = timeDependentProblem(x)
    f = (x - 1)^2;

    if nargout == 2
        J = 2 * (x - 1);
    end
end

function [f, J] = dampedOscillator(x)
    a = 100;

    f = [x(2); (x(1) - 1) - a * x(2)];

    if nargout == 2
        J = [0, 1; 1, -a];
    end
end
