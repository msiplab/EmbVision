classdef Hsv2RgbSystem < matlab.System 
    % HSV2RGBSYSTEM HSV ���� RGB �ւ̕ϊ�
    %    
    methods (Access = protected)
        % �X�e�b�v
        function [imgR,imgG,imgB] = stepImpl(obj,imgH,imgS,imgV)
            imgIn  = cat(3,imgH,imgS,imgV);
            imgOut = hsv2rgb(imgIn);
            imgR = imgOut(:,:,1);
            imgG = imgOut(:,:,2);
            imgB = imgOut(:,:,3);
        end
        % ���̓|�[�g��
        function [inputName1,inputName2,inputName3] = getInputNamesImpl(obj)
            inputName1 = 'H';
            inputName2 = 'S';
            inputName3 = 'V';
        end
        % �o�̓|�[�g��        
        function [outputName1,outputName2,outputName3] = getOutputNamesImpl(obj)
            outputName1 = 'R';
            outputName2 = 'G';
            outputName3 = 'B';
        end
        % �A�C�R��
        function icon = getIconImpl(obj)
           icon = sprintf('HSV to RGB');
        end   
    end    
end