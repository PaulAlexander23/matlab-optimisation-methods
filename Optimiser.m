classdef Optimiser
    properties
        solver
        options
    end

    methods
        function obj = Optimiser(options)
            if nargin == 1
                obj.options = options;
            end
        end

        function [y, fval, exitflag] = solve(obj, fun, y0)
            [y, fval, exitflag] = obj.solver(fun, y0, obj.options);
        end
    end
end
