classdef PolyfitSystem < matlab.System
    % POLYFITSYSTEM
    properties(Nontunable)
        Degree = 3;
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

        function p = stepImpl(obj,BW)
            % Implement algorithm. Calculate y as a function of input u and
            % discrete states.
            [y,x] = find(BW); % 画像を座標に変換
            p = polyfit(x,y,obj.Degree); % 多項式近似
        end

        function resetImpl(obj)
            % Initialize / reset discrete-state properties
        end
    end
end
