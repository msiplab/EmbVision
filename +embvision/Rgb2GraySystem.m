classdef Rgb2GraySystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %RGB2GRAYSYSTEM RGB -> GRAY �ϊ�
    %   RGB����O���[�X�P�[���ւ̕ϊ������s
    properties
    end
    
    methods
        
        function obj = Rgb2GraySystem(varargin)
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
            %    imgIn : RGB�摜
            %
            %  �o��
            %    imgOut: Gray�摜
            %
            
            % RGB->Gray�ϊ�
            imgOut = rgb2gray(imgIn);
        end
        
        function N = getNumInputsImpl(~)
            % ���͒[�q��
            N = 1; 
        end
        
        function n1 = getInputNamesImpl(~)
            % ���͒[�q��
            n1 = 'RGB';
        end                
        
        function N = getNumOutputsImpl(~)
            % �o�͒[�q��
            N = 1; 
        end
        
        function n1 = getOutputNamesImpl(~)
            % �o�͒[�q��
            n1 = 'GRAY';
        end                        
        
        function icon = getIconImpl(~)
            % �u���b�N��
            icon = 'RGB2GRAY';
        end        
        
    end
    
end

