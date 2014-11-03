classdef Hsv2RgbSystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %HSV2RGBSYSTEM HSV -> RGB �ϊ�
    %   HSV����RGB�ւ̕ϊ������s
    properties
    end
    
    methods
        
        function obj = Hsv2RgbSystem(varargin)
            % �R���X�g���N�^
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)
        
        function imgOut = stepImpl(~,imgIn)
            % STEP �X�e�b�v�֐�
            %   
            %    imgOut = step(obj,imgIn)
            %
            %  ����
            %    imgIn : HSV�摜
            %
            %  �o��
            %    imgOut: RGB�摜
            %
            
            % �����^�ւ̕ϊ�
            imgIn = im2single(imgIn);
            
            % RGB->Gray�ϊ�
            imgOut = hsv2rgb(imgIn);
        end
        
        function N = getNumInputsImpl(~)
            % ���͒[�q��
            N = 1; 
        end
        
        function n1 = getInputNamesImpl(~)
            % ���͒[�q��
            n1 = 'HSV';
        end                
        
        function N = getNumOutputsImpl(~)
            % �o�͒[�q��
            N = 1; 
        end
        
        function n1 = getOutputNamesImpl(~)
            % �o�͒[�q��
            n1 = 'RGB';
        end                        
        
        function icon = getIconImpl(~)
            % �u���b�N��
            icon = 'HSV2RGB';
        end        
        
    end
    
end

