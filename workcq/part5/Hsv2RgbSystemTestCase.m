classdef Hsv2RgbSystemTestCase < matlab.unittest.TestCase
    %HSV2RGBSYSTEMTESTCASE Hsv2RgbSystem �̃e�X�g�P�[�X
    properties
    end
    methods (Test)
        function testSize(testCase)
            % ����
            h = zeros(1,2);
            s = zeros(1,2);
            v = zeros(1,2);
            % ���Ғl
            szRExpctd = [ 1 2 ];
            szGExpctd = [ 1 2 ];
            szBExpctd = [ 1 2 ];
            % �^�[�Q�b�g�̃C���X�^���X��
            obj = Hsv2RgbSystem();
            % ���s����
            [r,g,b] = obj.step(h,s,v);
            % �T�C�Y�̌���
            testCase.verifySize(r,szRExpctd);
            testCase.verifySize(g,szGExpctd);
            testCase.verifySize(b,szBExpctd);
        end
        function testValues(testCase)
            % ����
            h = rand(4,6);
            s = rand(4,6);
            v = rand(4,6);
            hsv = cat(3,h,s,v); % �O�����z��
            % ���Ғl
            rgbExpctd = hsv2rgb(hsv); 
            % �^�[�Q�b�g�̃C���X�^���X��
            obj = Hsv2RgbSystem();
            % ���s����
            [rActual,gActual,bActual] = obj.step(h,s,v);
            % �z��̒l�̌���
            testCase.verifyEqual(rActual,rgbExpctd(:,:,1));
            testCase.verifyEqual(gActual,rgbExpctd(:,:,2));
            testCase.verifyEqual(bActual,rgbExpctd(:,:,3));
        end
    end
end