classdef CurveSystem < matlab.System
% 二値画像から近似曲線画像に変換
    properties (Nontunable)
        Degree = 3;
    end
    methods
        %コンストラクタ
        function obj = CurveSystem(varargin)
            setProperties(obj,nargin,varargin{:})
        end
    end
    methods(Access = protected)
        function setupImpl(obj)
        end

        function Line = stepImpl(obj,BW)
            [y,x] = find(BW); % 検出点を座標に変換
            p = polyfit(x,y,obj.Degree); % 多項式近似

            Line = zeros(size(BW));

            xline = 1:size(BW,2); % 説明変数を画像の端から端とする
            yline = uint8(polyval(p,xline));    % 多項式から目的変数を求める画素に収まるように整数型にしておく
            yline = min(max(yline,1),size(BW,1));   % 目的変数が画像内に収まるように変更する。
            ind = sub2ind(size(BW),yline,xline);  % 座標から画像位置に変換
            
            Line(ind) = 1;    % 線を描画
        end

        function resetImpl(obj)
        end
        % 入力ポート名
        function inputName = getInputNamesImpl(obj)
            inputName = 'BW';
        end
        % 出力ポート名        
        function outputName = getOutputNamesImpl(obj)
            outputName = 'Line';
        end
    end
end
