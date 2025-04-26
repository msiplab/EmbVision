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
    end
end
