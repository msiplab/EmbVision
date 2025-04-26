classdef Rgb2GraySystem < matlab.System 
    % RGB2GRAYSYSTEM RGB から グレースケールへの変換
    %
    properties
    end
    properties (DiscreteState)
    end
    properties (Access = private)
    end
    methods (Access = protected)
        % セットアップ（最初のステップ直前に実行）
        function setupImpl(obj,srcImg)
        end
        % ステップ
        function resImg = stepImpl(obj,srcImg)
            resImg = rgb2gray(srcImg);
        end
        % リセット
        function resetImpl(obj)
        end    
        % 入力ポート名
        function inputName = getInputNamesImpl(obj)
            inputName = 'RGB';
        end
        % 出力ポート名        
        function outputName = getOutputNamesImpl(obj)
            outputName = 'Gray';
        end
        % アイコン
        function icon = getIconImpl(obj)
           icon = sprintf('RGB to Gray');
        end        
    end
end
