classdef FrameBinarizeSystem < matlab.System
    properties
    end
    properties (DiscreteState)
    end
    properties (Access = private)
    end
    methods(Access = protected)
        % セットアップ（最初のステップ直前に実行）
        function setupImpl(obj,srcImg)
        end
        function resImg = stepImpl(obj,srcImg)
            resImg = imbinarize(srcImg);
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
            inputName = 'Gray';
        end
        % 出力ポート名        
        function outputName = getOutputNamesImpl(obj)
            outputName = 'BW';
        end
        % アイコン
        function icon = getIconImpl(obj)
           icon = 'Gray to BW';
        end        
    end
end
