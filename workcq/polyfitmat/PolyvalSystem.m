classdef PolyvalSystem < matlab.System
    methods(Access = protected)
        function setupImpl(obj,P,Gray)
        end
        function output = stepImpl(obj,P,Gray)
            x = 1:size(Gray,2);
            y = min(max(int32(polyval(P,x)),1),size(Gray,1));
            ind = sub2ind(size(Gray),y,x);
            Gray(ind) = 128;
            output = Gray;
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
