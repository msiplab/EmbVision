classdef Hsv2RgbSystem < matlab.System 
    % HSV2RGBSYSTEM HSV から RGB への変換
    %    
    methods (Access = protected)
        % ステップ
        function [imgR,imgG,imgB] = stepImpl(obj,imgH,imgS,imgV)
            imgIn  = cat(3,imgH,imgS,imgV);
            imgOut = hsv2rgb(imgIn);
            imgR = imgOut(:,:,1);
            imgG = imgOut(:,:,2);
            imgB = imgOut(:,:,3);
        end
        % 入力ポート名
        function [inputName1,inputName2,inputName3] = getInputNamesImpl(obj)
            inputName1 = 'H';
            inputName2 = 'S';
            inputName3 = 'V';
        end
        % 出力ポート名        
        function [outputName1,outputName2,outputName3] = getOutputNamesImpl(obj)
            outputName1 = 'R';
            outputName2 = 'G';
            outputName3 = 'B';
        end
        % アイコン
        function icon = getIconImpl(obj)
           icon = sprintf('HSV to RGB');
        end   
    end    
end