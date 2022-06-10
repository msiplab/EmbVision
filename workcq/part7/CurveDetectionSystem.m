classdef CurveDetectionSystem < matlab.System
% 二値画像から近似曲線画像に変換
    properties (Nontunable)
        Degree = 3;
    end
    methods
        %コンストラクタ
        function obj = CurveDetectionSystem(varargin)
            setProperties(obj,nargin,varargin{:})
        end
    end
    methods(Access = protected)
        function [line,p] = stepImpl(obj,bw)
            [y,x] = find(bw); % 検出点を座標に変換
            p = polyfit(x,y,obj.Degree); % 多項式近似

            line = zeros(size(bw));

            xline = 1:size(bw,2); % 説明変数を画像の端から端とする
            yline = uint8(polyval(p,xline));    % 多項式から目的変数を求める画素に収まるように整数型にしておく
            yline = min(max(yline,1),size(bw,1));   % 目的変数が画像内に収まるように変更する。
            ind = sub2ind(size(bw),yline,xline);  % 座標から画像位置に変換
            
            line(ind) = 1;    % 線を描画
        end
        % 入力ポート名
        function inputName = getInputNamesImpl(obj)
            inputName = 'BW';
        end
        % 出力ポート名        
        function [outputName1,outputName2] = getOutputNamesImpl(obj)
            outputName1 = 'Line';
            outputName2 = 'P';
        end
        % アイコン
        function icon = getIconImpl(obj)
           icon = 'BW to Line';
        end
    end
end
