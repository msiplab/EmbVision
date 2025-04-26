classdef FrameAveSystemTestCase < matlab.unittest.TestCase
    %FRAMEAVESYSTEMTESTCASE FrameAveSystem のテストケース
    properties
    end
    methods (Test)
        function testFirstFrame(testCase)
            % 準備
            width  = 12;
            height = 16;
            % 入力フレーム
            frame1 = rand(height,width,3);
            % 期待値
            cnt0Expctd = [];
            cnt1Expctd = 1;
            res1Expctd = frame1;
            % ターゲットクラスのインスタンス化
            obj = FrameAveSystem();
            % 初期状態の検証
            state      = obj.getDiscreteState();
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % 処理結果
            res1Actual = obj.step(frame1);
            state      = obj.getDiscreteState();
            cnt1Actual = state.Count;
            % 処理結果の検証
            testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
        end
        function testThreeFrames(testCase)
            % 準備
            width  = 12;
            height = 16;
            % 入力フレーム
            frame1 = rand(height,width,3);
            frame2 = rand(height,width,3);
            frame3 = rand(height,width,3);            
            % 期待値
            cnt1Expctd = 1;
            cnt2Expctd = 2;            
            cnt3Expctd = 3;                        
            res1Expctd = frame1;
            res2Expctd = (frame1+frame2)/2;
            res3Expctd = (frame2+frame3)/2;
            % ターゲットクラスのインスタンス化
            obj = FrameAveSystem();
            % 第１フレーム処理結果
            res1Actual = obj.step(frame1);
            state      = obj.getDiscreteState();
            cnt1Actual = state.Count;
            % 第２フレーム処理結果
            res2Actual = obj.step(frame2);
            state      = obj.getDiscreteState();
            cnt2Actual = state.Count;            
            % 第３フレーム処理結果
            res3Actual = obj.step(frame3);
            state      = obj.getDiscreteState();
            cnt3Actual = state.Count;            
            % 処理結果の検証
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
            testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
            testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
            testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
            testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
            testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
        end        
        function testReset(testCase)
            % 準備
            width  = 12;
            height = 16;
            % 入力フレーム
            frame1 = rand(height,width,3);
            % 期待値
            cnt0Expctd = [];
            cnt1Expctd = 1;
            cntrExpctd = 0;
            % ターゲットクラスのインスタンス化
            obj = FrameAveSystem();
            % 初期状態の検証
            state      = obj.getDiscreteState();
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % 第一フレーム処理後の状態の検証
            obj.step(frame1);
            state      = obj.getDiscreteState();
            cnt1Actual = state.Count;
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
            % リセット後の状態の検証
            reset(obj);
            state      = obj.getDiscreteState();
            cntrActual = state.Count;
            testCase.verifyEqual(cntrActual,cntrExpctd)                        
        end        
    end
end