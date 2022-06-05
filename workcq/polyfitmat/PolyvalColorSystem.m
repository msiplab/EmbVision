classdef PolyvalColorSystem < matlab.System
% POLYVALSYSTEM 多項式を画像にプロットする
    methods(Access = protected)
        function setupImpl(obj,P,RGB)
        end
        function output = stepImpl(obj,P,RGB)
            x = 1:size(RGB,2); % 説明変数を画像の端から端とする
            y = min(max(int32(polyval(P,x)),1),size(RGB,1));   % 多項式から目的変数を求める
            ind = sub2ind(size(RGB(:,:,1)),y,x);  % 座標から画像位置に変換

            % カラー画像を赤、緑、青と分ける
            R = RGB(:,:,1);
            G = RGB(:,:,2);
            B = RGB(:,:,3);

            % 色要素の画像位置に色を代入（新潟大学カラー）
            R(ind) = 0;
            G(ind) = 133;
            B(ind) = 85;

            output = cat(3, R, G, B);  % 出力
        end
        function resetImpl(obj)
        end
        % 入力ポート数
        function N = getNumInputsImpl(obj)
            N = 2; 
        end
        % 出力ポート数        
        function N = getNumOutputsImpl(obj)
            N = 1;
        end      
        % 入力ポート名
        function [inputName1, inputName2] = getInputNamesImpl(obj)
            inputName1 = 'P';
            inputName2 = 'RGB';
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
