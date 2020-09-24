classdef FsolveClass < Optimiser
    methods
        function obj = FsolveClass(options)
            if nargin == 0
                options = optimoptions('fsolve');
            end

            obj = obj@Optimiser(options);

            obj.solver = @fsolve;
        end
    end
end
