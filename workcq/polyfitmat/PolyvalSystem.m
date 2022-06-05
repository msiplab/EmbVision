classdef PolyvalSystem < matlab.System
% POLYVALSYSTEM 多項式を画像にプロットする
    methods(Access = protected)
        function setupImpl(obj,P,Gray)
        end
        function output = stepImpl(obj,P,Gray)
            x = 1:size(Gray,2); % 説明変数を画像の端から端とする
            y = min(max(int32(polyval(P,x)),1),size(Gray,1));   % 多項式から目的変数を求める
            ind = sub2ind(size(Gray),y,x);  % 座標から画像位置に変換
            Gray(ind) = 256;    % 画像位置に指定の色を代入
            output = Gray;  % 出力
        end
        function resetImpl(obj)
        end
        % 入力ポート名
        function [inputName1, inputName2] = getInputNamesImpl(obj)
            inputName1 = 'P';
            inputName2 = 'Gray';
        end
        % 出力ポート名        
        function outputName = getOutputNamesImpl(obj)
            outputName = 'output';
        end
        % アイコン
        function icon = getIconImpl(obj)
           icon = 'P to y';
        end        
    end
end