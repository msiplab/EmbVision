classdef FrameAveSystemTestCase < matlab.unittest.TestCase
    %FRAMEAVESYSTEMTESTCASE FrameAveSystem �̃e�X�g�P�[�X
    properties
    end
    methods (Test)
        function testFirstFrame(testCase)
            % ����
            width  = 12;
            height = 16;
            % ���̓t���[��
            frame1 = rand(height,width,3);
            % ���Ғl
            cnt0Expctd = [];
            cnt1Expctd = 1;
            res1Expctd = frame1;
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = FrameAveSystem();
            % ������Ԃ̌���
            state      = obj.getDiscreteState();
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % ��������
            res1Actual = obj.step(frame1);
            state      = obj.getDiscreteState();
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
            frame1 = rand(height,width,3);
            frame2 = rand(height,width,3);
            frame3 = rand(height,width,3);            
            % ���Ғl
            cnt1Expctd = 1;
            cnt2Expctd = 2;            
            cnt3Expctd = 3;                        
            res1Expctd = frame1;
            res2Expctd = (frame1+frame2)/2;
            res3Expctd = (frame2+frame3)/2;
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = FrameAveSystem();
            % ��P�t���[����������
            res1Actual = obj.step(frame1);
            state      = obj.getDiscreteState();
            cnt1Actual = state.Count;
            % ��Q�t���[����������
            res2Actual = obj.step(frame2);
            state      = obj.getDiscreteState();
            cnt2Actual = state.Count;            
            % ��R�t���[����������
            res3Actual = obj.step(frame3);
            state      = obj.getDiscreteState();
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
            frame1 = rand(height,width,3);
            % ���Ғl
            cnt0Expctd = [];
            cnt1Expctd = 1;
            cntrExpctd = 0;
            % �^�[�Q�b�g�N���X�̃C���X�^���X��
            obj = FrameAveSystem();
            % ������Ԃ̌���
            state      = obj.getDiscreteState();
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % ���t���[��������̏�Ԃ̌���
            obj.step(frame1);
            state      = obj.getDiscreteState();
            cnt1Actual = state.Count;
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
            % ���Z�b�g��̏�Ԃ̌���
            reset(obj);
            state      = obj.getDiscreteState();
            cntrActual = state.Count;
            testCase.verifyEqual(cntrActual,cntrExpctd)                        
        end        
    end
end