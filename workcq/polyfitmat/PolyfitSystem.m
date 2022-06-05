classdef PolyfitSystem < matlab.System
% POLYFITSYSTEM 二値化画像から多項式近似をおこなう
    properties (Nontunable)
        % Nontunableでプロパティをプログラムの途中で変更されるのを防ぐ
        Degree = 2;    % 多項式の次数
    end
    methods
       % コンストラクタ
       function obj = PolyfitSystem(varargin)
          setProperties(obj,nargin,varargin{:})
       end
    end
    methods(Access = protected)
        function setupImpl(obj)
        end
        function P = stepImpl(obj,BW)
            [y,x] = find(BW);   % 画像を座標に変換
            P = polyfit(x,y,obj.Degree);   % 多項式近似
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
