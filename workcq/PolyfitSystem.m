classdef PolyfitSystem < matlab.System
    % POLYFITSYSTEM
    properties (Nontunable)
        Deg = 3;
    end

    properties(DiscreteState)

    end

    % Pre-computed constants
    properties(Access = private)

    end
    methods
       % コンストラクタ
       function obj = PolyfitSystem(varargin)
          setProperties(obj,nargin,varargin{:})
       end
    end
    methods(Access = protected)
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants
        end

        function y = stepImpl(obj,x,y)
            % Implement algorithm. Calculate y as a function of input u and
            % discrete states.
            y = polyfit(x,y,obj.Deg);
        end

        function resetImpl(obj)
            % Initialize / reset discrete-state properties
        end
    end
end
