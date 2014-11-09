classdef Rgb2GraySystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %RGB2GRAYSYSTEM RGB -> GRAY �ϊ�
    %   RGB����O���[�X�P�[���ւ̕ϊ������s
    properties (Access = private)
        imgIn
    end
    
    methods
        
        function obj = Rgb2GraySystem(varargin)
            % �R���X�g���N�^
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)
        
        function setupImpl(obj,imgR,~,~)
            obj.imgIn = zeros(size(imgR,1),size(imgR,2),3);
        end
        
        function imgY = stepImpl(obj,imgR,imgG,imgB)
            % STEP �X�e�b�v�֐�
            %   
            %    imgY = step(obj,imgR,imgG,imgB)
            %
            %  ����
            %    imgR : R�摜
            %    imgG : G�摜
            %    imgB : B�摜            
            %
            %  �o��
            %    imgY : Gray�摜
            %
            
            % RGB->Gray�ϊ�
            obj.imgIn(:,:,1) = im2single(imgR); 
            obj.imgIn(:,:,2) = im2single(imgG); 
            obj.imgIn(:,:,3) = im2single(imgB); 
            imgY = rgb2gray(obj.imgIn);
        end
        
        function N = getNumInputsImpl(~)
            % ���͒[�q��
            N = 3; 
        end
        
        function [n1,n2,n3] = getInputNamesImpl(~)
            % ���͒[�q��
            n1 = 'R';
            n2 = 'G';
            n3 = 'B';
        end                
        
        function N = getNumOutputsImpl(~)
            % �o�͒[�q��
            N = 1; 
        end
        
        function n1 = getOutputNamesImpl(~)
            % �o�͒[�q��
            n1 = 'Y';
        end                        
        
        function icon = getIconImpl(~)
            % �u���b�N��
            icon = 'RGB2GRAY';
        end        
        
    end
    
end