classdef Hsv2RgbSystem < matlab.System
    
    methods (Access = protected)
        
        function [imgR,imgG,imgB] = stepImpl(obj,imgH,imgS,imgV)
            imgIn = cat(3,imgH,imgS,imgV);
            imgOut = hsv2rgb(imgIn);
            imgR = imgOut(:,:,1);
            imgG = imgOut(:,:,2);
            imgB = imgOut(:,:,3);
        end
        
    end    
end