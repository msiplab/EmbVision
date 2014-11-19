classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
    %RGB2GRAYSYSTEMTESTCASE Rgb2GraySystem �̃e�X�g�P�[�X
    properties
    end
    methods (Test)
        function testSize(testCase)
            % ����
            u = zeros(1,2,3);   % 1�s2��3�����̎O�����z��
            % ���Ғl
            szExpctd = [ 1 2 ]; % 1�s2��̓񎟌��z��
            % �^�[�Q�b�g�̃C���X�^���X��
            obj = Rgb2GraySystem();
            % ���s����
            y = step(obj,u);
            % �T�C�Y�̌���
            testCase.verifySize(y,szExpctd);
        end
        function testValues(testCase)
            % ����
            u = rand(4,6,3);           % �O���������_���z��
            % ���Ғl
            arrayExpctd = rgb2gray(u); % �O���[�X�P�[���̊��Ғl
            % �^�[�Q�b�g�̃C���X�^���X��
            obj = Rgb2GraySystem();
            % ���s����
            arrayActual = step(obj,u);
            % �z��̒l�̌���
            testCase.verifyEqual(arrayActual,arrayExpctd);
        end
    end
end

