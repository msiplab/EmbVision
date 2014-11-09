classdef Hsv2RgbSystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %HSV2RGBSYSTEM HSV -> RGB �ϊ�
    %   HSV����RGB�ւ̕ϊ������s
    properties (Access = private)
        imgIn
    end
    
    methods
        
        function obj = Hsv2RgbSystem(varargin)
            % �R���X�g���N�^
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)
        
        function setupImpl(obj,imgH,~,~)
            obj.imgIn = zeros(size(imgH,1),size(imgH,2),3);
        end
        
        function [imgR,imgG,imgB] = stepImpl(obj,imgH,imgS,imgV)
            % STEP �X�e�b�v�֐�
            %   
            %    [imgR,imgG,imgB] = step(obj,imgH,imgS,imgV)
            %
            %  ����
            %    imgH : H�摜
            %    imgS : H�摜
            %    imgV : H�摜
            %
            %  �o��
            %    imgR : R�摜
            %    imgG : G�摜
            %    imgB : B�摜
            %
            
            % �����^�ւ̕ϊ�
            imgH = im2single(imgH); 
            imgS = im2single(imgS); 
            imgV = im2single(imgV); 
            obj.imgIn(:,:,1) = imgH;
            obj.imgIn(:,:,2) = imgS;
            obj.imgIn(:,:,3) = imgV;
            
            % RGB->Gray�ϊ�
            imgOut = hsv2rgb(obj.imgIn);
            imgR = imgOut(:,:,1);
            imgG = imgOut(:,:,2);
            imgB = imgOut(:,:,3);
        end
        
        function N = getNumInputsImpl(~)
            % ���͒[�q��
            N = 3; 
        end
        
        function [n1,n2,n3] = getInputNamesImpl(~)
            % ���͒[�q��
            n1 = 'H';
            n2 = 'S';
            n3 = 'V';
        end                
        
        function N = getNumOutputsImpl(~)
            % �o�͒[�q��
            N = 3; 
        end
        
        function [n1,n2,n3] = getOutputNamesImpl(~)
            % �o�͒[�q��
            n1 = 'R';
            n2 = 'G';
            n3 = 'B';
        end                        
        
        function icon = getIconImpl(~)
            % �u���b�N��
            icon = 'HSV2RGB';
        end        
        
    end
    
end