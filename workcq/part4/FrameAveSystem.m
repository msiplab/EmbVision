classdef FrameAveSystem < matlab.System
    properties
        preFrame % �O�t���[��
    end
    properties (DiscreteState)
        Count    % �t���[���J�E���g
    end
    properties (Access = private)
    end
    methods (Access = protected)
        % �Z�b�g�A�b�v�i�ŏ��̃X�e�b�v���O�Ɏ��s�j
        function setupImpl(obj,srcFrame)
            % �O�t���[���̏�����
            obj.preFrame = srcFrame;
            % �t���[���J�E���g�̏�����
            obj.Count = 0;
        end
        % �X�e�b�v
        function resFrame = stepImpl(obj,srcFrame)
            % �t���[�����Ϗ��� 
            resFrame = (obj.preFrame + srcFrame)/2;
            % �O�t���[���̍X�V�����t���[��
            obj.preFrame = srcFrame;
            % �t���[���J�E���g�̃C���N�������g
            obj.Count = obj.Count+1;
        end
        % ���Z�b�g
        function resetImpl(obj)
            % �t���[���J�E���g�̃��Z�b�g
            obj.Count = 0;
        end
    end
end