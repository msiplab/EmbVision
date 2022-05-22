classdef PolyfitSystem < matlab.System
    properties (Nontunable)
        Deg = 2;
    end
    methods
       % コンストラクタ
       function obj = PolyfitSystem(varargin)
          setProperties(obj,nargin,varargin{:})
       end
    end
    methods(Access = protected)
        function setupImpl(obj,BW)
            % Perform one-time calculations, such as computing constants
        end

        function P = stepImpl(obj,BW)
            % Implement algorithm. Calculate y as a function of input u and
            % discrete states.
            [y,x] = find(BW);
            P = polyfit(x,y,obj.Deg);
        end

        function resetImpl(obj)
            % Initialize / reset discrete-state properties
        end
                % 入力ポート数
        function N = getNumInputsImpl(obj)
            N = 1; 
        end
        % 出力ポート数        
        function N = getNumOutputsImpl(obj)
            N = 1;
        end      
        % 入力ポート名
        function inputName = getInputNamesImpl(obj)
            inputName = 'BW';
        end
        % 出力ポート名        
        function outputName = getOutputNamesImpl(obj)
            outputName = 'P';
        end
        % アイコン
        function icon = getIconImpl(obj)
           icon = 'BW to P';
        end        
    end
end
