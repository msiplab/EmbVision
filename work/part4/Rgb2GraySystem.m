classdef Rgb2GraySystem < matlab.System
    % RGB2GRAYSYSTEM RGB ���� �O���[�X�P�[���ւ̕ϊ�
    %
    properties
    end
    properties (DiscreteState)
    end
    properties (Access = private)
    end
    methods (Access = protected)
        % �Z�b�g�A�b�v�i�ŏ��̃X�e�b�v���O�Ɏ��s�j
        function setupImpl(obj,srcImg)
        end
        % �X�e�b�v
        function resImg = stepImpl(obj,srcImg)
            resImg = rgb2gray(srcImg);
        end
        % ���Z�b�g
        function resetImpl(obj)
        end
    end
end
