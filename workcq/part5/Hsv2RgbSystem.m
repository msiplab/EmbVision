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
    end    
end