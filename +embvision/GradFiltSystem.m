classdef GradFiltSystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %GRADFILTER ���z�t�B���^
    %   ���z�t�B���^�����O�����s

    properties
        Kernel = [ 
            1 0 -1 ;
            1 0 -1 ;
            1 0 -1 ];
    end

    properties (Access = private, Nontunable, PositiveInteger)
        imgHeight
        imgWidth
    end
    
    methods
        
        function obj = GradFiltSystem(varargin)
            % �R���X�g���N�^
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)

         function setupImpl(obj,imgIn)
             
             % SETUP �֐�
             obj.imgHeight = size(imgIn,1);
             obj.imgWidth  = size(imgIn,2);
             
         end
        
        
        function [magOut, angOut] = stepImpl(obj,imgIn)
            % STEP �X�e�b�v�֐�
            %
            %    [magOut,angOut] = step(obj,imgIn)
            %
            %  ����
            %    imgIn : �摜
            %
            %  �o��
            %    magOut: ���z�m����
            %    angOut: ���z�Ίp
            %
            
            % �����^�ւ̕ϊ�
            imgIn = im2single(imgIn);
            
            % X�����̈ꎟ�����t�B���^
            gradXfull = conv2(imgIn,obj.Kernel);
            gradX = gradXfull(2:obj.imgHeight+1,2:obj.imgWidth+1);
            
            % Y�����̈ꎟ�����t�B���^
            gradYfull = conv2(imgIn,obj.Kernel.');
            gradY = gradYfull(2:obj.imgHeight+1,2:obj.imgWidth+1);
            
            % ���z�̑傫��
            magOut = sqrt(gradX.^2+gradY.^2);
            
            % ���z�̕Ίp
            angOut = atan2(gradY,gradX);
        end
        
        function N = getNumInputsImpl(~)
            % ���͒[�q��
            N = 1;
        end
        
        function n1 = getInputNamesImpl(~)
            % ���͒[�q��
            n1 = 'GRAY';
        end
        
        function N = getNumOutputsImpl(~)
            % �o�͒[�q��
            N = 2;
        end
        
        function [n1,n2] = getOutputNamesImpl(~)
            % �o�͒[�q��
            n1 = 'MAG';
            n2 = 'ANG';
        end
        
        function icon = getIconImpl(~)
            % �u���b�N��
            icon = 'GRAD_FILT';
        end

    end
    
end