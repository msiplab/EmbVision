classdef GradFiltSystemTestCase < matlab.unittest.TestCase
    %GRADFILTSYSTEMTESTCASE GradFiltSystem �̃e�X�g�P�[�X
    properties
    end
    methods (Test)
        function testDefaultKernel(testCase)
            % ���Ғl
            kernelExpctd = [  1  1  1 ;
                              0  0  0 ;
                             -1 -1 -1 ];
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = GradFiltSystem();
            % �v���p�e�B�[ Kernel �̎擾
            kernelActual = get(obj,'Kernel');
            % �v���p�e�B�[ Kernel �̌���
            testCase.verifyEqual(kernelActual,kernelExpctd)
        end
        function testSobelKernel(testCase)
            % ���Ғl
            kernelExpctd = [  1  2  1 ;
                              0  0  0 ;
                             -1 -2 -1 ];
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = GradFiltSystem('Kernel',kernelExpctd);
            % �v���p�e�B�[ Kernel �̎擾
            kernelActual = get(obj,'Kernel');
            % �v���p�e�B�[ Kernel �̌���
            testCase.verifyEqual(kernelActual,kernelExpctd)
        end        
        function testStepWithPrewittKernel(testCase)
            % ����
            H = [  1  1  1 ;
                   0  0  0 ;
                  -1 -1 -1 ];
            % ���Ғl�̏���
            I  = imread('cameraman.tif');
            X  = im2double(I);
            Yv = conv2(H  ,X);        % �������z�̌v�Z
            Yv = Yv(2:end-1,2:end-1); % �����摜�̃N���b�s���O
            Yh = conv2(H.',X);        % �������z�̌v�Z�@
            Yh = Yh(2:end-1,2:end-1); % �����摜�̃N���b�s���O
            magExpctd = sqrt(Yv.^2+Yh.^2); % ���z�̑傫���̊��Ғl
            angExpctd = atan2(Yv,Yh);     % ���z�̕Ίp�̂̊��Ғl
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = GradFiltSystem();
            % ��������
            [magActual,angActual] = obj.step(X);
            % �������ʂ̌���
            testCase.verifyEqual(magActual,magExpctd,'AbsTol',1e-6)
            testCase.verifyEqual(angActual,angExpctd,'AbsTol',1e-6)
        end        
    end
end
