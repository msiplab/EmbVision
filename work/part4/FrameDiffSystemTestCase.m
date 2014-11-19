classdef FrameDiffSystemTestCase < matlab.unittest.TestCase
    %FRAMEDIFFSYSTEMTESTCASE FrameDiffSystem のテストケース
    properties
    end
    methods (Test)
        function testFirstFrame(testCase)
            % 準備
            width  = 12;
            height = 16;
            % 入力フレーム
            frame1 = rand(height,width);
            % 期待値
            cnt0Expctd = [];
            cnt1Expctd = 1;
            res1Expctd = zeros(height,width);
            % ターゲットクラスのインスタンス化
            obj = FrameDiffSystem();
            % 初期状態の検証
            state      = getDiscreteState(obj);
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % 処理結果
            res1Actual = step(obj,frame1);
            state      = getDiscreteState(obj);
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
            frame1 = rand(height,width);
            frame2 = rand(height,width);
            frame3 = rand(height,width);            
            % 期待値
            cnt1Expctd = 1;
            cnt2Expctd = 2;            
            cnt3Expctd = 3;                        
            res1Expctd = zeros(height,width);
            res2Expctd = (frame2-frame1);
            res3Expctd = (frame3-frame2);
            % ターゲットクラスのインスタンス化
            obj = FrameDiffSystem();
            % 第１フレーム処理結果
            res1Actual = step(obj,frame1);
            state      = getDiscreteState(obj);
            cnt1Actual = state.Count;
            % 第２フレーム処理結果
            res2Actual = step(obj,frame2);
            state      = getDiscreteState(obj);
            cnt2Actual = state.Count;            
            % 第３フレーム処理結果
            res3Actual = step(obj,frame3);
            state      = getDiscreteState(obj);
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
            frame1 = rand(height,width);
            % 期待値
            cnt0Expctd = [];
            cnt1Expctd = 1;
            cntrExpctd = 0;
            % ターゲットクラスのインスタンス化
            obj = FrameDiffSystem();
            % 初期状態の検証
            state      = getDiscreteState(obj);
            cnt0Actual = state.Count;
            testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
            % 第一フレーム処理後の状態の検証
            step(obj,frame1);
            state      = getDiscreteState(obj);
            cnt1Actual = state.Count;
            testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
            % リセット後の状態の検証
            reset(obj);
            state      = getDiscreteState(obj);
            cntrActual = state.Count;
            testCase.verifyEqual(cntrActual,cntrExpctd)                        
        end        
    end
end