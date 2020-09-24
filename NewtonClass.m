classdef NewtonClass < Optimiser
    methods
        function obj = NewtonClass(options)
            if nargin == 0
                options = struct('AbsTol', 1e-6);
            end

            obj = obj@Optimiser(options);

            obj.solver = @localnewton;

            function [y, f, exitflag] = localnewton(fun, y0, options)
                y = y0;
                n = 1;
                err = 1;
                exitflag = 1;
                while err > options.AbsTol && n <= 400
                    [f,J] = fun(y);
                    y = y - J\f;

                    err = norm(f);
                    n = n + 1;
                end

                if err > options.AbsTol
                    exitflag = 0;
                end
            end
        end
    end
end
