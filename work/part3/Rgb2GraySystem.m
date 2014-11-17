classdef Rgb2GraySystem < matlab.System
    % RGB2GRAYSYSTEM RGB to Grayscale Converter
    %
    
    properties
        % Public, tunable properties.
    end
    
    properties (DiscreteState)
    end
    
    properties (Access = private)
        % Pre-computed constants.
    end
    
    methods (Access = protected)
        function setupImpl(obj,u)
            % Implement tasks that need to be performed only once,
            % such as pre-computed constants.
        end
        
        function y = stepImpl(obj,u)
            y = rgb2gray(u);
        end
        
        function resetImpl(obj)
            % Initialize discrete-state properties.
        end
    end
end
