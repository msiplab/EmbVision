classdef FrameDiffSystemTestCase < matlab.unittest.TestCase
    %FRAMEDIFFSYSTEMTESTCASE FrameDiffSystem �̃e�X�g�P�[�X
    properties
    end
    methods (Test)
        function testFirstFrame(testCase)
            % ����
            width  = 12;
            height = 16;
            % ���̓t���[��
            frame1 = rand(height,width);
            % ���Ғl
            cnt0Expctd = [];
            cnt1Expctd = 1;
            res1Expctd = zeros(height,width);
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = FrameDiffSystem();
            % ������Ԃ̌���
            state      = getDiscreteState(obj);
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % ��������
            res1Actual = step(obj,frame1);
            state      = getDiscreteState(obj);
            cnt1Actual = state.Count;
            % �������ʂ̌���
            testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
        end
        function testThreeFrames(testCase)
            % ����
            width  = 12;
            height = 16;
            % ���̓t���[��
            frame1 = rand(height,width);
            frame2 = rand(height,width);
            frame3 = rand(height,width);            
            % ���Ғl
            cnt1Expctd = 1;
            cnt2Expctd = 2;            
            cnt3Expctd = 3;                        
            res1Expctd = zeros(height,width);
            res2Expctd = (frame2-frame1);
            res3Expctd = (frame3-frame2);
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = FrameDiffSystem();
            % ��P�t���[����������
            res1Actual = step(obj,frame1);
            state      = getDiscreteState(obj);
            cnt1Actual = state.Count;
            % ��Q�t���[����������
            res2Actual = step(obj,frame2);
            state      = getDiscreteState(obj);
            cnt2Actual = state.Count;            
            % ��R�t���[����������
            res3Actual = step(obj,frame3);
            state      = getDiscreteState(obj);
            cnt3Actual = state.Count;            
            % �������ʂ̌���
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
            testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
            testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
            testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
            testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
            testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
        end        
        function testReset(testCase)
            % ����
            width  = 12;
            height = 16;
            % ���̓t���[��
            frame1 = rand(height,width);
            % ���Ғl
            cnt0Expctd = [];
            cnt1Expctd = 1;
            cntrExpctd = 0;
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = FrameDiffSystem();
            % ������Ԃ̌���
            state      = getDiscreteState(obj);
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % ���t���[��������̏�Ԃ̌���
            step(obj,frame1);
            state      = getDiscreteState(obj);
            cnt1Actual = state.Count;
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
            % ���Z�b�g��̏�Ԃ̌���
            reset(obj);
            state      = getDiscreteState(obj);
            cntrActual = state.Count;
            testCase.verifyEqual(cntrActual,cntrExpctd)                        
        end        
    end
end