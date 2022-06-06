classdef GradFiltSystem < matlab.System
    properties
        Kernel = [ 
             1  1  1 ; % �����������v���p�e�B
             0  0  0 ;
            -1 -1 -1 ];
    end
    properties (DiscreteState)
    end
    properties (Access = private)
    end
    methods
        % �R���X�g���N�^
        function obj = GradFiltSystem(varargin)
            setProperties(obj,nargin,varargin{:})
        end
    end
    methods (Access = protected)
        % �Z�b�g�A�b�v�i�ŏ��̃X�e�b�v���O�Ɏ��s�j
        function setupImpl(obj,srcImg)
        end
        % �X�e�b�v
        function [mag,ang] = stepImpl(obj,srcImg)
            X  = im2double(srcImg);
            Yv = conv2(obj.Kernel  ,X); % �������z�̌v�Z
            Yv = Yv(2:end-1,2:end-1);   % �����摜�̃N���b�s���O
            Yh = conv2(obj.Kernel.',X); % �������z�̌v�Z�@
            Yh = Yh(2:end-1,2:end-1);   % �����摜�̃N���b�s���O
            mag = sqrt(Yv.^2+Yh.^2);    % ���z�̑傫���̊��Ғl
            ang = atan2(Yv,Yh);         % ���z�̕Ίp�̂̊��Ғl
        end
        % ���Z�b�g
        function resetImpl(obj)
        end    
        % ���̓|�[�g��
        function inputName = getInputNamesImpl(obj)
            inputName = 'Gray';
        end
        % �o�̓|�[�g��        
        function [outputName1,outputName2] = getOutputNamesImpl(obj)
            outputName1 = 'Mag.';
            outputName2 = 'Ang.';
        end
        % �A�C�R��
        function icon = getIconImpl(obj)
           icon = sprintf('Grad. Filt.');
        end        
    end
end